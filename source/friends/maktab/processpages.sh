#!/bin/bash

# Extract all links from raw html file and store one link per line in a file.
grep -h -oe '\/video\/[^\"]*' ../maktab_all/page* > all_links.txt

grep chemistry all_links.txt | sort -t- -n -k3,3 -k5,5 -k7,7  > chemistry.txt
grep biology all_links.txt | sort -t- -n -k3,3 -k5,5 -k7,7  > biology.txt
grep physics all_links.txt | sort -t- -n -k3,3 -k5,5 -k7,7  > physics.txt
grep math all_links.txt | sort -t- -n -k3,3 -k5,5 -k7,7  > math.txt
grep -v math all_links.txt | grep -v biology | grep -v chemistry | grep -v physics > not_classified.txt

