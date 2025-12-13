enable
conf t
! Arahkan semua trafik asing ke R-Utama
ip route 0.0.0.0 0.0.0.0 10.0.5.57
end
write