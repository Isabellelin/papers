#!/bin/bash
#PBS -l nodes=2:ppn=16
#PBS -l walltime=120:00:00
#PBS -N cssbcl6
#PBS -m bae
#PBS -M xinlei.liu@seh.ox.ac.uk


module load espresso/5.3.0

# develq - short queue with walltime 10 minutes and maximum 2 nodes
# to submit to develq: qsub -q develq script.pbs

# Set up mpi on ARCUS
. enable_arcus_mpi.sh


# Executable aliases
export MPI_GROUP_MAX=64


# Copy to TMPDIR all files required for start
cd $PBS_O_WORKDIR


foreach NLINE ( `seq 1 15` )
cp cssbcl6-scf.in cssbcl6-scf-${NLINE}.in
head -${NLINE} cssbcl61_kp.txt | tail -1 >> cssbcl6-scf-${NLINE}.in
$MPIRUN -np $NSLOTS $PW < cssbcl6-scf-${NLINE}.in > cssbcl6-scf-${NLINE}.out
end
