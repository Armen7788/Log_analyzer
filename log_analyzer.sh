#!/bin/bash

RED="\033[31m"
YELLOW="\033[33m"
GREEN="\033[32m"
NC="\033[0m" 

echo -e "${GREEN}==== LOG ANALYZER ====${NC}"

logfile="${1:-/var/log/syslog}"

echo "file: $logfile"
echo

if [ ! -f "$logfile" ] && [ ! -d "$logfile" ]; then
  echo "ERROR: path not found -> $logfile"
  exit 1
fi

echo -e "${RED}Total ERROR:${NC}"
grep -i "error" "$logfile" | wc -l
echo 

echo -e "${YELLOW}Total WARNING:${NC}"
grep -i "warning" "$logfile" | wc -l
echo

echo -e "${RED}Last 5 errors:${NC}"
grep -i "error" "$logfile" | tail -n 5
echo


echo -e "${RED}Files with errors:${NC}"

if [ -d "$logfile" ]; then
  grep -i "error" "$logfile"/* 2>/dev/null | cut -d ":" -f1 | sort | uniq
else
  grep -iH "error" "$logfile" | cut -d ":" -f1 | sort | uniq
fi

echo
