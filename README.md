# HTSticher
This is a Powershell script (so for windows) that takes a series of images in a folder and turns them into a single PDF. It was written because ..ummm... circumstances required that certain books from certain websites needed to be downloaded via cURL. This resulted in each page of the book being saved as either an jpg or png. This script assumes the following:

1. all the books are in folders of their own
2. all the folders are named exactly what the book should be called (for e.g. if you want the book to be called Smith_95_AmazingBirdsOfPrey then the folder should be called exactly that). 
3. all images are either png or jpg. 
4. there is a sequence number that determines the order of the pages. AND that this sequence number is at the end of the file name (so abce_123.jpg)
5. that the script will be run in a folder just above all the book folder. E.g. all the book folder (book1, book2, book3) are inside myBooks... so this script will run in myBooks
6. that imagemagick (https://imagemagick.org/index.php) is installed in the computer, and the path points to it. 

Some improvements that could be done:
1. I intially tried to code this in bash on windows... but somehow I could not figure out how to call magick.exe from bash... so switch to powershell. This must be possible. If this was in bash I suppose more people could use it. 
2. I can't tell what imagemagick is doing. Basically I could not figure out how to pipe any sort of error or status message from that into shellscript... so that part is sorta a blackbox. For e.g. I could not figure out why morgify was going wack... and so just switch to convert. But this is very hacky. There must be better ways to understand what imagemagick is doing and to handle that in the code. 
3. It should be shorter. For e.g. I convert a file... then rename it. This could be done in one step. BUT I got a big lazy and did not want to figure out how I code that stuff in the imagemagick command. There are a few bits like that, that could be more efficient. 
