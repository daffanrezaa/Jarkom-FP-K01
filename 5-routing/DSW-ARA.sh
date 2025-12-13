enable
conf t
! Arahkan semua trafik asing ke R-ARATech
ip route 0.0.0.0 0.0.0.0 10.0.10.97
end
write