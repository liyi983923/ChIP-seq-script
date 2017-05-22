#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=10:00:00
#PBS -j oe


module load homer

export inputDIR=/gpfs/home/jimmyli/RIP/Bowtie2Out
export outputDIR=/gpfs/home/jimmyli/RIP/homerout

mkdir $outputDIR

cd $inputDIR

makeTagDirectory ../homerout/TMG_IP/ TMG_IP_S1_R1_001_trimmed.sorted.bam
makeTagDirectory ../homerout/TMG_total/ TMG_total_S2_R1_001_trimmed.sorted.bam

cd $outputDIR

findPeaks TMG_IP -style factor -i TMG_total -o TMG_IP_Peaks_TMG_total.txt

makeUCSCfile TMG_IP -fragLength given -o auto

~                                                       

