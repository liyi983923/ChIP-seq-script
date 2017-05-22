# samtools view -bS ${A}.sam -o output.bam

# samtools view -bS 1_input_S6_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o 1_input_S6_R1_001_trimmed.sorted.bam -

# samtools view -bS 2_Clock_MY_S8_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o 2_Clock_MY_S8_R1_001_trimmed.sorted.bam -

# samtools view -bS 3_Clock_Ab_S13_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o 3_Clock_Ab_S13_R1_001_trimmed.sorted.bam -

# samtools view -bS 4_HNF1A_poly_S19_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o 4_HNF1A_poly_S19_R1_001_trimmed.sorted.bam -

# samtools view -bS 5_Rabbit_IgG_S21_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o 5_Rabbit_IgG_S21_R1_001_trimmed.sorted.bam -


1_input_S6_R1_001_trimmed.sam            3_Clock_Ab_S13_R1_001_trimmed.sam
2_Clock_MY_S8_R1_001_trimmed.sam         4_HNF1A_poly_S19_R1_001_trimmed.sam
2_Clock_MY_S8_R1_001_trimmed.sorted.bam  5_Rabbit_IgG_S21_R1_001_trimmed.sam



TMG_IP_S1_R1_001_trimmed.sam
TMG_IP_S1_R1_001_trimmed.sorted.bam
TMG_total_S2_R1_001_trimmed.sam
TMG_total_S2_R1_001_trimmed.sorted.bam

samtools view -bS TMG_IP_S1_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o TMG_IP_S1_R1_001_trimmed.sorted.bam -
samtools view -bS TMG_total_S2_R1_001_trimmed.sam | samtools view -h -F 4 -b - | samtools sort -o TMG_total_S2_R1_001_trimmed.sorted.bam -
