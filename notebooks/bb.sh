#!/bin/bash
#
#SBATCH --job-name=bb
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=1
#SBATCH --mem=200GB
#SBATCH --time=5:00:00
#SBATCH --output=./logs/sub_%j.out
#SBATCH --error=./logs/sub_%j.err

module load htslib kraken2

WDIR=/lisc/scratch/course/2024w550001/

cd $WDIR/martin

$WDIR/share/bbmap/bbsplit.sh -Xmx200g in=test5_p.fastq.gz ref=$WDIR/ref_gen/hg19.fa,$WDIR/ref_gen/Pan_paniscus.panpan1.1.dna.toplevel.fa,$WDIR/ref_gen/Papio_anubis.Panubis1.0.dna.toplevel.fa,$WDIR/ref_gen/Pongo_abelii.Susie_PABv2.dna.toplevel.fa out=clean1.fq refstats=test5_bbstats.txt

echo "done"

exit
