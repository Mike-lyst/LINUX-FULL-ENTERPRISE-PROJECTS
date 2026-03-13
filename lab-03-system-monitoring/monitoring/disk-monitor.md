### Disk monitoring

**Purpose**: Track disk usage and I/O activity to prevent outages.

*Key Steps*:

Check free disk space across partitions with df -h.

Analyze disk usage per directory with du.

Identify high I/O processes using iotop.

Locate largest files to prevent full disks.

*Enterprise Relevance*:

Prevent outages caused by full disks.

Plan storage capacity and optimize usage.

Prepare for disk-related alerts in monitoring tools.

*Commands*
````bash
df -h                       # Disk space usage
du -sh /var/*                # Directory size summary
iotop                        # Real-time disk I/O monitoring
find / -type f -exec du -h {} + | sort -rh | head -n 20  # Largest files
````