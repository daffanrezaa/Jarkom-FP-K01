enable
configure terminal
hostname DSW-ARA

! --- 1. AKTIFKAN ROUTING ENGINE (WAJIB) ---
! (Supaya antar VLAN bisa saling ping lokal)
ip routing

! --- 2. CONFIG DHCP & EXCLUDE ---
! Amankan IP Gateway & Server
ip dhcp excluded-address 10.0.10.65 10.0.10.66
ip dhcp excluded-address 10.0.10.1
ip dhcp excluded-address 10.0.8.1
ip dhcp excluded-address 10.0.9.1 10.0.9.2
ip dhcp excluded-address 10.0.8.129
ip dhcp excluded-address 10.0.9.129 10.0.9.140

! Definisi Pool
ip dhcp pool DataCenter
 network 10.0.10.64 255.255.255.224
 default-router 10.0.10.65
 dns-server 8.8.8.8
 exit

ip dhcp pool Umum_Guest
 network 10.0.10.0 255.255.255.192
 default-router 10.0.10.1
 dns-server 8.8.8.8
 exit

ip dhcp pool Keuangan_Legal
 network 10.0.8.0 255.255.255.128
 default-router 10.0.8.1
 dns-server 8.8.8.8
 exit

ip dhcp pool PeopleDev_RND
 network 10.0.9.0 255.255.255.128
 default-router 10.0.9.1
 dns-server 8.8.8.8
 exit

ip dhcp pool Marketing_Sales
 network 10.0.8.128 255.255.255.128
 default-router 10.0.8.129
 dns-server 8.8.8.8
 exit

ip dhcp pool ITSupp_Cysec
 network 10.0.9.128 255.255.255.128
 default-router 10.0.9.129
 dns-server 8.8.8.8
 exit

! --- 3. DATABASE VLAN ---
vlan 130
 name DataCenter
vlan 140
 name Umum_Guest
vlan 150
 name Keuangan_Legal
vlan 160
 name PeopleDev_RND
vlan 170
 name Marketing_Sales
vlan 180
 name ITSupp_Cysec
exit

! --- 4. CONFIG SVI (GATEWAY VLAN) ---
interface vlan 130
 ip address 10.0.10.65 255.255.255.224
 no shutdown
 exit
interface vlan 140
 ip address 10.0.10.1 255.255.255.192
 no shutdown
 exit
interface vlan 150
 ip address 10.0.8.1 255.255.255.128
 no shutdown
 exit
interface vlan 160
 ip address 10.0.9.1 255.255.255.128
 no shutdown
 exit
interface vlan 170
 ip address 10.0.8.129 255.255.255.128
 no shutdown
 exit
interface vlan 180
 ip address 10.0.9.129 255.255.255.128
 no shutdown
 exit

! --- 5. PORT UPLINK (Ke Router) ---
interface GigabitEthernet1/0/1
 description Link ke R-ARATech
 no switchport
 ip address 10.0.10.98 255.255.255.248
 no shutdown
 exit

! --- 6. PORT DOWNLINK (Access Mode) ---
interface GigabitEthernet1/0/2
 description Link ke DataCenter (V130)
 switchport mode access
 switchport access vlan 130
 no shutdown
 exit

interface GigabitEthernet1/0/3
 description Link ke ITSupp_Cysec (V180)
 switchport mode access
 switchport access vlan 180
 no shutdown
 exit

interface GigabitEthernet1/0/4
 description Link ke Marketing_Sales (V170)
 switchport mode access
 switchport access vlan 170
 no shutdown
 exit

interface GigabitEthernet1/0/5
 description Link ke PeopleDev_RND (V160)
 switchport mode access
 switchport access vlan 160
 no shutdown
 exit

interface GigabitEthernet1/0/6
 description Link ke Keuangan_Legal (V150)
 switchport mode access
 switchport access vlan 150
 no shutdown
 exit

interface GigabitEthernet1/0/7
 description Link ke Umum_Guest (V140)
 switchport mode access
 switchport access vlan 140
 no shutdown
 exit

! Simpan Config
do write

enable
configure terminal
do write