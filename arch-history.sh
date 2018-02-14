# testing systemd functions
systemctl 
systemctl status
systemctl list-running
systemctl list-units
systemctl --failed
ls /etc/systemd/system/
# setup host and hostname for machine
sudo hostnamectl set-hostname A3-Laptop
ping A3-Laptop
vim /etc/hosts 
sudo vim /etc/hosts 
ping A3-Laptop
# start network Manager Service
sudo systemctl start NetworkManager
sudo systemctl status NetworkManager
# connect to wifi through network Manager
nmcli dev wifi connect "Multi Media" password "ojodikosongiwae"
ping 8.8.8.8
# edit pacman conf by removing comment on multilib tp enable multilib for 32 bit libraries
sudo vim /etc/pacman.conf 
# update app database
sudo pacman -Sy
# install Weston
pacman -S weston
# install wayland
sudo pacman -S wayland
weston-launch 
# remove weston and it's dependencies
sudo pacman -Rs weston
# reinstall it
sudo pacman -S weston
weston-launch 
vim .config/weston.ini
weston --tty=7
sudo weston-launch --tty=7
sudo weston-launch
# install nvidia driver
sudo pacman -S nvidia lib32-nvidia-utils
# install xorg-server
sudo pacman -S xorg-server xorg-xinit
# install mesa
sudo pacman -S mesa
# search appdb
sudo pacman -Ss synaptics
# install touch pad
sudo pacman -S xf86-input-synaptics
# install some x example applications
sudo pacman -S xorg-twm xorg-xclock xterm
# initialize xsession
startx
# install randr extension for xorg to set Optimus to Nvidia only
sudo pacman -S xorg-xrandr
#grep information about VGA
lspci | egrep 'VGA|3D'
# configure module and device for vga
sudo vim /etc/X11/xorg.conf
# add xrandr configuration for current user at startup
vim ~/.xinitrc
# install gnome desktop environment
sudo pacman -S gnome-desktop
# install Gnome Display Manager
sudo pacman -S gdm
# start display Manager
sudo systemctl start gdm
# install mesa demo for glx demo command to check used GPU
sudo pacman -S mesa-demos
glxinfo | grep NVIDIA
glxinfo|grep VGA
glxinfo|grep intel
# configure gdm to use nvidia driver for optimus laptop
vim /etc/gdm/custom.conf 
sudo vim /etc/gdm/custom.conf 
sudo systemctl restart gdm
glxinfo|grep OpenGL
# check speaker sound
speaker-test -c 2
# install htop
sudo pacman -S htop
# configure gdm to start with nvidia prop driver setting
vim optimus.desktop
sudo cp optimus.desktop /usr/share/gdm/greeter/autostart/
sudo cp optimus.desktop /etc/xdg/autostart/
# install alsa utils for alsa audio settings
sudo pacman -S alsa-utils
# install zsh
sudo pacman -S zsh
# install tmux
sudo pacman -S tmux
# upgrade system
sudo pacman -Su
# install ntfs-3g for mounting ntfs partition
sudo pacman -Ss ntfs-3g
sudo pacman -S ntfs-3g
# editting fstab for auto mounting
vim /etc/fstab 
# reading block id of connected drives
sudo blkid
# autostarting for NetworkManager
sudo systemctl enable NetworkManager
# install nautilus file manager
sudo pacman -S nautilus
# Network Manager Terminal UI
nmtui
# install openssh ssh clint
sudo pacman -S openssh
# connecting to penguin ssh
ssh -D 17696 -l dscm 192.168.0.22 -p 2233
# stupidly trying to connect with bad network
vim /etc/nsswitch.conf 
sudo rm /etc/nsswitch.conf 
sudo mv nsswitch.conf /etc/
vim /etc/resolvconf.conf 
vim /etc/resolv.conf
# change to zsh
chsh as3mbus /usr/bin/zsh
# starting gnome session for display one in virtual terminal 7
startx /usr/bin/gnome-session -- :1 vt7
# configuring libinput like an idiot for gnome, but gnome have different configuration in dconf
sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf
sudo libinput list-devices
sudo pacman -S xorg-xinput
xinput list
# install gnome terminal
sudo pacman -S gnome-terminal
# install git because reasons
sudo pacman -S git
# open new virtual terminal
sudo openvt
# new login vt with getty (proper way to add new vt)
sudo systemctl start getty@tty1.service
# start i3
startx /usr/bin/i3
# additional setting for nvidia optimus laptop
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
# optional but failed configuring xorg monitor and graphic card
sudo Xorg -configure
# remove synaptic driver because using libinput
sudo pacman -Rns xf86-input-synaptics
# libinput configuration file arent applied to gnome since gnome use dconf or gsettings
dconf --help
gsettings list-schemas
gsettings list-keys org.gnome.desktop.peripherals.touchpad
sudo pacman -S gnome-tweak-tool
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
sudo pacman -S gnome-control-center
gsettings list-keys org.gnome.desktop.peripherals.touchpad
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-and-drag true
sudo vim /etc/X11/xorg.conf.d/30-touchpad.conf
# nvidia configuration for xorg
#sudo nvidia-xconfig
#sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/10-nvidia.conf
# it's just a bogus (trash) configuration file that wont matter if it's doesnt exist
############################ documentation 25 January 2018 Start #########################################
# kulgram zsh
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
# list enabled (auto-start) unit(service)
systemctl list-unit-files --state-enabled
# install with Syu now
sudo pacman -Syu dnscrypt-proxy
sudo pacman -Syu workrave
# show workrave config
workrave --help-gtk
# show unit that failed to run
systemctl --failed
# debugging bootup
journalctl -p 3 -xb
# removing nvidia
sudo pacman -Rsn nvidia
# checking graphic card used in xserver
glxinfo| grep OpenGL
# configuring network manager should be in network manager/conf.d
# configuring network manager to preserve dns in /etc/resolv.conf
sudo vim /etc/NetworkManager/NetworkManager.conf
man 5 NetworkManager.conf
gnome-tweak-tool
# remove corrupted app database that failed to install
sudo rm -R /var/lib/pacman/sync
sudo pacman -Syuf
sudo pacman -Syu
# retrieve module info
modinfo wd719x
mkdir workingonit
mv .xinitrc workingonit
# install unbound dns server and ldns to check if dns working
sudo pacman -Syu unbound
sudo pacman -Syu ldns
# create network manager configuration to preserve dns in /etc/resolv.conf 
# check by rebooting machine
sudo vim /etc/NetworkManager/conf.d/preservedns.conf
# check dns
drill www.archlinux.org
sudo pacman -Rsn nvidia
# dont remove network manager it may remove WPA_Supplicant that handle wifi connection with WPA/WPA Security
sudo pacman -Rns networkmanager
sudo pacman -Syu NetworkManager
sudo systemctl restart NetworkManager
sudo systemctl status unbound.service 
sudo systemctl enable unbound.service
# unbound root hints following archwiki
cat /etc/unbound/root.hints
sudo curl -o /etc/unbound/root.hints https://www.internic.net/domain/named.cache
# configuring unbound to add root hints
sudo vim /etc/unbound/unbound.conf
# add forwarding for unbound dnsserver
sudo echo "forward-zone:\n  name: "."\n  forward-addr: 8.8.8.8\n  forward-addr: 8.8.4.4">> /etc/unbound/unbound.conf
# install expat dependency for dnssec
sudo pacman -Syu expat
drill www.archlinux.org
sudo vim /etc/resolv.conf
drill www.archlinux.org
sudo vim /etc/resolv.conf
sudo pacman -Syu gnome-keyring
sudo vim /etc/unbound/unbound.conf
# reattach suspended process
% 2899
% 2960
drill www.itsfoss.com
drill www.archlinux.org
# checking DNSSEC still fail till now
unbound-host -C /etc/unbound/unbound.conf -v sigok.verteiltesysteme.net
drill sigfail.verteiltesysteme.net
ping sigfail.verteiltesysteme.net
unbound-host -C /etc/unbound/unbound.conf -v sigok.verteiltesysteme.net\n
drill google.com
drill www.itsfoss.com
unbound-anchor 
sudo -u unbound
# preparation for installing AUR following arch wiki
sudo pacman -Syu --needed base-devel
# configuring nsswitch (avahi)
sudo vim /etc/nsswitch.conf
sudo pacman -Ss avahi
# install gnome disk
sudo pacman -Syu gnome-disk-utility
# install neofetch AUR
git clone https://aur.archlinux.org/neofetch.git
cd neofetch
less PKGBUILD
$pkgdir
echo $pkgdir
less PKGBUILD
makepkg -si
# install rofi
sudo pacman -Syu rofi
\trofi
rofi --show run
rofi -show run
rofi -show window
# configuring i3
vim .config/i3/config
find ~| grep rambox
# rank arch repositories mirror to rank fastest mirrors
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
vim /etc/pacman.d/mirrorlist.backup
sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
sudo su
# install dependency for i3 layout saving and restoring
sudo pacman -Syu perl-anyevent-i3 perl-json-xs
# install feh image viewer and wallpaper changer
sudo pacman -Syu feh
# set wallpaper
feh --bg-scale /media/Consume/Hatsune\ Miku\ Hibikase.jpg
# call gnome terminal prefference
gnome-terminal --preferences
# install redshift
sudo pacman -Syu redshift
# configure redshift
vim .config/redshift.conf
# install redshift dependencies
sudo pacman -Syu python-xdg
redshift-gtk
# save i3 layout
i3-save-tree --workspace 1 > .config/i3/workspace-1.json
workrave
# install xbacklight to configure brightness failure because redshift sets brightness every second
sudo pacman -Syu xorg-xbacklight
# set brightness of xsession overwritten by redshift
xrandr --output LVDS-1-1 --brightness 0.2
xrandr --output LVDS-1-1 --brightness 0.5
ping 192.168.0.22
ping 192.168.0.254
ping 192.168.10.254
# configure saved layout from i3
vim .config/i3/workspace-1.json 
# set screen brightness (fail)
xbacklight -inc 10
xbacklight -set 10
# restore saved layout on i3
i3-msg "workspace 1; append_layout .config/i3/workspace-1.json"\n
# install dzen2 scriptable thing (awesome)
sudo pacman -Syu dzen2
dzen2
# hello world with dzen2
while sleep 1; do echo "Hello World"; done | dzen2 -w 640
# print date
date
date --help
# volume control
pactl set-sink-mute 0 false ; pactl set-sink-volume 0 5%
pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%
pactl info
# Volume information
amixer --help
awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master)
awk -F"[][]" '/dB/ { print $2 }' <(amixer get Master)
amixer get Master
# mute velume
pactl set-sink-mute 0 toggle
awk --help
man awk
# grabbing ESSID from iwconfig
iwconfig wlp3s0| grep ESSID|awk -F: '{print $2}'
wifi=$(iwconfig wlp3s0| grep ESSID|awk -F: '{print $2}')
echo $wifi
sed -e 's/^"//' -e 's/"  //'<<<$wifi
history| grep sudo|sed -e 's/[\t\v\r ]+/ /' -e 's/^  //' -e 's/^ //'|cut -d" " -f 3-\n
##################################### DOCUMENTATION END FOR 25 January 2018 #####################################
################## DOCUMENTATION 2 February 2018 Start #########
# get volume indication
amixer get Master| sed -e '1,/Mono/d'| awk '{print $5}'| sed -e 's/^\[//' -e 's/\]$//'| tr '\r\n' ' '
# get mute indication of master channel
amixer get Master| sed -e '1,/Mono/d'| awk '{print $6}'| sed -e 's/^\[//' -e 's/\]$//'| tr '\r\n' ' '| cut -d' ' -f 1
ip addr show
hostname -i
hostname -h
hostname --help
i3-msg workspace
i3-msg GET_WORKSPACE
i3-msg 1
i3-msg "workspace"
i3-msg -t get_workspaces
# set output to become primary display
xrandr --output LVDS-1-1 --primary
tmux ls
tmux attach -t 0
sudo pacman -Syu flameshot
sudo pacman -Syu conky
conky
sudo pacman -Syu lemonbar
sudo pacman -Syu libxcb
sudo pacman -Syu\n: 1516972486:0;sudo pacman -Syu
sudo pacman -Syu libxcb
# installing libXCB for lemonbar
cd /media/Consume
git clone https://github.com/LemonBoy/bar.git
cd bar
make
sudo make install
# Install lemonbar done so fast
mkdir .local/share/fonts
fc-cache
sudo pacman -Syu xorg-xfontsel
# configure dnscrypt
dnscrypt-proxy --list-resolver
dnscrypt-proxy --L
dnscrypt-proxy -L
less /usr/share/dnscrypt-proxy/dnscrypt-resolvers.csv
vim /etc/unbound/unbound.conf
sudo vim /etc/unbound/unbound.conf
sudo vim /etc/dnscrypt-proxy.conf
sudo systemctl restart unbound.service
sudo systemctl start dnscrypt-proxy.service
sudo systemctl stop dnscrypt-proxy.socket
sudo systemctl start dnscrypt-proxy.socket
journalctl -xe
sudo systemctl edit dnscrypt-proxy.socket
sudo systemctl edit dnscrypt-proxy.service
# port listing
ss -l | grep -vE '^(nl |u_)\n'
ss -l
# change port of dnscrypt proxy
sudo systemctl start dnscrypt-proxy.socket
sudo systemctl edit dnscrypt-proxy.service
cat /etc/systemd/system/dnscrypt-proxy.service.d/override.conf
sudo systemctl edit dnscrypt-proxy.socket
sudo systemctl start dnscrypt-proxy.service
sudo vim /etc/unbound/unbound.conf
sudo systemctl restart unbound.service
sudo systemctl stop dnscrypt-proxy.socket
sudo systemctl status dnscrypt-proxy.socket
dirname .files/statusbar.sh
whoami
i3bar echo "hello world" --bar_id=3
# show short hostname (computer name)
hostname -s
# show kernel name
uname -s
# show kernel architecture
uname -m
# install scrot to take screenshot
sudo pacman -Syyu giblib
sudo pacman -Syu scrot
scrot
# kulgram bash bot
cd /media/Produce/Projects/Software_Projects/
mkdir A3BashBot
echo "token="$token>A3BashBot/config.sh
cd A3BashBot
cat config.sh
tele_url="https://api.telegram.org/bot${token}"
echo 'tele_url="https://api.telegram.org/bot${token}"'>>config.sh
curl -s "${tele_url}/getMe"| json_reformat
curl -s "${tele_url}/getUpdates"| json_reformat
# image magick to convert image
sudo pacman -Syu imagemagick
# install image magick to convert images
curl -s "${tele_url}/getUpdates" | jq -r ".result"
# install jq to query json in bash
sudo pacman -Syu jq
curl -s "${tele_url}/getUpdates" | jq -r ".result"
curl -s "${tele_url}/getUpdates" | jq -r ".result.message"
curl -s "${tele_url}/getUpdates" | jq -r ".result[].message"
curl -s "${tele_url}/getUpdates" | jq -r ".result[].message.chat.text"
curl -s "${tele_url}/getUpdates" | jq -r ".result[].message.text"
curl -s "${tele_url}/getUpdates" | jq -r ".result[].message.chat.id"
curl -s "${tele_url}/sendMessage?chat_id=${chat_id}" \\n  --data-urlencode "text=I Am BOT Hello Human" | json_reformat
chat_id=50163699
curl -s "${tele_url}/sendMessage?chat_id=${chat_id}" \\n  --data-urlencode "text=I Am BOT Hello Human" | json_reformat
curl -s "${tele_url}/getUpdates?offset=470357060"
curl -s "${tele_url}/getUpdates?offset=50163699"
curl -s "${tele_url}/getUpdates?offset=1517064599"
curl -s "${tele_url}/getUpdates?offset=1517064599"| json_reformat
# end of Kulgram Bash
# get information about network device status
cat /sys/class/net/enp4s0f2/carrier
cat /sys/class/net/enp4s0f2/operstate
# get cpu usage 
echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]
# get battery status 
cat /sys/class/power_supply/BAT0/capacity
cat /sys/class/power_supply/BAT0/status
# get CPU usage from ps extremely high value
ps -eo pcpu | grep -vE '^\s*(0.0|%CPU)'
LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
echo $LINE
bc LINE
bc <<< LINE
ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}'
# install xorg-xprop for grabbing active windows
# grabbing active window
sudo pacman -Syu xorg-xprop
sudo pacman -Syu
sudo pacman -Syu xorg-xprop
xprop -root
xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'
id=(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
echo id
echo $id
xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2
echo $name
htop
# get CPU usage from file in root
cat /proc/stat 
grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'
top -b -n2 | grep "Cpu(s)" | awk '{print $2+$4 "%"}' | tail -n1
# install gnome system monitor
sudo pacman -Syu
sudo pacman -Syu gnome-system-monitor
# setup git
git config --global user.name as3mbus
git config --global user.email asembus@gmail.com
# kulgram continue
curl -s "${tele_url}/getUpdates" | jq -r ".result[].message.chat.id"
source config.sh
curl -s "${tele_url}/getUpdates" | jq -r ".result[].message.chat.id"
echo $tele_url
curl -s "${tele_url}/getUpdates" 
curl -s "${tele_url}/getUpdates" | json_reformat
echo "hello bro"|head -n 1|awk '{print $1}'
git log
./main.sh
./main.sh -h
./main.sh 1
./main.sh version
./main.sh -v
./main.sh --v
# report SSID of wireless device
iwgetid -r
iwgetid --help
man iwgetid
iwgetid
iwgetid -r
# print entire status of network interface
grep "" /sys/class/net/enp4s0f2/* 
cat /sys/class/net/enp4s0f2/operstate
# install siji font
git clone https://github.com/stark/siji && cd siji
sh install.sh -d ~/.local/share/fonts
cd ..
vim .xinitrc
# install xfd to view siji fonts
sudo pacman -Syu
sudo pacman -Syu xorg-xfd
cd siji/
sh view.sh
# grab wireless link quality
iwconfig wlp3s0| grep Link|sed -re 's/.*=([0-9]+\/[0-9]+).*/\1/g'|sed -e 's/\// \/ /'| awk '{print $1 * 100 / $3}'
cat /sys/class/net/wlp3s0/carrier
cat /sys/class/net/enp4s0f2/carrier
0 -eq 2
# use if with spaced bracket
if [ 0 -eq 1 ]; then\necho true\nfi
grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'
# get recieved byte of an interface *netspeed indicator
cat /sys/class/net/wlp3s0/statistics/rx_bytes
xinit /usr/bin/gnome-session -- :2
cat ../.local/share/fonts/fonts.dir
# install font awesome
sudo pacman -Syu ttf-font-awesome
fc-match
# get audio Volume
amixer get Master| sed -e '1,/Mono/d'| awk '{print $5}'| tr '\r\n' ' '| cut -d' ' -f 1| sed -e 's/\[\([0-9]\+%\)\]/\1/'
# install unity3d editor AUR
git clone https://aur.archlinux.org/unity-editor.git
cd /media/Produce/Projects/Game-Projects/Unity-Projects/Unity-Open-Stories/Assets
cd unity-editor
less PKGBUILD
sudo pacman -Syu
makepkg -si
# install nethogs to monitor network usage of app
sudo pacman -Syu nethogs
sudo nethogs -a wlp3s0
# tweaking with groups and permissions
groups
groups storage
groupmems storage
grep storage /etc/group
groups
grep wheel /etc/group
grep users /etc/group
groups as3mbus
members users
sudo groupadd executors
sudo usermod -G executors
sudo usermod -G executors as3mbus
sudo groups as3mbus
groups as3mbus
sudo usermod -G executors,wheel,power,storage
sudo usermod -G executors,wheel,power,storage as3mbus
groups as3mbus
chown -R :executors Unity
sudo chown -R :executors Unity
chmod g+x Unity
sudo chmod g+x Unity
unity-editor
sudo chmod o+x Unity
unity-editor
cat .config/unity3d/Editor.log
sudo chown -R as3mbus /opt/Unity
# installing unity editor android build support
git clone https://aur.archlinux.org/unity-editor-android.git
cd unity-editor-android
makepkg -si
vim .vim/vimrc
# installing yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
less PKGBUILD
makepkg -si
cd ../
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
less PKGBUILD
makepkg -si
less PKGBUILD
sudo pacman -Syu
yaourt -Syu --aur
Yaourt -Syu unity-editor-android
yaourt -Syu unity-editor-android
# change shell interface
PS1='\e[s\e[0;0H\e[1;33m\h    \t\n\e[1;32mThis is my computer\e[u[\u@\h:  \w]\$ '
PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '
echo $PS!
echo $PS1
# add padding to terminal
vim .config/gtk-3.0/gtk.css
vim .config/gtk-3.0/gtk.css
vim .config/gtk-3.0/gtk.css
vim .config/gtk-3.0/gtk.css
vim .config/gtk-3.0/gtk.css
# install light to configure brightness with redshift
cd /media/Consume/AUR
git clone https://aur.archlinux.org/light.git
vim PKGBUILD
ls
makepkg -si
light -A 10
light -A 20
# reinstall polybar
git clone https://aur.archlinux.org/polybar-git.git
cd polybar-git
sudo pacman -Syu
printf "%b" "\033]11;#ff0000\007"
vim PKGBUILD
makepkg -si
sudo pacman -Syyu
makepkg -si
polybar example
# installing font
fc-cache
xset fp rehash
mkfontscale $fontdir
mkfontdir $fontdir
xset +fp $fontdir # add this to xinitrc
xset fp rehash # with this
vim ~/.xinitrc
fc-cache -f -v
# get registered font
fc-list | grep "Hack"
# improve font renderring
# https://wiki.manjaro.org/index.php?title=Improve_Font_Rendering
sudo vim /etc/fonts/local.conf
vim .Xresources
xrdb -merge ~/.Xresources
reboot
# configuring polybar from base example
cp /usr/share/doc/polybar/config .config/polybar/config
# edit font siji to wuncon siji
vim .config/polybar/config
polybar miku
# reinstall polybar because of updated libjsoncpp
git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
cd polybar
mkdir build
cd build
git checkout master
cd build
cmake ..
sudo make install
polybar miku
# install gnome char picker
sudo pacman -Syyu
sudo pacman -Syu gnome-characters
# install IPA font for japannese words
sudo pacman -Syu otf-ipafont
# install flash player plugin for firefox
sudo pacman -Syu flashplugin
polybar miku
FC_DEBUG=1 polybar miku
# remove gnome characters picker 
sudo pacman -Rsn gnome-characters
# character map to locate character availability
sudo pacman -Syu gucharmap
############################ Documentation End For 2 February 2018 #######################
