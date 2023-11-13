#!/bin/zsh

# Change the benchmark names to match your actual benchmarks
benchmarks=("ACME_Insurance" )

for bm in $benchmarks; do
    mkdir -p "$bm"/ontology
    mkdir -p "$bm"/DDL
    mkdir -p "$bm"/investigation
    mkdir -p "$bm"/data
    echo "Directories created for $bm"
done

echo "Benchmark directory structure set up."
