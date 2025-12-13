enable
configure terminal
hostname ISP

! --- 1. SETTING GATEWAY (Pasangan R-Utama) ---
! Ini adalah IP yang dicari-cari oleh R-Utama (Gateway)
interface GigabitEthernet0/0
 ip address 203.0.113.1 255.255.255.0
 no shutdown
 exit

! --- 2. SIMULASI GOOGLE (8.8.8.8) ---
! Kita pakai Interface Loopback untuk pura-pura jadi server Google
interface Loopback0
 ip address 8.8.8.8 255.255.255.255
 exit

! Simpan
do write