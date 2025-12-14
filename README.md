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
### Pembagian Subnet (CIDR)

Pada bagian ini, dilakukan pengelompokan subnet (Aggregation) untuk menyederhanakan tabel routing. Berikut adalah detail perhitungan IP.

### 1. Tabel Pembagian Subnet (Level Daun)

Berikut adalah alokasi IP untuk setiap departemen di Gedung ARA Tech:

| Subnet | Kebutuhan Host | Network ID | Subnet Mask | Range IP | Prefix |
| :--- | :---: | :--- | :--- | :--- | :---: |
| **A15** | 104 | `10.0.8.0` | `255.255.255.128` | `.8.1` - `.8.126` | **/25** |
| **A17** | 102 | `10.0.8.128`| `255.255.255.128` | `.8.129` - `.8.254` | **/25** |
| **A16** | 88 | `10.0.9.0` | `255.255.255.128` | `.9.1` - `.9.126` | **/25** |
| **A18** | 81 | `10.0.9.128`| `255.255.255.128` | `.9.129` - `.9.254` | **/25** |
| **A14** | 45 | `10.0.10.0` | `255.255.255.192` | `.10.1` - `.10.62` | **/26** |
| **A13** | 15 | `10.0.10.64`| `255.255.255.224` | `.10.65` - `.10.94` | **/27** |
| **A12** | 3 | `10.0.10.96`| `255.255.255.248` | `.10.97` - `.10.102` | **/29** |

---

### 2. Proses Supernetting (Aggregation)

Penggabungan dilakukan bertahap dari level terendah hingga level tertinggi (Root).

#### **Tahap 1: Penggabungan Level B (Prefix /24)**
Kami menggabungkan subnet-subnet kecil menjadi blok /24 sesuai struktur departemen.

| Blok | Gabungan Dari | Network ID | Range IP | Prefix Baru |
| :--- | :--- | :--- | :--- | :--- |
| **B1** | A16 + A17 | **10.0.8.0** | `.8.1` - `.8.254` | **/24** |
| **B2** | A14 + A15 | **10.0.10.0** | `.10.1` - `.10.254` | **/24** |

#### **Tahap 2: Penggabungan Level C (Prefix /23)**
Menggabungkan Blok B dengan sisa subnet lain.

| Blok | Gabungan Dari | Network ID | Range IP | Prefix Baru |
| :--- | :--- | :--- | :--- | :--- |
| **C1** | B1 + A18 | **10.0.8.0** | `.8.1` - `.9.254` | **/23** |
| **C2** | B2 + A13 | **10.0.10.0** | `.10.1` - `.11.254` | **/23** |

#### **Tahap 3 & Final: Supernet Utama (Prefix /21)**
Menggabungkan seluruh blok Gedung ARA Tech menjadi satu jalur routing utama.

| Blok | Gabungan Dari | Network ID | Range IP | Prefix Baru |
| :--- | :--- | :--- | :--- | :--- |
| **D1** | C1 + C2 | **10.0.8.0** | `.8.1` - `.11.254` | **/22** |
| **E1** | D1 + A12 | **10.0.8.0** | `.8.1` - `.15.254` | **/21** |

---

### 3. Diagram Pohon CIDR (CIDR Tree)

Berikut adalah visualisasi struktur IP Address untuk Gedung ARA Tech. Diagram ini menunjukkan bagaimana subnet-subnet kecil (Daun) digabungkan menjadi Supernet (Root).

![CIDR Tree Diagram](path/to/your/image.png)
*(Ganti `path/to/your/image.png` dengan lokasi file gambar Tree CIDR kamu)*

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
