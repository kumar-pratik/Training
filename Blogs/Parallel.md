# Introduction to GNU Parallel 
When you run commands on Linux, be they one at a time at the prompt or from a bash script, those commands run in sequence. The first command runs, followed by the second, followed by the third. Granted, the time between commands is so minuscule, the naked eye wouldn't notice. For some instances, that may not be the most efficient means of running commands. If you find yourself in a situation where you need multiple commands to be run at exactly the same time, what do you do?
You turn to GNU Parallel

## What is GNU Parallel?
GNU Parallel is a shell tool that enables the execution of jobs in parallel using one or more computers. A job can be a single command or input from a file containing such things as a list of commands, a list of files, a list of hosts, a list of users, a list of URLs, or a list of tables.

**Installing Parallel**
```
knoldus@knoldus-Vostro-3559:~$ sudo apt install parallel
```
## A small demo
1. I have 300+ MB of images that I want to compres using gzip.
```
knoldus@knoldus-Vostro-3559:/tmp/images/Pics$ ls -lt
total 332428
-rw-r--r-- 1 knoldus knoldus  100802 Feb  4  2019  IMG-20181029-WA0016.jpg
-rw-r--r-- 1 knoldus knoldus   78749 Feb  4  2019  IMG-20181029-WA0091.jpg
-rw-r--r-- 1 knoldus knoldus  180198 Feb  4  2019  IMG-20181029-WA0008.jpg
-rw-r--r-- 1 knoldus knoldus   81824 Feb  4  2019  IMG-20190108-WA0017.jpg
-rw-r--r-- 1 knoldus knoldus  491800 Feb  4  2019  IMG_20181025_161914.jpg
.
.
.
-rw-r--r-- 1 knoldus knoldus  539206 Feb  4  2019  IMG_20181127_150729.jpg
-rw-r--r-- 1 knoldus knoldus  434213 Feb  4  2019  IMG_20190131_152526.jpg
```
2. Lets compress these files using gzip and look at the time it takes to do this.
```
knoldus@knoldus-Vostro-3559:/tmp/images/Pics$ /usr/bin/time gzip -1 *
12.08user 0.30system 0:12.39elapsed 99%CPU (0avgtext+0avgdata 1936maxresident)k
0inputs+663024outputs (0major+136minor)pagefaults 0swaps
```
3. From the output of the above command, we can see that the time taken to compress all these files is approx 12 seconds, and 99% of the cpu is utlized during this process.
4. Now lets check the time taken in decompression. 
```
knoldus@knoldus-Vostro-3559:/tmp/images/Pics$ /usr/bin/time gunzip *
2.67user 0.29system 0:02.96elapsed 99%CPU (0avgtext+0avgdata 1728maxresident)k
0inputs+664856outputs (0major+158minor)pagefaults 0swaps
```
5. Decompression took approx 3 seconds, and utilized 99% of the CPU.
6. Now lets use Parallel to see the difference in time consumed.
```
knoldus@knoldus-Vostro-3559:/tmp/images/Pics$ ls | /usr/bin/time parallel gzip -1 
18.78user 1.04system 0:05.31elapsed 373%CPU (0avgtext+0avgdata 17984maxresident)k
0inputs+711704outputs (0major+144351minor)pagefaults 0swaps
```
7. It only took 5 seconds to compress these files in comparision to 12 seconds in last compression. It also utillized 373% of the cpu. 
8. Lets check decompression too and then come to a conclusion.
```
knoldus@knoldus-Vostro-3559:/tmp/images/Pics$ ls | /usr/bin/time parallel gunzip 
3.92user 0.82system 0:01.39elapsed 341%CPU (0avgtext+0avgdata 18148maxresident)k
0inputs+709840outputs (0major+146398minor)pagefaults 0swaps
```
9. It took approx. 2 seconds instead of 3 seconds in previous step, and utilized 341% of the cpu.
10. I have a dual core cpu, each core can have 2 threads. This justifies the increase percentage of cpu utilizarion upto 400%. 
```
knoldus@knoldus-Vostro-3559:/tmp/images/Pics$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
```
## Conclusion
So far we have barely scrached the surface.
GNU Parallel is a powerful and flexible tool, with far more use cases than can fit into this article. Its man page provides examples of really cool things you can do with it, from remote execution over SSH to incorporating Bash functions into your Parallel commands. 
