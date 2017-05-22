#!/bin/bash
#PBS -l nodes=5:ppn=8
#PBS -l walltime=10:00:00
#PBS -j oe

module load bowtie2
module load samtools

export inputDIR=/gpfs/home/jimmyli/RIP/QC
export outputDIR=/gpfs/home/jimmyli/RIP/Bowtie2Out
export Bowtie2index=/gpfs/home/jimmyli/igenome/Arabidopsis_thaliana/Ensembl/TAIR10/Sequence/Bowtie2Index/genome

mkdir $outputDIR

cd $outputDIR

filearray=()
while read -r -d $'\0'; do
    filearray+=("$REPLY")
done < <(find . /gpfs/home/jimmyli/RIP/QC -name "*.fq" -print0)

for i in "${filearray[@]}"
do
	IFS='/' read -a files <<< "$i"  ## /gpfs/home/jimmyli/RIP/QC/TMG_IP_S1_R1_001_trimmed.fq
	completename=${files[6]} ## TMG_IP_S1_R1_001_trimmed.fq
	IFS='.' read -a SAMPLE <<< "$completename"
	A=${SAMPLE[0]} ## TMG_IP_S1_R1_001_trimmed

	COMMAND1="bowtie2 -p 40 -N 1 -x $Bowtie2index -U ${inputDIR}/$completename -S ${A}.sam"
	COMMAND2="samtools view -bS ${A}.sam | samtools view -h -F 4 -b - | samtools sort -o ${A}.sorted.bam -" ## convert to bam, filter unmapped reads (-F 4) and sort.
	
	$COMMAND1
	$COMMAND2
	
done

exit

# samtools view -bS TMG_IP_S1_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o TMG_IP_S1_R1_001_trimmed.sorted.bam -
# samtools view -bS TMG_total_S2_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o TMG_total_S2_R1_001_trimmed.sorted.bam -












