#!/bin/bash
#
#PBS -lwalltime=00:05:00
#PBS -lnodes=1:ppn=8
#PBS -W group_list=matlab
#PBS -A matlab0001
#PBS -q pmatlab_q
#PBS -j oe

cd $PBS_O_WORKDIR

matlab -nosplash -nodisplay < hello.m > hello_ithaca_queue_output.txt
