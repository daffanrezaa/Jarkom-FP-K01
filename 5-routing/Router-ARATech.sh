enable
conf t
hostname R-ARATech

! --- A. STATIC ROUTE (INTERNAL) ---
! Kasih tau Router: "VLAN DataCenter dll ada di bawah DSW-ARA (.98)"
ip route 10.0.10.64 255.255.255.224 10.0.10.98
ip route 10.0.10.0 255.255.255.192 10.0.10.98
ip route 10.0.8.0 255.255.255.128 10.0.10.98
ip route 10.0.9.0 255.255.255.128 10.0.10.98
ip route 10.0.8.128 255.255.255.128 10.0.10.98
ip route 10.0.9.128 255.255.255.128 10.0.10.98

! --- B. OSPF (EKSTERNAL) ---
router ospf 1
 ! Kenalan sama R-Utama & DSW-ARA
 network 10.0.5.64 0.0.0.7 area 0
 network 10.0.10.96 0.0.0.7 area 0
 
 ! Sebarin info VLAN (Static) ke R-Utama
 redistribute static subnets
 exit
do write