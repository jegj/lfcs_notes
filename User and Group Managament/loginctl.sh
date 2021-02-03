#!/bin/bash

# List sessions
loginctl list-sessions

# Show session info
loginctl show-session <id>

# Show status
loginctl session-status <id>

# Kill session
loginctl kill-session <id>