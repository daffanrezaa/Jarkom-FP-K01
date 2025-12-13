enable
configure terminal
hostname R-Cabang

! ---------------------------------------------------------
! KONEKSI KE ROUTER UTAMA (WAN)
! Sambungan Kabel: Port Gig0/3/0 dicolok ke Router Utama
! Subnet: A1 (IP 10.0.5.50/29)
! ---------------------------------------------------------
interface GigabitEthernet0/3/0
 description Link ke R-Utama
 ip address 10.0.5.50 255.255.255.248
 no shutdown
 exit

! ---------------------------------------------------------
! KONEKSI KE LAN CABANG (LAN)
! Sambungan Kabel: Port Gig0/0 dicolok ke Switch/PC Subnet A2
! Subnet: A2 (IP 10.0.4.193/26)
! ---------------------------------------------------------
interface GigabitEthernet0/0
 description Gateway LAN Regional (Subnet A2)
 ip address 10.0.4.193 255.255.255.192
 no shutdown
 exit

! --- AMANKAN IP GATEWAY ---
! Agar IP router tidak diberikan ke user
ip dhcp excluded-address 10.0.4.193

! --- BUAT POOL DHCP (LAN CABANG) ---
ip dhcp pool LAN_CABANG
 ! Network ID Subnet A2 (Sesuai Tabel)
 network 10.0.4.192 255.255.255.192
 ! Gateway (IP Interface Gig0/0 R-Cabang)
 default-router 10.0.4.193
 ! DNS Google
 dns-server 8.8.8.8
 exit

! Simpan konfigurasi
do write