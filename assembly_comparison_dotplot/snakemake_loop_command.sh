# make newlines the only separator and disable globing
IFS=$'\n'
set -f  
# loop over lines in config_mutli.txt
# must be a 4 column tab delimited file
# column 1 is location of reference assembly
# column 2 is location of athena assembly
# column 3 is title for reference assembly
# column 4 is title for athena assembly
cat config_multi.txt | xargs -n 4 bash -c 'snakemake --config reference=$0 assembly=$1 ref_title=$2  asm_title=$3'
