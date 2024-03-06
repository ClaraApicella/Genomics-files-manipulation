#!/bin/bash

File="Worm_genotypes85_rsIDs_GRCh38_20240218.vcf"
File_base=$(basename ${File} .vcf)

#The g.z file has been first sorted then compressed and the index generated so we want to use this as input
#uncompress
#gunzip ${File}


#Make bed family files of the concatenated file
#--double-id causes both family and within-family IDs to be set to the sample ID.
#--geno filters out all variants with missing call rates exceeding the provided value (default 0.1) to be removed, while --mind does the same for samples.
plink --vcf ${File_base}.vcf --recode --out ${File_base} --double-id --vcf-half-call missing --geno