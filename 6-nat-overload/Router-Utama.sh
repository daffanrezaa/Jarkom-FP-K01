enable
configure terminal
hostname R-Utama

! --- 1. BUAT ACCESS LIST (ACL) ---
! Kita izinkan semua IP yang berawalan 10.0.x.x untuk di-NAT ke internet.
! Wildcard 0.255.255.255 artinya "semua subnet 10.0.0.0/8"
access-list 1 permit 10.0.0.0 0.255.255.255

! --- 2. TENTUKAN INTERFACE 'INSIDE' DAN 'OUTSIDE' ---

! Interface ke Internet (ISP) -> OUTSIDE
! (Sesuaikan g0/0 dengan port yang nyolok ke Cloud/Internet)
interface GigabitEthernet0/0
 ip nat outside
 exit

! Interface ke DSW-Utama (Lokal) -> INSIDE
! (Sesuaikan g0/1 dengan port yang nyolok ke Switch Utama)
interface GigabitEthernet0/1
 ip nat inside
 exit

! Interface ke R-ARATech (Gedung Sebelah) -> INSIDE
! Wajib diset 'inside' agar trafik dari gedung ARA juga bisa internetan
interface GigabitEthernet0/2/0  
 ip nat inside
 exit

! Interface ke R-Cabang (Regional) -> INSIDE
! Wajib diset 'inside' agar trafik dari cabang juga bisa internetan
interface GigabitEthernet0/3/0
 ip nat inside
 exit

! --- 3. AKTIFKAN NAT OVERLOAD (PAT) ---
! "Terjemahkan traffic dari List 1 ke IP Interface Gig0/0 menggunakan metode Overload"
ip nat inside source list 1 interface GigabitEthernet0/0 overload

! Simpan konfigurasi
do write