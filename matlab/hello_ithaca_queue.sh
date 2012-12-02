#!/bin/bash
#
#PBS -lwalltime=00:05:00
#PBS -lnodes=1:ppn=8
#PBS -W group_list=ithaca
#PBS -A matlab0001
#PBS -q ithaca_q

cd $PBS_O_WORKDIR

matlab -nosplash -nodisplay < hello.m > hello_ithaca_queue_output.txt
