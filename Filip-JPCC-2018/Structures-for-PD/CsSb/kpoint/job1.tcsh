#!/bin/bash
#PBS -l nodes=2:ppn=16
#PBS -l walltime=120:00:00
#PBS -N cssb
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
cp cssb-scf.in cssb-scf-${NLINE}.in
head -${NLINE} cssb1_kp.txt | tail -1 >> cssb-scf-${NLINE}.in
$MPIRUN -np $NSLOTS $PW < cssb-scf-${NLINE}.in > cssb-scf-${NLINE}.out
end
