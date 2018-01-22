#!/bin/tcsh
#$ -l qname=parallel.q
#$ -l h_rt=24:00:00
#$ -N cs2bicucl6
#$ -o jobtest.out
#$ -e jobtest.err
#$ -cwd
#$ -pe orte 96
#$ -j y
#$ -R y
#$ -l h_vmem=2.875G
#$ -V



module purge
module load  fft/fftw-3.3.4_intel15
module load  mpi/openmpi-1.10.2_intel15
module load  intel/ics-2015-3-187



set MPIRUN = "/share/apps/mpi/openmpi-1.10.2/bin/mpirun --mca btl self,openib,sm,tcp"
set PW = /home/ted/codes/espresso-5.4.0/bin/pw.x
set NSLOTS = 96



foreach NLINE ( `seq 1 15` )
cp cs2bicucl6-scf.in cs2bicucl6-scf-${NLINE}.in
head -${NLINE} cs2bicucl61_kp.txt | tail -1 >> cs2bicucl6-scf-${NLINE}.in
$MPIRUN -np $NSLOTS $PW < cs2bicucl6-scf-${NLINE}.in > cs2bicucl6-scf-${NLINE}.out
end
