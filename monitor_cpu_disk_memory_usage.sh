#!/bin/bash

# Configuration Thresholds (%)
MEM_THRESHOLD=80
CPU_THRESHOLD=80
DISK_THRESHOLD=80

# Email Configuration
EMAIL="srinivasapasla@gmail.com"
SUBJECT="System Health Alert: $(hostname)"

# Initialize alert triggers and body message
TRIGGER_ALERT=false
EMAIL_BODY="System Health Alert Summary:\n\n"

# 1. MEMORY USAGE CHECK
TOTAL_MEM=$(free | awk '/^Mem:/{print $2}')
AVAILABLE_MEM=$(free | awk '/^Mem:/{print $7}')
USED_MEM=$((TOTAL_MEM - AVAILABLE_MEM))
MEM_PERCENT=$((USED_MEM * 100 / TOTAL_MEM))

if [ "$MEM_PERCENT" -gt "$MEM_THRESHOLD" ]; then
    TRIGGER_ALERT=true
    EMAIL_BODY="${EMAIL_BODY}[CRITICAL] Memory Usage is at ${MEM_PERCENT}% (Threshold: ${MEM_THRESHOLD}%)\n"
fi

# 2. CPU USAGE CHECK
# Calculates CPU usage by checking idle time via 'top'
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print int($1)}')
CPU_PERCENT=$((100 - CPU_IDLE))

if [ "$CPU_PERCENT" -gt "$CPU_THRESHOLD" ]; then
    TRIGGER_ALERT=true
    EMAIL_BODY="${EMAIL_BODY}[CRITICAL] CPU Usage is at ${CPU_PERCENT}% (Threshold: ${CPU_THRESHOLD}%)\n"
fi

# 3. DISK USAGE CHECK
# Checks the root file system (/). Change "/" to specific mounts if needed (e.g., "/data")
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_PERCENT" -gt "$DISK_THRESHOLD" ]; then
    TRIGGER_ALERT=true
    EMAIL_BODY="${EMAIL_BODY}[CRITICAL] Disk Usage (/) is at ${DISK_PERCENT}% (Threshold: ${DISK_THRESHOLD}%)\n"
fi

# SEND EMAIL IF AN ALERT WAS TRIGGERED
if [ "$TRIGGER_ALERT" = true ]; then
    
    # Append system diagnostics diagnostic information
    DIAGNOSTICS=$(cat <<EOF

========================================
SYSTEM DIAGNOSTIC SNAPSHOT
========================================

Top 5 Resource-Consuming Processes:
$(ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 6)

Memory Status:
$(free -h)

Disk Space Status:
$(df -h /)
EOF
)
    
    # Send the combined alert email
    echo -e "${EMAIL_BODY}${DIAGNOSTICS}" | mail -s "$SUBJECT" "$EMAIL"
fi
