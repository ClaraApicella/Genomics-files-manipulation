#!/bin/bash

plink --vcf OldGeno_WES_merged.vcf --double-id --vcf-half-call missing  --make-bed --out OldGeno_WES_merged

plink --bfile OldGeno_WES_merged --pca --mind
