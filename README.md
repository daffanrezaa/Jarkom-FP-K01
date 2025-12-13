# Laporan Final Project Jarkom - K01

**Anggota Kelompok:**
1. Nama - NRP
2. Nama - NRP
3. Nama - NRP
4. Nama - NRP

---

## 1. Pendahuluan
*(Penjelasan singkat mengenai proyek dan tujuan utamanya.)*

## 2. Topologi & IP Plan

### Topologi Jaringan
*   **Gambar Topologi Logis**
    *   `![Topologi Utama](assets/1-topologi-utama.png)`
    *   `![Topologi ARA](assets/1-topologi-ara.png)`
    *   `![Topologi Cabang](assets/1-topologi-cabang.png)`

### Pembagian Subnet (VLSM)
*   Tabel alokasi IP untuk setiap divisi berdasarkan kebutuhan host (Network ID, Gateway, Netmask).

---

## 3. Implementasi & Konfigurasi
*(Bagian ini akan berisi dokumentasi konfigurasi untuk setiap fitur, disertai penjelasan dan screenshot.)*

### A. Konfigurasi Switching (VLAN & DHCP)
*   **1. VLAN Database & SVI**
    *   Dokumentasi konfigurasi VLAN dan SVI (Gateway) pada Layer 3 Switch.
    *   Screenshot Konfigurasi.
*   **2. DHCP Server**
    *   Dokumentasi konfigurasi DHCP Pool untuk setiap VLAN.
    *   Screenshot Konfigurasi.

### B. Routing (OSPF & Static)
*   **1. Static Route (Internal)**
    *   Dokumentasi konfigurasi Static Route di router.
*   **2. OSPF Config**
    *   Dokumentasi konfigurasi OSPF.
    *   Screenshot Tabel Routing (`show ip route`).

### C. NAT Overload (Internet Access)
*   **1. Interface Inside/Outside**
    *   Screenshot penentuan interface Inside dan Outside.
*   **2. NAT Configuration**
    *   Dokumentasi konfigurasi Access List (ACL) dan NAT Overload.
    *   Screenshot Konfigurasi NAT.

### D. GRE Tunnel
*   **1. Interface Tunnel pada Router Utama**
    *   Dokumentasi konfigurasi IP Tunnel, tunnel source, dan tunnel destination.
*   **2. Interface Tunnel pada Router Cabang**
    *   Dokumentasi konfigurasi IP Tunnel, tunnel source, dan tunnel destination.
*   **3. Routing via Tunnel**
    *   Bukti konfigurasi routing (statis/dinamis) yang melewati interface Tunnel.
    *   Screenshot Konfigurasi Tunnel.

---

## 4. Pengujian & Verifikasi
*(Bagian ini berisi bukti verifikasi fungsionalitas, umumnya dalam bentuk screenshot ping/traceroute/console.)*

### 1. Tes Koneksi Inter-VLAN
*   Bukti: Screenshot Ping antar PC Client di VLAN yang berbeda.

### 2. Tes Akses Internet (NAT)
*   Bukti Ping: Screenshot Ping ke alamat internet publik (misalnya 8.8.8.8) dari Client.
*   Bukti Tabel NAT: Screenshot `show ip nat translations` atau `show ip nat statistics`.

### 3. Tes GRE Tunnel
*   Bukti Traceroute: Screenshot `traceroute` dari Client Cabang ke Client Utama yang menunjukkan jalur melewati IP Tunnel.

---

## 5. Kesimpulan
*(Ringkasan hasil implementasi dan verifikasi.)*

---

**Informasi VLAN (Untuk Referensi)**

**DSW-Utama (Kantor Utama):**
*   VLAN 40: A4 - SDM
*   VLAN 50: A5 - Kurikulum
*   VLAN 60: A6 - Sarpras
*   VLAN 70: A7 - Pengawasan
*   VLAN 80: A8 - IT Pendidikan
*   VLAN 90: A9 - LOY 1
*   VLAN 100: A10 - LOY 2

**DSW-ARA (Kantor ARA):**
*   VLAN 130: A13 - DataCenter
*   VLAN 140: A14 - Umum (EO, Guest, dll)
*   VLAN 150: A15 - Keuangan, Legal
*   VLAN 160: A16 - PeopleDev, RND
*   VLAN 170: A17 - Marketing, Sales
*   VLAN 180: A18 - ITSupport, Cysec