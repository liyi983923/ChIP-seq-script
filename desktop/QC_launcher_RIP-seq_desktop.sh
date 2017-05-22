#!/bin/bash

export PATH=$PATH:/usr/local/bin/fastqc;
export PATH=$PATH:/usr/bin/trim_galore;

inputDIR=/home/jimmyli/Desktop/RIP/raw     #need to change
outputDIR=/home/jimmyli/Desktop/RIP/QC #need to change

mkdir $outputDIR

###gunzip ${inputDIR}/*

filearray=()
while read -r -d $'\0'; do
    filearray+=("$REPLY")
done < <(find . ${inputDIR} -name *.fastq -print0)

for i in "${filearray[@]}"
do
	IFS='/' read -a files <<< "$i"  ## ${inputDIR}/TMG_IP_S1_R1_001.fastq 
	completename=${files[6]} ## TMG_IP_S1_R1_001.fastq  # 5 need to be changed
	IFS='.' read -a SAMPLE <<< "$completename"
	A=${SAMPLE[0]} ## TMG_IP_S1_R1_001

	COMMAND="trim_galore --fastqc -o ${outputDIR} ${inputDIR}/${completename}"
	$COMMAND

done

