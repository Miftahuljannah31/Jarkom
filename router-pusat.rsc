# nov/16/2023 17:27:02 by RouterOS 6.48.7
# software id = 44UU-TR2K
#
# model = RouterBOARD 941-2nD
# serial number = 8B0E08B7BB28
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.100.2-192.168.100.254
add name=dhcp_pool1 ranges=1.1.1.2-1.1.1.254
add name=dhcp_pool2 ranges=192.168.2.2-192.168.2.254
add name=dhcp_pool3 ranges=192.168.2.2-192.168.2.254
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no interface=ether4 name=dhcp2
add address-pool=dhcp_pool3 disabled=no interface=ether2 name=dhcp1
/ip address
add address=1.1.1.1/24 interface=ether4 network=1.1.1.0
add address=192.168.2.1/24 interface=ether2 network=192.168.2.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=1.1.1.0/24 gateway=1.1.1.1
add address=192.168.2.0/24 gateway=192.168.2.1
add address=192.168.100.0/24 gateway=192.168.100.1
/ip firewall nat
add action=masquerade chain=srcnat
/routing ospf network
add area=backbone network=1.1.1.0/24
add area=backbone network=192.168.1.0/24
add area=backbone network=192.168.2.0/24
/system clock
set time-zone-name=Asia/Jakarta
