#!/bin/bash

#Downloads cleanup
#Morgan Hoffman 2015

#It would be nice if I could tell what distro you were on to see what to run. I could also have it setup the cron job

#Some Setup
if [ -d ~/Downloads/!iso ]; then
#	echo "found iso"
	sleep 0
else
	mkdir ~/Downloads/\!iso
	echo "made iso"
fi

if [ -d ~/Downloads/!dmg ]; then
#	echo "found dmg"
	sleep 0
else
	mkdir ~/Downloads/\!dmg
	echo "made dmg"
fi

if [ -d ~/Downloads/!deb ]; then
#	echo "found deb"
	sleep 0
else
	mkdir ~/Downloads/\!deb
	echo "made deb"
fi

if [ -d ~/Downloads/!archive ]; then
#	echo "found archive"
	sleep 0
else
	mkdir ~/Downloads/\!archive
	echo "made archive"
fi

if [ -d ~/Downloads/!pdf ]; then
#       echo "found pdfs"
        sleep 0
else
        mkdir ~/Downloads/\!pdf
        echo "made pdf"
fi


if [ -d ~/Downloads/!gifs ]; then
#       echo "found gifs"
        sleep 0
else
        mkdir ~/Downloads/\!gifs
        echo "made gifs"
fi


if [ -d ~/.Trash ]; then
#	echo "found Trash"
	sleep 0
else
	mkdir ~/.Trash
	echo "made Trash"
fi
movethings ()
{
#Moving all the files

#Adding to Library
mv *.iso \!iso 2> /dev/null
mv *.ISO \!iso 2> /dev/null
mv *.dmg \!dmg 2> /dev/null
mv *.deb \!deb 2> /dev/null
mv *.apk \!deb 2> /dev/null
mv *.pdf \!pdf 2> /dev/null
mv *.PDF \!pdf 2> /dev/null
mv *.gif \!gifs 2> /dev/null
mv *.GIF \!gifs 2> /dev/null


#Backing up files
mv *inished $(date '+%y%m%d') 2> /dev/null
mv *.jpg $(date '+%y%m%d') 2> /dev/null
mv *.png $(date '+%y%m%d') 2> /dev/null
mv *.txt $(date '+%y%m%d') 2> /dev/null
mv *.html $(date '+%y%m%d') 2> /dev/null
mv *.JPG $(date '+%y%m%d') 2> /dev/null
mv *.jpeg $(date '+%y%m%d') 2> /dev/null
mv *.JPEG $(date '+%y%m%d') 2> /dev/null
mv *.tiff $(date '+%y%m%d') 2> /dev/null
mv *.doc $(date '+%y%m%d') 2> /dev/null
mv *.conf $(date '+%y%m%d') 2> /dev/null
mv *.cfg $(date '+%y%m%d') 2> /dev/null
mv *.pdf $(date '+%y%m%d') 2> /dev/null
mv *.gz $(date '+%y%m%d') 2> /dev/null
mv *.zip $(date '+%y%m%d') 2> /dev/null
mv *.pcap $(date '+%y%m%d') 2> /dev/null
mv *.PNG $(date '+%y%m%d') 2> /dev/null
mv *.gif $(date '+%y%m%d') 2> /dev/null
mv *.docx $(date '+%y%m%d') 2> /dev/null
mv *.php $(date '+%y%m%d') 2> /dev/null
mv *.rar $(date '+%y%m%d') 2> /dev/null
mv *.log $(date '+%y%m%d') 2> /dev/null
mv *.bin $(date '+%y%m%d') 2> /dev/null
mv *.pkt $(date '+%y%m%d') 2> /dev/null
mv *.7z $(date '+%y%m%d') 2> /dev/null
mv *.tx $(date '+%y%m%d') 2> /dev/null
mv *.rtf $(date '+%y%m%d') 2> /dev/null
mv *.mp3 $(date '+%y%m%d') 2> /dev/null
mv *.cap $(date '+%y%m%d') 2> /dev/null
mv *.cer $(date '+%y%m%d') 2> /dev/null
mv *.csv $(date '+%y%m%d') 2> /dev/null
mv *.key $(date '+%y%m%d') 2> /dev/null
mv *.exp $(date '+%y%m%d') 2> /dev/null
mv *.eml $(date '+%y%m%d') 2> /dev/null
mv *.fld $(date '+%y%m%d') 2> /dev/null
mv *.wav $(date '+%y%m%d') 2> /dev/null
mv *.spx $(date '+%y%m%d') 2> /dev/null
mv *.plist $(date '+%y%m%d') 2> /dev/null
mv *.key $(date '+%y%m%d') 2> /dev/null
mv *.pem $(date '+%y%m%d') 2> /dev/null
mv *.msg $(date '+%y%m%d') 2> /dev/null
mv *.xml $(date '+%y%m%d') 2> /dev/null





}

deletethings()
{
#Deleting stuff
rm *.pkg 2> /dev/null
rm -r *.mpkg 2> /dev/null
rm *.torrent 2> /dev/null
rm *.crt 2> /dev/null
rm -r *.app 2> /dev/null
rm *.img 2> /dev/null
rm *.exe 2> /dev/null
rm *.part 2> /dev/null
rm *.tar 2> /dev/null
rm *.vib 2> /dev/null
rm *.part 2> /dev/null
rm *.0 2> /dev/null

#rm -r ~/.Trash/*.vmwarevm 2> /dev/null
#rm -r ~/.Trash/*.app 2> /dev/null
}

sortingfolders ()
{
	for items in ~/Downloads/*; do
		if [[ "$items" == *"!iso"* || "$items" == *"!archive"* || "$items" == *"!dmg"* || "$items" == *"!deb"* || "$items" == *"!pdf"* || "$items" == *"!gifs"* || "$items" == *"$(date '+%y%m%d')" ]]; then
#		echo "$items is a preserved folder"
		:
		elif [[ -d $items ]]; then
		mv "$items" ~/Downloads/$(date '+%y%m%d')/
		elif [[ -f $items ]]; then
#			echo "$items was not handled" >>/tmp/$(date '+%y%m%d')
			mv "$items" ~/.Trash/
		else
			echo "$items was not handled and error"
		fi
done
	}

cd ~/Downloads
#If the current date folder exists, move things to it
if [ -d $(date '+%y%m%d') ]; then
	movethings
	deletethings
	sortingfolders
#If the current date folder does not exist, move the old one to the Archive
else 
	mv $(date '+%y%m')* \!archive 2> /dev/null
	mkdir $(date '+%y%m%d')
	movethings
	deletethings
	sortingfolders
	
fi

#Next I want to pop up a dialog with mac os x which will ask what I want to  do with the specific files to delete or not. I want this to run after the script has finished for the remaining files

#After that, I want to take those file extensions, if they exists and as the user what they want to do in the future with a mac os x pop up, that will go through and modify the script by inserting lines.
