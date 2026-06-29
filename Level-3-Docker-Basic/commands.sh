--------------------------------------------------------------------------------
[LEVEL 3: CONTAINERIZATION FOUNDATION & DOCKER LIFECYCLE MANAGEMENT]
--------------------------------------------------------------------------------
* Deskripsi: Berpindah dari virtualisasi tradisional (VM) ke teknologi modern 
  kontainerisasi menggunakan Docker Engine untuk efisiensi resource tingkat tinggi.

* CLI Manajemen Siklus Hidup Engine & Kontainer:
  1. Instalasi paket utama Docker Engine ke sistem Ubuntu:
     $ sudo apt install docker.io -y
     
  2. Memastikan service runtime docker aktif di background:
     $ sudo systemctl status docker
     
  3. Eksekusi pengujian validasi instalasi mesin docker:
     $ sudo docker run hello-world
     
  4. Mengunduh (Pull) image nginx versi ringan (Alpine Linux) dari Docker Hub:
     $ sudo docker pull nginx:alpine
     
  5. Inspeksi daftar katalog image yang tersimpan di server lokal:
     $ sudo docker images
     
  6. Memantau daftar seluruh kontainer (Yang berjalan maupun yang mati):
     $ sudo docker ps -a
