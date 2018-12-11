#!/bin/bash

PREEMPTED=( `/apps/slurm/current/bin/sinfo | grep down~ | sed -n 's/.* \(.*compute.*\).*/\1/p'` );

if [[ $PREEMPTED ]]; then
	/apps/slurm/current/bin/scontrol update nodename=$PREEMPTED state=idle
fi
