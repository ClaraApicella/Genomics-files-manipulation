#!/bin/bash

File1="SNP_worm_2024_exome_Clean.vcf.gz"
File2="INDEL_worm_2024_exome_Clean.vcf.gz"
File_output="worm_2024_exome_Clean.vcf"
File_o_base=$(basename {File_output} .vcf)

#Concatenate vcf files with bcftools 
#-a allow overlaps
#bcftools concat -a ${File1} ${File2} -o ${File_output}

bcftools norm -m+any  ${File_output} -o  multiallelic_merged_${File_output}
