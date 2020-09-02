#!/usr/bin/env python3
import psutil
cpu_count = psutil.cpu_count()
cpu_time = psutil.cpu_percent(interval=1)
print(cpu_time)