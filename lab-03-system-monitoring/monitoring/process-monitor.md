Key Steps:

List running processes with ps aux.

Sort by CPU or memory usage to identify bottlenecks.

Monitor interactively with top or htop.

Stop unresponsive or resource-heavy processes.

Verify service health using systemctl.

Enterprise Relevance:

Identify runaway processes and bottlenecks.

Maintain uptime and service availability.

Supports incident response and root cause analysis.

*Commands*
````bash
 ps aux                       # List all processes
ps aux --sort=-%cpu | head -n 10  # Top CPU processes
top / htop                   # Interactive process monitoring
kill <PID>                   # Kill unresponsive processes
systemctl status <service>   # Check service status
sudo systemctl restart <service> # Restart services
````