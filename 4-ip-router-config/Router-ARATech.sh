enable
configure terminal
hostname R-ARATech

! ---------------------------------------------------------
! KONEKSI KE ROUTER UTAMA (UPLINK)
! Sambungan Kabel: Port Gig0/3/0 dicolok ke Router Utama
! Subnet: A11 (IP 10.0.5.66/29)
! ---------------------------------------------------------
interface GigabitEthernet0/3/0
 description Link ke R-Utama
 ip address 10.0.5.66 255.255.255.248
 no shutdown
 exit

! ---------------------------------------------------------
! KONEKSI KE DISTRIBUTION SWITCH (DSW-ARA)
! Sambungan Kabel: Port Gig0/0 dicolok ke Switch DSW-ARA
! Subnet: A12 (IP 10.0.10.97/29)
! ---------------------------------------------------------
interface GigabitEthernet0/0
 description Link ke DSW-ARA
 ip address 10.0.10.97 255.255.255.248
 no shutdown
 exit

! Simpan konfigurasi
do write