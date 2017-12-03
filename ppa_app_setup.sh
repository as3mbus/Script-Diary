#!/bin.bash
#install inkscape and it's PPA
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get update
sudo apt-get install inkscape

#install redshift 
sudo apt-get install redshift-gtk
cat > foo.conf << EOF
[redshift]
; Set the day and night screen temperatures
temp-day=5700
temp-night=3600

; Set the screen brightness. Default is 1.0
;brightness=0.9
; It is also possible to use different settings for day and night since version 1.8.
;brightness-day=0.7
;brightness-night=0.4
; Set the screen gamma (for all colors, or each color channel individually)
gamma=0.8

;gamma=0.8:0.7:0.8
; Set the location-provider: 'geoclue', 'gnome-clock', 'manual'
; type 'redshift -l list' to see possible values
; The location provider settings are in a different section.
location-provider=manual

; Set the adjustment-method: 'randr', 'vidmode'
; type 'redshift -m list' to see all possible values
; 'randr' is the preferred method, 'vidmode' is an older API
; but works in some cases when 'randr' does not.
; The adjustment method settings are in a different section.
adjustment-method=randr

; Configuration of the location-provider:
; type 'redshift -l PROVIDER:help' to see the settings
; e.g. 'redshift -l manual:help'
[manual]
lat=43
lon=1

; Configuration of the adjustment-method
; type 'redshift -m METHOD:help' to see the settings
; ex: 'redshift -m randr:help'
; In this example, randr is configured to adjust screen 1.
; Note that the numbering starts from 0, so this is actually the second screen.
[randr]
screen=0
EOF
