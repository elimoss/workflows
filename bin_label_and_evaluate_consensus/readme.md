# Sequence binning and bin annotation and evaluation workflow using a consensus approach 
Improvements on the base workflow by using several different binning tools on assembled contigs, then using DAS Tool to pick a best conesnus set of these. Note that unbinned contigs are no longer placed into a bin file. I find this consensus approach to work much better than a single tool alone (in terms of completeness and contamination from checkm, at least)

An example config file is included. I typically run the workflow by specifying the configfile from the commandline like so:
`snakemake --configfile config.yaml`

###Current limitations
Most of the new binning tools have not been integrated into the conda environment. 
I have them installed in my local directory, so you'll likely need to change the lines:
```
MAXBIN=/home/bsiranos/software/MaxBin-2.2.5
MyCC=/home/bsiranos/software/MyCC
CONCOCT=/home/bsiranos/software/CONCOCT
DASTOOL=/home/bsiranos/software/DAS_Tool
```
And the locations of the refinem databases:
```
REFDB=/labs/asbhatt/bsiranos/refinem_db/gtdb_r80_protein_db.2017-11-09.faa
SSUDB=/labs/asbhatt/bsiranos/refinem_db/gtdb_r80_ssu_db.2018-01-18.fna
REFTAXONOMY=/labs/asbhatt/bsiranos/refinem_db/gtdb_r80_taxonomy.2017-12-15.tsv
```

###Before running this workflow, please do the following:

	source activate mgwf #activate the environment
	cd <checkm data directory of your choice>
	wget https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_2015_01_16.tar.gz #download checkm databases
	tar -zxf checkm_data_2015_01_16.tar.gz
	checkm data setRoot #set the location for checkm data and wait for it to initialize


### Inputs
# Alter config.yaml to provide the following:
 * **Assembly**: Sequence to bin. Fasta format.

 * **Sample**: names the output directory.

 * **Reads 1, Reads 2**: forward and reverse reads in fastq or fastq.gz format.

 * **Krakendb**: Kraken database with which to classify asssembly contigs.
