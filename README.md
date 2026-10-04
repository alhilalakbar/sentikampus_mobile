# SentiKampus Mobile

Aplikasi mobile **SentiKampus** berbasis Flutter yang digunakan sebagai frontend untuk mengirim teks ke **SentiKampus API** dan menampilkan hasil prediksi sentimen.

Aplikasi ini menggunakan Flutter dan berkomunikasi dengan backend FastAPI melalui REST API.

---

## Daftar Isi

- [Teknologi](#teknologi)
- [Persyaratan](#persyaratan)
- [1. Clone Repository](#1-clone-repository)
- [2. Masuk ke Folder Project](#2-masuk-ke-folder-project)
- [3. Mengecek Flutter](#3-mengecek-flutter)
- [4. Mengecek Device](#4-mengecek-device)
- [5. Install Dependency](#5-install-dependency)
- [6. Konfigurasi API](#6-konfigurasi-api)
- [7. Menjalankan SentiKampus API](#7-menjalankan-sentikampus-api)
- [8. Menjalankan Aplikasi Flutter](#8-menjalankan-aplikasi-flutter)
- [9. Menjalankan pada Android Emulator](#9-menjalankan-pada-android-emulator)
- [10. Menjalankan pada HP Android Fisik](#10-menjalankan-pada-hp-android-fisik)
- [11. Alur Penggunaan](#11-alur-penggunaan)
- [12. Struktur Project](#12-struktur-project)
- [13. Menghentikan Aplikasi](#13-menghentikan-aplikasi)
- [14. Troubleshooting](#14-troubleshooting)
- [Quick Start](#quick-start)

---

## Teknologi

Project ini menggunakan:

- Flutter
- Dart
- HTTP REST API
- FastAPI sebagai backend
- Android SDK untuk menjalankan aplikasi Android

---

## Persyaratan

Pastikan sudah terinstall:

- Flutter SDK
- Dart SDK
- Android SDK
- Git
- Visual Studio Code
- Android Studio jika menggunakan Android Emulator

Untuk penggunaan Android, perangkat yang digunakan harus sudah terdeteksi oleh Flutter.

---

# 1. Clone Repository

Clone repository:

```bash
git clone git@github.com:alhilalakbar/sentikampus_mobile.git
```

Atau menggunakan HTTPS:

```bash
git clone https://github.com/alhilalakbar/sentikampus_mobile.git
```

---

# 2. Masuk ke Folder Project

Masuk ke folder:

```bash
cd sentikampus_mobile
```

Jika menggunakan Visual Studio Code:

```bash
code .
```

---

# 3. Mengecek Flutter

Periksa instalasi Flutter:

```bash
flutter doctor -v
```

Pastikan Flutter sudah dapat digunakan dan target yang ingin dipakai sudah siap.

Untuk melihat versi Flutter:

```bash
flutter --version
```

Jika menggunakan Android, periksa juga Android toolchain pada hasil `flutter doctor`.

Jika terdapat masalah Android SDK, buka Android Studio dan pastikan Android SDK sudah terinstall.

Lisensi Android dapat diperiksa dengan:

```bash
flutter doctor --android-licenses
```

Jika diminta menerima lisensi, jawab:

```text
y
```

sampai proses selesai.

---

# 4. Mengecek Device

Untuk melihat perangkat yang tersedia:

```bash
flutter devices
```

Contoh target yang dapat muncul:

```text
Android SDK built for x86
```

atau perangkat Android fisik.

Jika tidak ada device yang terdeteksi, periksa koneksi perangkat atau Android Emulator terlebih dahulu.

---

# 5. Install Dependency

Setelah repository di-clone, jalankan:

```bash
flutter pub get
```

Perintah ini akan membaca `pubspec.yaml` dan menginstall dependency yang diperlukan oleh project.

Jika dependency berubah, jalankan kembali:

```bash
flutter pub get
```

---

# 6. Konfigurasi API

Aplikasi SentiKampus Mobile berkomunikasi dengan backend melalui endpoint:

```text
POST /api/v1/predict
```

Alamat `baseUrl` harus disesuaikan dengan tempat aplikasi Flutter dijalankan.

## Android Emulator

Gunakan:

```text
http://10.0.2.2:8000
```

Android Emulator menggunakan `10.0.2.2` untuk mengakses localhost pada komputer host.

## HP Android Fisik

Gunakan alamat IP komputer yang menjalankan FastAPI.

Contoh:

```text
http://192.168.1.6:8000
```

HP dan komputer harus berada pada jaringan yang sama atau dapat saling mengakses.

## Jangan menggunakan localhost pada HP fisik

Jangan menggunakan:

```text
http://127.0.0.1:8000
```

atau:

```text
http://localhost:8000
```

pada HP Android fisik.

Pada HP, `localhost` menunjuk ke HP itu sendiri, bukan komputer yang menjalankan FastAPI.

---

# 7. Menjalankan SentiKampus API

SentiKampus Mobile membutuhkan backend **SentiKampus API** agar dapat melakukan prediksi sentimen.

Clone dan jalankan repository backend terlebih dahulu.

Masuk ke folder backend:

```bash
cd sentikampus_api
```

Aktifkan virtual environment.

### Windows

```powershell
.venv\Scripts\activate
```

### Linux / macOS

```bash
source .venv/bin/activate
```

Kemudian jalankan FastAPI:

```bash
uvicorn app.main:app --reload
```

Untuk mengizinkan perangkat lain di jaringan mengakses API:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

Pastikan API dapat dibuka melalui:

```text
http://127.0.0.1:8000/docs
```

Jika menggunakan HP fisik, uji juga menggunakan IP komputer:

```text
http://192.168.1.6:8000/docs
```

Sesuaikan IP dengan IP komputer yang menjalankan backend.

---

# 8. Menjalankan Aplikasi Flutter

Pastikan:

1. Dependency sudah diinstall.
2. Device sudah terdeteksi.
3. SentiKampus API sudah berjalan.
4. `baseUrl` sudah sesuai dengan device yang digunakan.

Kemudian jalankan:

```bash
flutter run
```

Jika terdapat beberapa device, tentukan device secara langsung:

```bash
flutter run -d <device-id>
```

Device ID dapat dilihat dengan:

```bash
flutter devices
```

---

# 9. Menjalankan pada Android Emulator

## 1. Jalankan Android Emulator

Buka Android Studio dan jalankan emulator yang tersedia.

Atau gunakan device yang sudah terdeteksi:

```bash
flutter devices
```

## 2. Pastikan FastAPI berjalan

Backend:

```bash
uvicorn app.main:app --reload
```

## 3. Gunakan base URL Emulator

Gunakan:

```text
http://10.0.2.2:8000
```

## 4. Jalankan Flutter

```bash
flutter run
```

Jika ingin memilih device:

```bash
flutter run -d <device-id>
```

---

# 10. Menjalankan pada HP Android Fisik

## 1. Aktifkan Developer Options

Pada HP Android, aktifkan:

- Developer Options
- USB Debugging

## 2. Hubungkan HP ke komputer

Hubungkan menggunakan kabel USB.

Jika muncul dialog:

```text
Allow USB debugging?
```

pilih:

```text
Allow
```

## 3. Pastikan device terdeteksi

Jalankan:

```bash
flutter devices
```

Jika HP muncul, berarti Flutter sudah dapat berkomunikasi dengan perangkat.

## 4. Pastikan komputer dan HP dapat mengakses backend

Jika FastAPI berjalan pada komputer dengan IP:

```text
192.168.1.6
```

jalankan backend:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

Kemudian gunakan:

```text
http://192.168.1.6:8000
```

sebagai `baseUrl`.

## 5. Jalankan aplikasi

```bash
flutter run
```

---

# 11. Alur Penggunaan

Alur aplikasi:

```text
User memasukkan teks
        ↓
Flutter Mobile
        ↓
SentimentApi
        ↓
POST /api/v1/predict
        ↓
SentiKampus API
        ↓
Prediksi sentimen
        ↓
Response JSON
        ↓
Flutter menampilkan hasil
```

Contoh request:

```json
{
  "text": "Pelayanan kampus sangat lambat"
}
```

Contoh response:

```json
{
  "label": "negative",
  "score": 0.91
}
```

---

# 12. Struktur Project

Struktur utama project:

```text
sentikampus_mobile/
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── sentiment_result.dart
│   ├── pages/
│   │   └── home_page.dart
│   └── services/
│       └── sentiment_api.dart
├── test/
│   └── widget_test.dart
├── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
├── README.md
└── sentikampus_mobile.iml
```

### `lib/main.dart`

Entry point utama aplikasi Flutter.

### `lib/models/sentiment_result.dart`

Berisi model data yang digunakan untuk merepresentasikan hasil prediksi sentimen dari API.

### `lib/pages/home_page.dart`

Berisi halaman utama aplikasi.

### `lib/services/sentiment_api.dart`

Berisi service yang menangani komunikasi antara aplikasi Flutter dengan SentiKampus API.

### `pubspec.yaml`

Berisi konfigurasi project Flutter dan dependency yang digunakan.

---

# 13. Menghentikan Aplikasi

Jika aplikasi sedang berjalan melalui:

```bash
flutter run
```

tekan:

```text
q
```

untuk keluar dari Flutter run.

Jika ingin menghentikan proses dari terminal, dapat menggunakan:

```text
Ctrl + C
```

---

# 14. Troubleshooting

## Flutter tidak menemukan device

Jalankan:

```bash
flutter devices
```

Kemudian:

```bash
flutter doctor -v
```

Pastikan Android toolchain dan device yang digunakan sudah siap.

---

## `flutter pub get` gagal

Coba jalankan:

```bash
flutter clean
flutter pub get
```

Kemudian jalankan kembali:

```bash
flutter run
```

---

## Flutter gagal terhubung ke FastAPI

Jangan langsung mengubah kode.

Periksa dari urutan berikut:

### 1. Apakah FastAPI masih berjalan?

Terminal backend harus menjalankan:

```bash
uvicorn app.main:app --reload
```

### 2. Cek Swagger

Buka:

```text
http://127.0.0.1:8000/docs
```

Jika tidak dapat dibuka, masalah ada pada backend.

### 3. Periksa `baseUrl`

Android Emulator:

```text
http://10.0.2.2:8000
```

HP fisik:

```text
http://IP-KOMPUTER:8000
```

### 4. Pastikan endpoint benar

Endpoint prediksi:

```text
/api/v1/predict
```

Contoh Android Emulator:

```text
http://10.0.2.2:8000/api/v1/predict
```

Contoh HP fisik:

```text
http://192.168.1.6:8000/api/v1/predict
```

---

## HP fisik tidak dapat mengakses API

Pastikan:

1. HP dan komputer berada pada jaringan yang sama.
2. FastAPI dijalankan dengan:

```bash
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

3. `baseUrl` menggunakan IP komputer.
4. Firewall tidak memblokir port `8000`.
5. Endpoint yang digunakan sudah benar.

---

# Quick Start

## Linux / macOS

```bash
git clone git@github.com:alhilalakbar/sentikampus_mobile.git

cd sentikampus_mobile

flutter doctor -v

flutter pub get

flutter devices

flutter run
```

Sebelum menjalankan aplikasi, pastikan SentiKampus API juga sudah berjalan.

---

## Windows PowerShell

```powershell
git clone git@github.com:alhilalakbar/sentikampus_mobile.git

cd sentikampus_mobile

flutter doctor -v

flutter pub get

flutter devices

flutter run
```

Sebelum menjalankan aplikasi, pastikan SentiKampus API juga sudah berjalan.

---

## Alur Menjalankan Project

```text
Clone Repository
       ↓
Masuk ke Folder Project
       ↓
flutter doctor -v
       ↓
flutter pub get
       ↓
flutter devices
       ↓
Jalankan SentiKampus API
       ↓
Atur baseUrl
       ↓
flutter run
       ↓
Aplikasi SentiKampus siap digunakan
```

---

## Catatan

Folder dan file hasil build atau konfigurasi lokal seperti berikut tidak perlu di-upload ke repository:

```text
.dart_tool/
build/
```

Pastikan `.gitignore` Flutter tetap digunakan agar file hasil build dan file lokal tidak masuk ke Git.

**SentiKampus Mobile siap digunakan.**
