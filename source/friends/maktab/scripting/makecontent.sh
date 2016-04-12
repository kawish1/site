#!/usr/bin/env bash
lc=0;
while read line
do
    lc=$(($lc + 1))

    string=($line)
    vidoid=${string[0]}
    chapter=${string[1]}
    lecture=${string[2]}
    description="### Lecture${lecture}: ${string[@]:3}"
    des=($description);
    heading=${des[@]^}
    echo "$heading"
    #echo "Line Count = $lc"
    mkdir -p Chapter$chapter
    cp template.md ./Chapter$chapter/Lecture${lecture}.md
    link_shortcode="Link={{< dailmotion ${string[0]} >}}"
    
    #Now we will call ed editor and feed it commands using here document.

ed -s ./Chapter$chapter/Lecture${lecture}.md << EOF
/EDINSERTMETA/ c
edmeta = "ED META"
.
/EDINSERTDESCRIPTION/ c
$heading
.
/EDINSERTLINK/ c
$link_shortcode
.
w
EOF


done<links.txt
