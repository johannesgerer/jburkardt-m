This folder contains several examples for running Matlab jobs that make use of the Distributed Computing Server at ithaca.arc.vt.edu. Prior to running these examples, it is necessary to configure your client machine to allow transparent communication between it and ithaca. Instructions for this (somewhat involved) configuration procedure are in the file ARC-19235956-20090925-16_09_55.pdf

A few network issues:
a) The VT WLAN and VT Wireless dynamically assign IP addresses. Certain addresses in the 172. range are 'private' and so are not visible from the public network (where ithaca.arc.vt.edu lives).  The procedures we use here will not work from these private IP addresses. With a wireless connection you can set up a Virtual Private Network (VPN)  - see http://www.computing.vt.edu/internet_and_web/internet_access/vpn.html . The VPN will provide an IP address in the public range (198É).
b) The ithaca machine will use your client machine's hostname for communication. Thus, the hostname must be known to the DNS server (associates IP addresses with hostnames). You should consider adding (your version of) the following to your startup.m file:

res = pctconfig('hostname', 'phoebe.icam.vt.edu');
clear res

In lieu of the hostname value you can supply the actual IP address (e.g. 198.82É). Under the VPN configuration you must use this form.

The five examples are:

1) birthday 
This example illustrates use of the 'batch' command.  In this implementation,  brunbirhday is implemented as a function, so that we must wait for the job to complete before retrieving the results and setting the return value of prob.

The batch command is arguably more useful in the case where the user wants the 'batch job' to 'run in the background. If you want to continue working in Matlab while the job runs, issue the
  my_job = batch(..); 

from the Command Window. Check for 'finished' by using 
state = get(my_job,'state')

Indeed, once the batch command has been invoked, you can actually close the Matlab session.  When you open another Matlab session you can recover any retained jobs by typing:
---
sched = findResource();
jobs = getJobs(sched,'state','finished');
---
jobs may be a cell array (more than one job is in the finished state).
You can get the data from the job by typing
---
results = load(jobs{1});
---
%%%%%

2) md_parallel
Here we use a parfor construct and a matlabpool. The md_wrap function takes two arguments: the number of labs (n_labs), and the name of the configuration which can be 'local' or 'ithaca'.
% To run this job the 'workers' must be able to communicate with the 
% client machine. You may have to set the hostname to the fully qualified
% machine name (e.g. phoebe.icam.vt.edu) or to the actual IP address
% (e.g. 128.173.123.456). For wireless communication you should set up
% a VPN connection and set hostname to the assigned IP address:
% > pctconfig('hostname','128.173.123.456')

%%%%%

3) color
This example uses an spmd construct (and a matlabpool) to decompose a problem of extracting various colors from a given .png file (fabric.png). Since there are four colors we use four labs in the matlabpool.
%%%%%

4) knap 
Creates a job with four parallel tasks; each task is assigned a subset of the input range to be tested.  By editing the distknap.m file the createJob command can make use of the 'local'or the 'ithaca_2009b' configuration file.

As with the 'batch' command in the birthday example (above), you can submit the job
---
submit(job);
---
and then do other Matlab work, or end your Matlab session and recover the results later.
%%%%%

5) lyrics
This example sets up a Parallel Job with three workers. An (audio) signal file is processed in three stages - the output from worker 1 is sent to worker 2 and in turn to worker 3 (see systolicLyricsFilter.m). 
You should edit the systolic_ithaca file and properly set the variable 'filedef'.
%=> NOTE that the variable 'filedef' must evaluate to the directory <=
%=> containing the required Matlab code(s).                         <=
filedef = {'/Users/ecliff/Desktop/ithaca_local_examples/lyrics/'};

%%%%%
