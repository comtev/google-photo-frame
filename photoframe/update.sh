cd /home/photoframe/photodir/
wget https://photos.app.goo.gl/MYALBUM_ID
egrep -- 'https?://lh3\.googleusercontent\.com\/[a-zA-Z0-9_\-]*' MYALBUM_ID > photos
awk -F "\[\[" {'print $5'} RS="" photos > photos.filtered
egrep -o -- 'https?://lh3\.googleusercontent\.com\/[a-zA-Z0-9_\-]*\"' photos > photos.filtered && sed s/\"/=w9999-h9999-no/ photos.filtered > photolist
sed -i '/MYPROFILEPICTURE_ID*/d' photolist
cat photolist | parallel --gnu "wget {}"
rename s/=w9999-h9999-no*/\.jpeg/ *=w9999-h9999-no -f
rm MYALBUM_ID MYPROFILEPICTURE_ID.jpeg *.[[:digit:]] # This script will also download your google profile picture, making sure it's not in the slideshow. Also removing any duplicates.

killall fim
fim -auqHR ./*.jpeg -c 'while(1){display;sleep "30";next;}' #Loads all jpeg files from the folder, in a random order, fits them according to their height (So the picture will take all the vert space on the screen) and cycles through them every 30 seconds, while true.

exit 0