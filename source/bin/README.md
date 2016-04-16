
#How to use these scripts.
There are two scripts. 
1- prevnext.sh
2- makecontent.sh

put both of these script in a folder that is visible in $PATH.
## prevnext.sh

prevnext.sh takes 2 arguments. 1- input file name and 2- output file name.
it can be executed anywhere.
the input file must have the following columns separated by space.

1- video id for dailymotion.
2- The chapter number of video
3- The lecture number of the video.

4...- the description. can be any number of columns.

the output file produced by prevnext will have the following columns.

1- video id for dailymotion
2- the chapter number
3- the lecture number
4- the next chapter number
5- the next lecture number
6- the prev chapter number
7- The prev lecture number.
8... the description as copied from input file.

## makecontent.sh

It takes only one argument which it reads as input file.
Its input must be the same file as was produced by prevnext.sh as output.

Before running the script make sure that you are in the course directory.
A links files has been prodcued using prevnext.sh and two additional files are 
available in the current directory.
1- chapindex.md
2- template.md
chapindex.md will build an index of all lectures available. it will be copies 
into each chapter directory.
template.md contains a template for each lecture.



The current directory must also contain a template file "template.md" that 
makecontent.sh will use as a template for creating more content.


it will create direcories for chapters and content files in those chapters for
each lecture that belongs to that chapter.

In the content files it will populate the meta data for content, insert hugo
shortcodes for dailymotion, hugo shrotcode for navigation to prev and next lectures.

After this script is run a whole course will be created.
