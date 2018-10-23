#!/bin/bash

PREEMPTED=( `sinfo | grep down~ | sed -n 's/.*\(compute.*\).*/\1/p'` );

if [[ $PREEMPTED ]]; then
	scontrol update nodename=$PREEMPTED state=idle
fi
