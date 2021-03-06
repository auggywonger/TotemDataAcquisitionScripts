#!/bin/bash

# This script will run the graph 500 benchmarc for different scales and it saves the results to
# a file for that scale. 

RED='\033[0;31m'
NC='\033[0m' # No Color


echo "Performing analysis on hybrid"
# Running on hybrid
for SCALE in {14..21}
do
        echo -e "[BASH] ${RED} Running the Hybrid graph500 for scale $SCALE sith sorted edges ${NC}"
        echo "[BASH] Running the hybrid graph500 for scale $SCALE with sorted edges" > ./out/HYB_sorted_s$SCALE.txt

        ../graph500 -s$SCALE -o /local/tmp/edgelist$SCALE -t "-p2 -d -c" >> ./out/HYB_sorted_s$SCALE.txt

        #./graph500 -s$SCALE -t "-p2" > tmp.txt
        #cat tmp.txt | tee >(head -10 >> TMP_HYB_s$SCALE.txt) | tail -30 >> TMP_HYB_s$SCALE.txt

done 

echo "Performing analysis on GPU only"
# Running on GPU only
for SCALE in {14..21}
do
        echo -e "[BASH] ${RED} Running the GPU only graph500 for scale $SCALE with sorted edges${NC}"
        echo "[BASH] Running the GPU only graph500 for scale $SCALE with sorted edges" > ./out/GPU_sorted_s$SCALE.txt

        ../graph500  -o /local/tmp/edgelist$SCALE -s$SCALE -t "-p1 -d" >> ./out/GPU_sorted_s$SCALE.txt
        #./graph500 -s$SCALE -t "-p1" > tmp.txt
        #cat tmp.txt | tee >(head -10 >> TMP_GPU_s$SCALE.txt) | tail -30 >> TMP_GPU_s$SCALE.txt

done 

echo "Performing analysis on CPU only"
#Running on CPU only
for SCALE in {14..21}
do
	echo -e "[BASH] ${RED} Running the CPU only (default) graph500 for scale $SCALE with sorted edges${NC}"
	echo "[BASH] Running the CPU only (default) graph500 for scale $SCALE with sorted edges" > ./out/CPU_sorted_s$SCALE.txt

	../graph500 -o /local/tmp/edgelist$SCALE -s$SCALE -t "-p0 -d"  >> ./out/CPU_sorted_s$SCALE.txt
	#./graph500 -o /local/tmp/edgelist$SCALE -s$SCALE -V  > tmp.txt
	#cat tmp.txt | tee >(head -10 >> TMP_CPU_s$SCALE.txt) | tail -30 >> TMP_CPU_s$SCALE.txt

done 

echo "Done with sorting script"
