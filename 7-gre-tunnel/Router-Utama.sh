enable
configure terminal
hostname R-Utama

! --- MEMBUAT INTERFACE TUNNEL 0 ---
interface Tunnel0
 ! IP Address Virtual untuk Tunnel (Sisi Pusat)
 ip address 192.168.100.1 255.255.255.252
 
 ! Pintu masuk tunnel (Interface Fisik R-Utama)
 tunnel source GigabitEthernet0/3/0
 
 ! Ujung tunnel (IP Fisik R-Cabang)
 tunnel destination 10.0.5.50
 
 ! Aktifkan
 no shutdown
 exit

do write

#test:
ping 192.168.100.2