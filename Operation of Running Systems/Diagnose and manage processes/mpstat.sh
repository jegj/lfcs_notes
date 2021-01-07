#!/bin/bash

 sudo apt-get install sysstat

# Display 3 reports of statistics for all processors at two second intervals
mpstat -P ALL -u 2 3

# Display five reports of global statistics among all processors at two second intervals.
mpstat 2 5