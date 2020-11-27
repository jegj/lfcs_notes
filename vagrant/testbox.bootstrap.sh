#!/bin/bash -e
set -a
LOG=/vagrant/tmp/log/boot.log
set +a

NODE_VER=${NODE_VER:-10.x}
PGVERSION=${PGVERSION:-10}
PGDATABASE=${PGDATABASE:-pgrbackup_test}
PGPORT=${PGPORT:-5433}
PGUSER=${PGUSER:-postgres}
PGPASSWORD=${PGPASSWORD:-devved}
DB_DIR=${DB_DIR:-/home/vagrant/pgrbackup/vagrant/pgscripts/}
WT_DIR=${WT_DIR:-/home/vagrant/pgrbackup/vagrant/watchtower/}
WT_DEB=${WT_DEB:-watchtower-2.6.6-beta-all.deb}
TEL_CO=${TEL_CO:-/home/vagrant/pgrbackup/vagrant/telegraf/telegraf.conf}

mkdir -p /vagrant/tmp/log

# Hosts files
HOSTS=/etc/hosts

display() {
	echo -e "\n-----> "$0": "$*
}


print_db_usage () {
  echo "Your Postgres environment has been setup"
  echo ""
  echo "  Port: $PGPORT"
  echo "  Database: $PGDATABASE"
  echo "  Username: $PGUSER"
  echo "  Password: $PGPASSWORD"
  echo ""
  echo "psql access to app database user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo "  PGUSER=$PGUSER PGPASSWORD=$PGPASSWORD psql -h localhost $PGDATABASE"
  echo ""
  echo "Env variable for application development:"
  echo "  DATABASE_URL=postgresql://$PGUSER:$PGPASSWORD@*:$PGPORT/$PGDATABASE"
  echo ""
  echo "Local command to access the database via psql:"
  echo "  PGUSER=$PGUSER PGPASSWORD=$PGPASSWORD psql -h localhost -p $PGPORT $PGDATABASE"
  echo ""
 echo "  Getting into the box (terminal):"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo ""
}

export DEBIAN_FRONTEND=noninteractive

PROVISIONED_ON=/etc/vm_provision_on_timestamp
if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo ""
  print_db_usage
  exit
fi

chown vagrant $HOSTS


display add postgresql apt sources
PG_REPO_APT_SOURCE=/etc/apt/sources.list.d/pgdg.list
if [ ! -f "$PG_REPO_APT_SOURCE" ]
then
  # Add PG apt repo:
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > "$PG_REPO_APT_SOURCE"

  # Add PGDG repo key:
  wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
fi

display update apt
apt-get update
#apt-get -y upgrade #too slow - instead, keep the virtual box up-to-date


display Install PostgreSQL
echo "install postgresql version ${PGVERSION}"
# -qq implies -y --force-yes
#sudo apt-get install -qq "postgresql-$PGVERSION" "postgresql-contrib-$PGVERSION"
# Install dev version of postgresql to support debugging
sudo apt-get install  -y "postgresql-server-dev-$PGVERSION" "postgresql-contrib-$PGVERSION"


display Configure PostgreSQL
display Listen on localhost connections
PG_CONF="/etc/postgresql/$PGVERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PGVERSION/main/pg_hba.conf"


display update postgres user password
cat << EOF | su - postgres -c psql
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD '$PGPASSWORD';
EOF


display Edit postgresql.conf to change listen address to *
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"


display Edit postgresql.conf to change port
if [ ! -z "$PGPORT" ]
then
	sed -i "/port = /c\port = $PGPORT" "$PG_CONF"
fi


display Append to pg_hba.conf to add md5 auth on all users:
echo "host    all             all             all                     md5" >> "$PG_HBA"


display Restart PostgreSQL :
service postgresql restart


display create test db :
cat << EOF | su - postgres -c psql
-- Create extensions:
-- Create the database:
CREATE DATABASE $PGDATABASE WITH OWNER $PGUSER;
-- auto explain for analyse all queries and inside functions
LOAD 'auto_explain';
SET auto_explain.log_min_duration = 0;
SET auto_explain.log_analyze = true;
EOF

display Restart PostgreSQL again :
service postgresql restart


display iterate and execute sql files of DB_DIR
display find the deploy files at ${DB_DIR}
display list the files: $(find ${DB_DIR} -name '*.slq' | sort)

for f in $(find -L ${DB_DIR} -name '*.sql' | sort); do
    file=$f;
    case "$file" in
    *.sql)  echo $0 running $file; echo $file >> database.err;  su - postgres -c "psql --port=$PGPORT --dbname=$PGDATABASE" < "$file" 2>> database.err && echo ;;
    *)      echo $0 $file;;
    esac
done;

# Installing Nodejs
apt-get -y install build-essential
curl -sL "https://deb.nodesource.com/setup_$NODE_VER" | sudo -E bash -

echo "install node version ${NODE_VER}"
sudo apt-get install -y nodejs

# Tag the provision time:
date > "$PROVISIONED_ON"

echo "Successfully created postgres dev virtual machine with Postgres"
echo ""
print_db_usage
