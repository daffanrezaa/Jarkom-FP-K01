enable
configure terminal
hostname R-Utama

! ---------------------------------------------------------
! KONEKSI KE INTERNET (CLOUD/NAT)
! Sambungan Kabel: Port Gig0/0 dicolok ke Cloud/Modem ISP
! IP Public (Contoh): 203.0.113.2/24 (Gateway ISP: 203.0.113.1)
! ---------------------------------------------------------
interface GigabitEthernet0/0
 description Link ke NAT/Cloud Internet
 ip address 203.0.113.2 255.255.255.0
 no shutdown
 exit

! ---------------------------------------------------------
! KONEKSI KE DISTRIBUTION SWITCH (DSW-UTAMA)
! Sambungan Kabel: Port Gig0/1 dicolok ke DSW-Utama (Port Gig1/0/1)
! Subnet: A3 (IP 10.0.5.57/29)
! ---------------------------------------------------------
interface GigabitEthernet0/1
 description Link ke DSW-Utama
 ip address 10.0.5.57 255.255.255.248
 no shutdown
 exit

! ---------------------------------------------------------
! KONEKSI KE R-ARATECH
! Sambungan Kabel: Port Gig0/2/0 dicolok ke R-ARATech
! Subnet: A11 (IP 10.0.5.65/29)
! ---------------------------------------------------------
interface GigabitEthernet0/2/0
 description Link ke R-ARATech (Fiber)
 ip address 10.0.5.65 255.255.255.248
 no shutdown
 exit

! ---------------------------------------------------------
! KONEKSI KE R-CABANG
! Sambungan Kabel: Port Gig0/3/0 dicolok ke R-Cabang
! Subnet: A1 (IP 10.0.5.49/29)
! ---------------------------------------------------------
interface GigabitEthernet0/3/0
 description Link ke R-Cabang (Fiber)
 ip address 10.0.5.49 255.255.255.248
 no shutdown
 exit

! ---------------------------------------------------------
! ROUTING (DEFAULT ROUTE)
! Mengarahkan traffic internet ke Gateway ISP
! ---------------------------------------------------------
ip route 0.0.0.0 0.0.0.0 203.0.113.1

! Simpan konfigurasi
do write