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
# Run fanc
#
results/%:	data/%_R1.fastq.gz data/%_R2.fastq.gz
	fanc auto \
		$prereq \
		$target \
		-g \
		-i \
		-n `basename $target` \
		-t \
		-r \
		--split-ligation-junction \
		-q \

