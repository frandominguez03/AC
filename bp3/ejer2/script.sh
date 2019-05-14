#!/bin/bash
export OMP_NUM_THREADS=4


	echo "Schedule"
	./schedule-clause 1
	./schedule-clause 2
	./schedule-clause 4

	echo "Scheduled"
	./scheduled-clause 16 1
	./scheduled-clause 16 2
	./scheduled-clause 16 4

	echo "Scheduleg"
	./scheduleg-clause 16 1
	./scheduleg-clause 16 2
	./scheduleg-clause 16 4