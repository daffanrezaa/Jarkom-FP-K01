enable
configure terminal
hostname DSW-Utama

! --- 1. AKTIFKAN FITUR ROUTING (WAJIB) ---
ip routing

! --- 2. KONFIGURASI DHCP SERVER ---
! Exclude IP Gateway & Server agar tidak bentrok
ip dhcp excluded-address 10.0.0.1
ip dhcp excluded-address 10.0.2.1
ip dhcp excluded-address 10.0.3.1
ip dhcp excluded-address 10.0.4.1
ip dhcp excluded-address 10.0.4.129
ip dhcp excluded-address 10.0.5.1
ip dhcp excluded-address 10.0.5.33 10.0.5.34

! Pool A4 - SDM
ip dhcp pool SDM
 network 10.0.4.0 255.255.255.128
 default-router 10.0.4.1
 dns-server 8.8.8.8
 exit

! Pool A5 - Kurikulum
ip dhcp pool Kurikulum
 network 10.0.0.0 255.255.254.0
 default-router 10.0.0.1
 dns-server 8.8.8.8
 exit

! Pool A6 - Sarpras
ip dhcp pool Sarpras
 network 10.0.4.128 255.255.255.192
 default-router 10.0.4.129
 dns-server 8.8.8.8
 exit

! Pool A7 - Pengawasan
ip dhcp pool Pengawasan
 network 10.0.5.0 255.255.255.224
 default-router 10.0.5.1
 dns-server 8.8.8.8
 exit

! Pool A8 - IT Pendidikan
ip dhcp pool ITPendidikan
 network 10.0.5.32 255.255.255.240
 default-router 10.0.5.33
 dns-server 8.8.8.8
 exit

! Pool A9 - LOY 1
ip dhcp pool LOY1
 network 10.0.2.0 255.255.255.0
 default-router 10.0.2.1
 dns-server 8.8.8.8
 exit

! Pool A10 - LOY 2
ip dhcp pool LOY2
 network 10.0.3.0 255.255.255.0
 default-router 10.0.3.1
 dns-server 8.8.8.8
 exit

! --- 3. MEMBUAT DATABASE VLAN ---
vlan 40
 name SDM
vlan 50
 name Kurikulum
vlan 60
 name Sarpras
vlan 70
 name Pengawasan
vlan 80
 name ITPendidikan
vlan 90
 name LOY1
vlan 100
 name LOY2
exit

! --- 4. KONFIGURASI PORT UPLINK (KE ROUTER) ---
interface GigabitEthernet1/0/1
 description Link ke R-Utama
 no switchport
 ip address 10.0.5.58 255.255.255.248
 no shutdown
 exit

! --- 5. KONFIGURASI PORT DOWNLINK ---
interface GigabitEthernet1/0/2
 description Link ke Unit SDM
 switchport mode access
 switchport access vlan 40
 no shutdown
 exit
interface GigabitEthernet1/0/3
 description Link ke Unit Kurikulum
 switchport mode access
 switchport access vlan 50
 no shutdown
 exit
interface GigabitEthernet1/0/4
 description Link ke Unit Sarpras
 switchport mode access
 switchport access vlan 60
 no shutdown
 exit
interface GigabitEthernet1/0/5
 description Link ke Unit Pengawasan
 switchport mode access
 switchport access vlan 70
 no shutdown
 exit
interface GigabitEthernet1/0/6
 description Link ke Unit IT Pendidikan
 switchport mode access
 switchport access vlan 80
 no shutdown
 exit
interface GigabitEthernet1/0/7
 description Link ke Unit LOY1
 switchport mode access
 switchport access vlan 90
 no shutdown
 exit
interface GigabitEthernet1/0/8
 description Link ke Unit LOY2
 switchport mode access
 switchport access vlan 100
 no shutdown
 exit

! --- 6. KONFIGURASI SVI (GATEWAY) ---
interface vlan 40
 ip address 10.0.4.1 255.255.255.128
 no shutdown
 exit
interface vlan 50
 ip address 10.0.0.1 255.255.254.0
 no shutdown
 exit
interface vlan 60
 ip address 10.0.4.129 255.255.255.192
 no shutdown
 exit
interface vlan 70
 ip address 10.0.5.1 255.255.255.224
 no shutdown
 exit
interface vlan 80
 ip address 10.0.5.33 255.255.255.240
 no shutdown
 exit
interface vlan 90
 ip address 10.0.2.1 255.255.255.0
 no shutdown
 exit
interface vlan 100
 ip address 10.0.3.1 255.255.255.0
 no shutdown
 exit

do write
