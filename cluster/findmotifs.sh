#!/bin/bash

export PATH=$PATH:/home/jimmyli/homer/bin;

export peakfile=/home/jimmyli/Desktop/TMG_IP_Peaks_TMG_total.txt
export outputdir=/home/jimmyli/Desktop/output

#mkdir $outputdir

command="perl /home/jimmyli/homer/bin/findMotifsGenome.pl $peakfile tair10 $outputdir -len 8,10,12"
$command
