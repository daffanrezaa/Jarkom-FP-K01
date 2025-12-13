# =========================================================
# PANDUAN KONFIGURASI IP SERVER (MANUAL GUI)
# =========================================================
# Karena ini Packet Tracer, Server tidak dikonfig via CLI.
# Caranya: Klik Server > Tab Desktop > IP Configuration.
# Masukkan data berikut sesuai nama servernya.
# =========================================================

# ---------------------------------------------------------
# 1. SERVER IT PENDIDIKAN (Di Kantor Utama)
# Lokasi: Subnet A8 (VLAN 80)
# ---------------------------------------------------------
IPv4 Address    : 10.0.5.34
Subnet Mask     : 255.255.255.240
Default Gateway : 10.0.5.33
DNS Server      : 8.8.8.8

# ---------------------------------------------------------
# 2. SERVER DATACENTER (Di Kantor ARA Tech)
# Lokasi: Subnet A13 (VLAN 130)
# ---------------------------------------------------------
IPv4 Address    : 10.0.10.66
Subnet Mask     : 255.255.255.224
Default Gateway : 10.0.10.65
DNS Server      : 8.8.8.8

# ---------------------------------------------------------
# 3. SERVER RND (Di Kantor ARA Tech)
# Lokasi: Subnet A16 (VLAN 160)
# ---------------------------------------------------------
IPv4 Address    : 10.0.9.2
Subnet Mask     : 255.255.255.128
Default Gateway : 10.0.9.1
DNS Server      : 8.8.8.8

# ---------------------------------------------------------
# 4. SERVER CYSEC (Di Kantor ARA Tech)
# Lokasi: Subnet A18 (VLAN 180)
# ---------------------------------------------------------
IPv4 Address    : 10.0.9.130
Subnet Mask     : 255.255.255.128
Default Gateway : 10.0.9.129
DNS Server      : 8.8.8.8
