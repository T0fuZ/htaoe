Hacking: The Art Of Exploitation Unofficial Expansion

(Guide made in Archlinux)

Turn HTAOE into docker container and combine with some other resources

Note, this is not for privilage escalation hacks, because we already run in root, but we can do all other stuff
So if you need you need to spin of real VM

1. Run get_and_verify_iso.sh 

2. Our next task is to get files from ISO
sudo mkdir /mnt/htaoe

sudo mount -o loop hacking-live-1.0.iso /mnt/htaoe

3. Lets build new root from squashfs
sudo unsquashfs -f -d ~/htaoe-root /mnt/htaoe/casper/filesystem.squashfs

You will get something:
created 105273 files
created 12038 directories
created 13745 symlinks
created 159 devices
created 2 fifos
created 0 sockets
created 0 hardlinks

4. Put files to root folder
sudo cp -r ~/htaoe-root/etc/skel/booksrc ~/htaoe-root/root/
sudo cp ~/htaoe-root/etc/skel/unix_basics ~/htaoe-root/root/
echo 'if [ -f ~/unix_basics ]; then ~/unix_basics; fi' | sudo tee -a ~/htaoe-root/root/.bashrc > /dev/null

5. Create image
sudo tar -C ~/htaoe-root -c . | docker import - htaoe


6. Run it
docker run -it --rm --hostname hacking htaoe /bin/bash


