Key Steps:

Check total, used, and free memory using free -h.

Monitor top memory-consuming processes.

Observe swap usage.

Track memory trends with top or htop.

Enterprise Relevance:

Detect memory leaks or abnormal usage.

Prevent system slowdowns and crashes.

Support proactive monitoring in enterprise environments.

*Commands*
```bash
free -h                     # Show memory and swap usage
swapon -s                    # Check active swap
ps aux --sort=-%mem | head -n 10  # Top memory-consuming processes
top / htop                   # Real-time memory observation
````