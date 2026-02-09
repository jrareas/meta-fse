ifconfig wlan0 up
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant.conf
#udhcpc -i wlan0 -t 5
