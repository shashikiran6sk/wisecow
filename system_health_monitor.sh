#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "Alert: CPU usage is above $CPU_THRESHOLD% (Current: $CPU_USAGE%)" >> /var/log/sys_health.log
fi

# Check memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "Alert: Memory usage is above $MEMORY_THRESHOLD% (Current: $MEMORY_USAGE%)" >> /var/log/sys_health.log
fi

# Check disk usage
DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    echo "Alert: Disk usage is above $DISK_THRESHOLD% (Current: $DISK_USAGE%)" >> /var/log/sys_health.log
fi

# Check running processes
PROCESS_COUNT=$(ps aux | wc -l)
echo "Current running processes: $PROCESS_COUNT" >> /var/log/sys_health.log
