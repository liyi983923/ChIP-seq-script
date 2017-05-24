#  ChIP-Seq pipeline  
对ChIP-Seq其实也不敢说是很了解，还有很多值得我学习和关注的。不仅仅是实验技术和数据分析，就是如何去理解这个实验，如何去利用这些数据去得到更多的结果，也是值得我学习的。
## 1. 先讲一讲pipeline吧
以下是2011年Nature Protocol上的一篇[文章](https://www.nature.com/nprot/journal/v7/n1/full/nprot.2011.420.html) 对ChIP-Seq的简介图。

![pipeline](https://github.com/liyi983923/figures/raw/master/saved%20fig/nprot.2011.420-F1.jpg)
  <br />
其实过程还是比较简单的，下面是每一步的简介和我现在所可以用的软件
- **data preprocessing**: adaptor trimming and QC, 所用的软件是trimglore and fastqc. 我先是和Tomas学的是用cluster，直接load software， 后来自己在自己PC上装了这些软件，用自己的机器来run programme。其实如何安装和调用这些软件是一门学问啊。有机会开个专题好好的讲一下。  
- **alignment**: map the reads in the original genome, 我用的是Bowtie2，还有可以选择BWA。Bowtie会生成一些sam file，用samtools改成bam file， 就可以用IGV看了。
- **peak calling**， 把reads比到genome之后，那么那些reads是有significant意义的，compared with input。 我用的是Homer，还有推荐的是MACS2。这个时候就有了bed file，可以更加清楚的看图片了。  <br />
![peak calling](https://github.com/liyi983923/figures/raw/master/saved%20fig/nprot.2011.420-F2.jpg)  <br />
- **annotation and visualization** , 可以用homer来做annotation，以及各种数据的分析。下面是一篇[Nature Nureoscience](http://www.nature.com/neuro/journal/v17/n11/full/nn.3816.html) 对ChIP-Seq的output图的总结。就是看图说话啊。有空应该自己找个例子把以上的图片都做一遍，这哪一期的文章中，还有RNA-seq的看图说话。到时候把上面的图都做一遍。那应该就是比较熟了。总之，我的感觉是第一把shell要用的好，这个样子基本工就很扎实了，第二就是要熟悉linux，把所需要的软件都装好。剩下的就是运行script了。我现在就是要case study，积累script，熟悉shell 和linux的操作。最后，学习R和python，这个学习计划应该是比较合理的。
![ChIP-Seq figures](https://github.com/liyi983923/figures/raw/master/saved%20fig/nn.3816-F2.jpg)  <BR /> <BR />



## 2. Data Download
自己测序拿到的结果是fastq的文档，可以直接用上面写的pipeline进行analysis。但是如果是做数据比较就要去NCBI和EMBO的网站上去download数据了。奇怪的是NCBI上很多数据都是sra格式，确实比较小，但是下载后用samtool去做解压缩很耗时间，所以如果Internet is fast， we can download directly from [ENA](http://www.ebi.ac.uk/ena).   <BR />

下面是我学习的一个例子，用shell写的script如何批量的下载data，参考的是网上的一个[例子](https://github.com/jmzeng1314/NGS-pipeline/tree/master/CHIPseq).  我感觉写的很详细，是一个很好的学习例子，另外一个我是用TSRI的cluster做的，script是从Thomas拿过来修改的。我将详细的比较两种方法和脚本。<br />

    #! /bin/bash
    ## step1 : download raw data from SRA database
    rawdata=/home/jimmyli/Desktop/test/ChIP_test/rawdata;
    mkdir $rawdata && cd $rawdata

    ## batch download the raw data by shell script :

    for ((i=593;i<601;i++)) ;do wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByStudy/sra/SRP/SRP033/SRP033492/SRR1042$i/SRR1042$i.sra;done

    ls *sra
    echo --------------
    
    ## step2 :  change sra data to fastq files.
    ls *sra |while read id; do fastq-dump $id;done
    rm *sra
 <BR /> 
    
    
##3. Data trimming and QC
    #! /bin/bash

    ## step4 : run FastQC to check the sequencing quality.
    export input=/home/jimmyli/Desktop/test/ChIP_test/rawdata
    cd $input

    ls *.fastq  | echo *.fastq | while read id ; do fastqc $id;done

    mkdir QC_results

    mv *zip *html QC_results/

    mv QC_results/ ~/Desktop/test/ChIP_test/
    
    
下面是Thomas的script和我自己改的script

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




  
    
    
    
