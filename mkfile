# DESCRIPTION:
# mk module to run fanc on fastq files
# and generate a hic matrix 
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/mk-targets`
#
# Multiple target execution in tandem `bin/mk-targets | xargs mk`
#
# AUTHOR: HRG
#
# include config file
#
<config.mk

# Run fanc
#
results/%:	data/%_R1.fastq.gz data/%_R2.fastq.gz
	fanc auto \
		$prereq \
		$target \
		--genome $HIC_GENOME \
		--genome-index $GENOME_INDEX \
		--basename `basename $target` \
		--threads $N_THREADS \
		--restriction-enzyme $ENZYME \
		--split-ligation-junction

# digest reference genome 
#
digest_genome:V:
	mkdir -p `dirname $HIC_GENOME`
	fanc fragments \
		--chromosomes $MY_CHROMOSOMES \
		$REF_GENOME \
		$ENZYME \
		$HIC_GENOME

