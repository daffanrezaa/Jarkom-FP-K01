enable
conf t
hostname R-Cabang

router ospf 1
 ! Lapor ke Pusat lewat link WAN
 network 10.0.5.48 0.0.0.7 area 0
 
 ! Laporin LAN Lokal Cabang biar orang pusat bisa akses
 network 10.0.4.192 0.0.0.63 area 0
 exit
do write