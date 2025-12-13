enable
configure terminal
hostname R-Cabang

! --- MEMBUAT INTERFACE TUNNEL 0 ---
interface Tunnel0
 ! IP Address Virtual untuk Tunnel (Sisi Cabang)
 ip address 192.168.100.2 255.255.255.252
 
 ! Pintu masuk tunnel (Interface Fisik R-Cabang - SESUAI INFO KAMU)
 tunnel source GigabitEthernet0/3/0
 
 ! Ujung tunnel (IP Fisik R-Utama)
 tunnel destination 10.0.5.49
 
 ! Aktifkan
 no shutdown
 exit

do write

#test:
ping 192.168.100.2