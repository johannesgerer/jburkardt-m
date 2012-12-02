#!/bin/sh
#PBS -v MDCE_DECODE_FUNCTION,MDCE_STORAGE_LOCATION,MDCE_STORAGE_CONSTRUCTOR,MDCE_JOB_LOCATION,MDCE_CMR,MDCE_MATLAB_EXE,MDCE_MATLAB_ARGS,MDCE_TOTAL_TASKS,MDCE_DEBUG
# The previous line ensures that all required environment variables are
# forwarded from the client MATLAB session through the scheduler to the cluster.
# 
# This script uses the following environment variables set by the submit M-code:
# MDCE_CMR            - the value of ClusterMatlabRoot (may be empty)
# MDCE_MATLAB_EXE     - the MATLAB executable to use
# MDCE_MATLAB_ARGS    - the MATLAB args to use
#
# The following environment variables are forwarded through mpiexec:
# MDCE_DECODE_FUNCTION     - the decode function to use
# MDCE_STORAGE_LOCATION    - used by decode function 
# MDCE_STORAGE_CONSTRUCTOR - used by decode function 
# MDCE_JOB_LOCATION        - used by decode function 

# Copyright 2006-2009 The MathWorks, Inc.
# $Revision: 1.1.8.2.4.1 $   $Date: 2009/06/29 15:56:26 $

# Create full paths to mw_smpd/mw_mpiexec if needed
FULL_SMPD=${MDCE_CMR:+${MDCE_CMR}/bin/}mw_smpd
FULL_MPIEXEC=${MDCE_CMR:+${MDCE_CMR}/bin/}mw_mpiexec
SMPD_LAUNCHED_HOSTS=""
MPIEXEC_CODE=0

# Work out where we need to launch SMPDs given our hosts file - defines
# SMPD_HOSTS
chooseSmpdHosts() {
    # We need the PBS_NODEFILE value - the following line either echoes the value,
    # or aborts.
    echo Node file: ${PBS_NODEFILE:?"Node file undefined"}
    # We must launch SMPD on each unique host that this job is to run on. We need
    # this information as a single line of text, and so we pipe the output of "uniq"
    # through "tr" to convert newlines to spaces
    SMPD_HOSTS=`sort ${PBS_NODEFILE} | uniq | tr '\n' ' '`
}

# Work out which port to use for SMPD
chooseSmpdPort() {
    # Choose unique port for SMPD to run on. PBS_JOBID is something like
    # 15.pbs-server-host.domain.com, so we extract the numeric part of that
    # using sed.
    JOB_NUM=`echo ${PBS_JOBID:?"PBS_JOBID undefined"} | sed 's#^\([0-9][0-9]*\).*$#\1#'`
    # Base smpd_port on the numeric part of the above
    SMPD_PORT=`expr $JOB_NUM % 10000 + 20000`
}

# Work out how many processes to launch - set MACHINE_ARG
chooseMachineArg() {
    MACHINE_ARG="-n ${MDCE_TOTAL_TASKS} -machinefile ${PBS_NODEFILE}"
}

# Now that we have launched the SMPDs, we must install a trap to ensure that
# they are closed either in the case of normal exit, or job cancellation:
# Default value of the return code
cleanupAndExit() {
    echo ""
    echo "Stopping SMPD on ${SMPD_LAUNCHED_HOSTS} ..."
    for host in ${SMPD_LAUNCHED_HOSTS}
    do
        echo ssh $host \"${FULL_SMPD}\" -shutdown -phrase MATLAB -port ${SMPD_PORT}
        ssh $host \"${FULL_SMPD}\" -shutdown -phrase MATLAB -port ${SMPD_PORT}
    done
    echo "Exiting with code: ${MPIEXEC_CODE}"
    exit ${MPIEXEC_CODE}
}

# Use ssh to launch the SMPD daemons on each processor
launchSmpds() {
    # Launch the SMPD processes on all hosts using SSH
    echo "Starting SMPD on ${SMPD_HOSTS} ..."
    for host in ${SMPD_HOSTS}
      do
      # This script assumes that SSH is set up to work without passwords between
      # all nodes on the cluster
      echo ssh $host \"${FULL_SMPD}\" -s -phrase MATLAB -port ${SMPD_PORT}
      ssh $host \"${FULL_SMPD}\" -s -phrase MATLAB -port ${SMPD_PORT}
      ssh_return=${?}
      if [ ${ssh_return} -ne 0 ]
          then
          echo "Launching smpd failed for node: ${host}"
          exit 1
      else
          SMPD_LAUNCHED_HOSTS="${SMPD_LAUNCHED_HOSTS} ${host}"
      fi
    done
    echo "All SMPDs launched"
}

runMpiexec() {
    # As a debug stage: echo the command line...
    echo \"${FULL_MPIEXEC}\" -phrase MATLAB -port ${SMPD_PORT} \
        -l ${MACHINE_ARG} -genvlist \
        MDCE_DECODE_FUNCTION,MDCE_STORAGE_LOCATION,MDCE_STORAGE_CONSTRUCTOR,MDCE_JOB_LOCATION \
        \"${MDCE_MATLAB_EXE}\" ${MDCE_MATLAB_ARGS}
    
    # ...and then execute it
    eval \"${FULL_MPIEXEC}\" -phrase MATLAB -port ${SMPD_PORT} \
        -l ${MACHINE_ARG} -genvlist \
        MDCE_DECODE_FUNCTION,MDCE_STORAGE_LOCATION,MDCE_STORAGE_CONSTRUCTOR,MDCE_JOB_LOCATION \
        \"${MDCE_MATLAB_EXE}\" ${MDCE_MATLAB_ARGS}
    MPIEXEC_CODE=${?}
}

# Define the order in which we execute the stages defined above
MAIN() {
    trap "cleanupAndExit" 0 1 2 15
    chooseSmpdHosts
    chooseSmpdPort
    launchSmpds
    chooseMachineArg
    runMpiexec
    exit ${MPIEXEC_CODE}
}

# Call the MAIN loop
MAIN
