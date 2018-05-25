# make newlines the only separator and disable globing
IFS=$'\n'
set -f  
# loop over lines in config_mutli.txt
# must be a 4 column tab delimited file
# column 1 is location of reference assembly
# column 2 is location of athena assembly
# column 3 is title for reference assembly
# column 4 is title for athena assembly
for i in $(cat config_multi.txt); do snakemake --config reference=$(echo "$i"|cut -f 1) assembly=$(echo "$i"|cut -f 2) ref_title=$(echo "$i"|cut -f 3) asm_title=$(echo "$i"|cut -f 4); done 