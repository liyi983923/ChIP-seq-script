#!/bin/bash

### ---------------
###
### Create: li yi
### Date: 2017-05-09
### CAFS/SUSTC/Eli Lilly/University of Macau
### Update Log: 2016-8-14  add reference + annotation for human/mouse  mm9/hg19 version
### Update Log: 2016-8-12  add sratoolkit/weblogo/fastx_toolkit_0.0.13/fastqc/bowtie2/bwa/
### Update Log: 2016-7-16  add MACS2/HOMER/QuEST/mm9/hg19/bedtools/
### Update Log: 2016-7-15  add PeakRanger/blat/Ghostscript/weblogo/SWEMBL/SISSRs/CEAS
###
### --------------- 

## Download and install sratoolkit
## https://github.com/ncbi/sra-tools/wiki/HowTo:-Binary-Installation
##
 cd ~/Download/software
 mkdir sratoolkit &&  cd sratoolkit
 wget --output-document sratoolkit.tar.gz http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
 tar -vxzf sratoolkit.tar.gz  
## set PATH
## $sudo cd ~/.bashrc
## password
## add PATH in the end of this page:
## export PATH=$PATH:/home/jimmyli/Downloads/software/sratoolkit.2.8.2-1-ubuntu64/bin
## then it installed 
## test it: $fastq-dump or $which fastq-dump
### ---------------


## Download and install sratoolkit
## http://bedtools.readthedocs.io/en/latest/content/installation.html
##
 wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
 tar -zxvf bedtools-2.25.0.tar.gz
 cd bedtools2
 make 
## then set PATH in ~/.bashrc
## export PATH=$PATH:/home/jimmyli/Download/software/bedtools2/bin
### ---------------



