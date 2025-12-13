enable
conf t
hostname R-Utama

! --- A. STATIC ROUTE (INTERNAL) ---
! Kasih tau Router: "Kalau mau ke VLAN X, lewatnya DSW-Utama (.58)"
ip route 10.0.4.0 255.255.255.128 10.0.5.58
ip route 10.0.0.0 255.255.254.0 10.0.5.58
ip route 10.0.4.128 255.255.255.192 10.0.5.58
ip route 10.0.5.0 255.255.255.224 10.0.5.58
ip route 10.0.5.32 255.255.255.240 10.0.5.58
ip route 10.0.2.0 255.255.255.0 10.0.5.58
ip route 10.0.3.0 255.255.255.0 10.0.5.58

! --- B. OSPF (EKSTERNAL) ---
router ospf 1
 ! Kenalan sama tetangga (Cabang & ARATech)
 network 10.0.5.48 0.0.0.7 area 0
 network 10.0.5.64 0.0.0.7 area 0
 network 10.0.5.56 0.0.0.7 area 0
 
 ! PENTING: Sebarin info Static Route (VLAN tadi) ke OSPF
 redistribute static subnets
 
 ! Bagi-bagi koneksi internet (Default Route) ke router lain
 default-information originate
 exit
do write