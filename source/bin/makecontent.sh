#!/usr/bin/env bash
lc=0;
infile=$1;
while read line
do
    lc=$(($lc + 1))

    string=($line)
    videoid=${string[0]}
    chapter=${string[1]}
    lecture=${string[2]}
    nextchapter=${string[3]}
    nextlecture=${string[4]}
    prevchapter=${string[5]}
    prevlecture=${string[6]}
    description="## Chapter ${chapter} Lecture ${lecture}: ${string[@]:7}"
    des=($description);
    heading=${des[@]^} #change case of heading to title case 
    echo "${heading}"
    #echo "Line Count = $lc"
    mkdir -p chapter${chapter}
    cp template.md ./chapter${chapter}/lecture${lecture}.md
    cp -n ./chapindex.md ./chapter${chapter}/index.md

    link_shortcode="{{< dailymotion ${videoid} >}}"
    nextprev_shortcode="{{< nextprev next=\"../../chapter${nextchapter}/lecture${nextlecture}/\"\
     prev=\"../../chapter${prevchapter}/lecture${prevlecture}/\"  >}}"

    #Now we will call ed editor and feed it commands using here document.

ed -s ./chapter$chapter/lecture${lecture}.md << EOF
/EDINSERTMETA/ c
edmeta = "ED META"
.
/EDINSERTDESCRIPTION/ c
$heading
.
/EDINSERTLINK/ c
$link_shortcode
$nextprev_shortcode
.
w
EOF

pushd .
cd chapter${chapter}
putfileindex 
#update the fileindex
popd
# restore working directory

done < ${infile}





# now update 
