#!/bin/bash

# Variables
LOG_FILE="/var/log/nginx/access.log"
REPORT_FILE="/var/log/nginx/report.log"

# Extract and count 404 errors
echo "Number of 404 errors:" > $REPORT_FILE
grep "404" $LOG_FILE | wc -l >> $REPORT_FILE

# Find the most requested pages
echo -e "\nMost requested pages:" >> $REPORT_FILE
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -10 >> $REPORT_FILE

# Find IP addresses with the most requests
echo -e "\nIP addresses with the most requests:" >> $REPORT_FILE
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -10 >> $REPORT_FILE

echo "Log analysis report generated at $(date)." >> $REPORT_FILE
