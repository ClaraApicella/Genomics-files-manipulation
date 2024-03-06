#!/bin/bash

File1="multiallelic_merged_worm_2024_exome_Clean.vcf.gz"
File2="Worm_genotypes85_rsIDs_GRCh38_20240218.vcf.gz"

#The overlapping positions were found with bcftools isec and the list of variants extracted with grep and cut (saved in vcf_intersection/

#The common variants are saved in CommonVariants.txt

#Filter vcf files for the overlapping positions
bcftools view -T CommonVariants.txt ${File1}  > ${File1}_CommonVariants.vcf
bcftools sort  ${File1}_CommonVariants.vcf -o  ${File1}_CommonVariants.vcf
bcftools view ${File1}_CommonVariants.vcf -Oz -o ${File1}_CommonVariants.vcf.gz
bcftools index -t ${File1}_CommonVariants.vcf.gz

bcftools view -T CommonVariants.txt ${File2}  > ${File2}_CommonVariants.vcf
bcftools sort  ${File2}_CommonVariants.vcf -o  ${File2}_CommonVariants.vcf
bcftools view ${File2}_CommonVariants.vcf -Oz -o ${File2}_CommonVariants.vcf.gz
bcftools index -t ${File2}_CommonVariants.vcf.gz

bcftools merge ${File1}_CommonVariants.vcf.gz ${File2}_CommonVariants.vcf.gz > OldGeno_WES_merged.vcf
