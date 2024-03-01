#!/bin/bash

File="multiallelic_merged_worm_2024_exome_Clean.vcf.gz"
File_base=$(basename ${File} .vcf.gz)

#The g.z file has been first sorted then compressed and the index generated so we want to use this as input
#uncompress 
gunzip ${File}


#Make bed family files of the concatenated file
plink --vcf ${File_base}.vcf --make-bed --out ${File_base}

