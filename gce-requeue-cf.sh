#!/bin/bash

PREEMPTED=(` squeue -ho %A -t CF`);
echo $PREEMPTED
if [[ $PREEMPTED ]]; then
	echo $PREEEMPTED
	#/apps/slurm/current/bin/scontrol update nodename=$PREEMPTED state=idle
fi
