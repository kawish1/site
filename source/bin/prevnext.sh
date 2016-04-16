#!/usr/bin/env bash
infile=$1; 
outfile=$2

#The first column of input file is the videoid.
awk '{print $1}' $infile > videoid.txt
# The second and third columns contain chapter and lecture numbers.
awk '{print $2 " " $3} ' $infile > chapcol.txt
awk '{$1=$2=$3=""; print $0}' $infile > description.txt

# now put the first line of chapcol.txt at its last line and save it as next.txt

ed -s chapcol.txt << EOF
1m\$
w next.txt
EOF

#Now put the last line of chapcol.txt as its first line and and save it as prev.txt
ed -s chapcol.txt << EOF
\$m0
w prev.txt
EOF

# now we have all columns for the final links file. Paste them.
paste videoid.txt chapcol.txt next.txt prev.txt description.txt > $outfile
rm videoid.txt chapcol.txt next.txt prev.txt description.txt
