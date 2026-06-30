# 🚀 Ubuntu Server to Cloud Infrastructure: Level 0 to Level 6 Labs

Selamat datang di repositori dokumentasi laboratorium infrastruktur saya! Repositori ini berisi seluruh catatan konfigurasi, arsitektur jaringan, cetak biru Docker, dan perintah CLI sakral yang saya pelajari dan praktikkan secara mandiri dari dasar arsitektur server hingga implementasi jaringan tingkat lanjut.

---

## 🗺️ Peta Perjalanan Laboratorium

### 💻 Level 0: Virtualization & Environment Setup
* **Fokus:** Membangun lingkungan terisolasi baremetal menggunakan Hypervisor Oracle VirtualBox.
* **OS:** Ubuntu Server 22.04 LTS (2 GB RAM, 25 GB VDI Storage).
* **CLI Utama:** `uname -a`, `lsb_release -a`, `df -h`, `free -m`.

### 🛡️ Level 1: Linux Administration & SSH Hardening
* **Fokus:** Tata kelola hak akses user, migrasi adaptor jaringan ke *Host-Only* (`192.168.56.101`), dan pengamanan akses remote.
* **Aksi Kunci:** Mengubah port default SSH dari `22` menjadi `2222` di `/etc/ssh/sshd_config` serta melarang akses root langsung.
* **CLI Utama:** `sudo usermod -aG sudo vboxuser`, `sudo systemctl restart sshd`.

### 🧱 Level 2: Enterprise Firewall Protection
* **Fokus:** Menutup seluruh gerbang masuk server yang tidak digunakan menggunakan Netfilter UFW (Uncomplicated Firewall) untuk mencegah serangan siber.
* **Kebijakan Kebal:** `Default Deny Incoming` & `Default Allow Outgoing`.
* **Port yang Dibuka:** `2222/tcp` (SSH), `80/tcp` (HTTP), `443/tcp` (HTTPS), `8085/tcp` (Web Test).

### 🐳 Level 3: Docker Engine Core Lifecycle
* **Fokus:** Bermigrasi dari teknologi Virtual Machine yang berat ke wadah kontainerisasi yang super ringan demi efisiensi resource.
* **Aksi Kunci:** Manajemen siklus hidup container tunggal menggunakan Docker Engine.
* **CLI Utama:** `docker run hello-world`, `docker pull nginx:alpine`, `docker ps -a`.

### 📦 Level 4: Orchestration & Storage Persistence (Docker Compose)
* **Fokus:** Mengelola arsitektur multi-kontainer secara harmonis dalam satu jaringan bridge terisolasi sekaligus menjaga persistensi data menggunakan volume mounting.
* **Proyek Lab:** Deployment LAMP Stack (Linux, Apache, MySQL, PHP) mandiri lewat satu file YAML orkestrasi.
* **CLI Utama:** `docker compose up -d`, `docker compose down`, `docker rm -f <name>`.

### 🔄 Level 5: Advanced Networking & Path-Based Reverse Proxy
* **Fokus:** Manajemen lalu lintas jaringan modern. Memasang Nginx sebagai Reverse Proxy di garda terdepan untuk membelah trafik berdasarkan *Path* URL tanpa memunculkan port kustom ke pengguna.
* **Kasus Nyata Sukses:** Mengatasi error `403 Forbidden` pada server dengan melakukan perbaikan hak akses direktori (`chmod -R 755`) dan menggunakan jalur absolut pada volume mounting Docker Nginx.

---

## 🎯 Port Pelayanan & Pemetaan Arsitektur

| Nomor Port | Protokol / Aplikasi | Kegunaan di Dalam Server Lab |
| :--- | :--- | :--- |
| **`2222`** | SSH (Hardened) | Akses aman remote CLI admin |
| **`80`** | HTTP (Nginx Proxy)| Gerbang masuk utama lalu lintas web |
| **`443`** | HTTPS | Jalur aman tersertifikasi SSL (Let's Encrypt) |
| **`8081`** | Apache PHP App | Kontainer aplikasi LAMP Stack internal |
| **`8085`** | Nginx Web Test | Kontainer website HTML internal |
| **`3307`** | MySQL Database | Komunikasi database internal (Port mapping 3306) |

---

## 🔧 Cara Replikasi & Menjalankan Lab Web (Level 5)

Untuk mereplikasi hasil deployment web port `8085` yang sudah dioptimasi dari masalah hak akses direktori:

1. **Buat folder proyek dan pastikan hak akses publik diizinkan:**
   ```bash
   mkdir -p /var/www/html/web-sederhana
   chmod -R 755 /var/www/html/web-sederhana

  
# 📊 Level 6: Centralized Log & Monitoring Dashboard

Membangun ekosistem monitoring infrastruktur secara real-time menggunakan Prometheus (Time-Series Database) dan Grafana Dashboard, dibantu oleh Node Exporter sebagai agen pengumpul metrik hardware server.

## 📦 Stack yang Digunakan:
* **Node Exporter:** `port 9100` (Metrik OS internal)
* **Prometheus:** `port 9090` (Scraper & Data Storage)
* **Grafana:** `port 3000` (Visualisasi & Command Center)

