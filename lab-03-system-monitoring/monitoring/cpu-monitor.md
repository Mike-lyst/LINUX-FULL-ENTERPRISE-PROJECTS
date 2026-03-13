### CPU Monitoring
**Purpose:** Monitor and stress-test CPU usage in Linux.

**Commands Used:**
```bash
top                 # Real-time CPU and process monitoring
htop                # Interactive process monitor
yes > /dev/null &   # Simulate CPU stress
pkill yes           # Stop stress process
```
Key Steps:

Launch top or htop to observe CPU usage.

-Identify top CPU-consuming processes.

-Simulate CPU stress with yes > /dev/null &.

-Observe spike in CPU usage.

-Kill high-load processes using pkill yes.

Enterprise Relevance:

-Respond quickly to CPU spikes in production servers.

-Plan for scaling and capacity.

-Provide evidence for automated alerting and monitoring tools.