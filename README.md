# Sistem Permit Kendaraan - PWA

Aplikasi web progresif (PWA) untuk manajemen permit kendaraan dengan fitur barcode, scanner otomatis, dan sinkronisasi data multi-perangkat.

## 🚀 Fitur Utama

### 📱 Progressive Web App (PWA)
- **Installable**: Bisa diinstall seperti aplikasi native di smartphone
- **Offline Mode**: Bisa bekerja tanpa internet dengan sync otomatis
- **Background Sync**: Sinkronisasi data saat koneksi tersedia
- **Push Notifications**: Notifikasi untuk permit yang akan expired

### 🔍 Barcode & Scanner
- **Generate Barcode**: CODE128 format untuk setiap permit
- **Camera Scanner**: Scan otomatis dengan kamera belakang
- **Hardware Scanner**: Support USB/Bluetooth barcode scanner
- **Audio Feedback**: Beep saat barcode berhasil dibaca
- **Mass Generation**: Generate multiple barcode sekaligus

### 💾 Data Management
- **Local Storage**: Data tersimpan di browser
- **Supabase Sync**: Sinkronisasi multi-perangkat via cloud
- **CSV Import/Export**: Kompatibel dengan Google Sheets
- **Admin Protection**: Hanya admin yang bisa edit/hapus data

### 📊 Dashboard & Reports
- **Real-time Stats**: Total permit, status aktif/expired
- **Activity Logs**: Catatan scan masuk/keluar
- **Search & Filter**: Pencarian berdasarkan multiple criteria
- **Mobile Optimized**: Interface yang responsive untuk mobile

## 🔍 Hardware Barcode Scanner

### **Setup Hardware Scanner:**
1. **Hubungkan Scanner** via USB atau Bluetooth ke komputer
2. **Scanner otomatis terdeteksi** sebagai keyboard HID
3. **Klik input field** "Hardware Scanner" di tab Scan
4. **Scan barcode** - data langsung masuk otomatis
5. **Sistem otomatis proses** dan tampilkan detail permit

### **Keuntungan Hardware Scanner:**
- ✅ **Lebih cepat** - scan instan tanpa delay
- ✅ **Lebih akurat** - tidak ada masalah fokus kamera
- ✅ **Tidak perlu izin kamera** - langsung scan
- ✅ **Bisa scan dalam gelap** - ada LED built-in
- ✅ **Durability tinggi** - untuk penggunaan intensif
- ✅ **Auto-focus** - scanner otomatis focus ke input

### **Scanner yang Didukung:**
- **USB Barcode Scanner** - Plug & Play
- **Bluetooth Barcode Scanner** - Wireless
- **2D/1D Barcode Scanner** - Semua format
- **Industrial Scanner** - Untuk penggunaan berat

## 📱 Cara Install PWA

### Android (Chrome)
1. Buka website di Chrome
2. Tap menu (⋮) → "Add to Home screen"
3. Pilih "Add" untuk install

### iOS (Safari)
1. Buka website di Safari
2. Tap share button (□↑) → "Add to Home Screen"
3. Tap "Add" untuk install

### Desktop (Chrome/Edge)
1. Buka website di browser
2. Klik icon install (📱) di address bar
3. Pilih "Install" untuk install

## 🔧 Setup Development

### Prerequisites
- Node.js (optional, untuk development)
- Web server (Apache, Nginx, atau Netlify)

### Installation
1. Clone repository
2. Upload ke web server
3. Pastikan HTTPS aktif (wajib untuk PWA)
4. Akses via browser

### File Structure
```
permit-system/
├── index.html          # Main application
├── manifest.json       # PWA configuration
├── sw.js              # Service worker
└── README.md          # Documentation
```

## 📱 Mobile Features

### Touch Gestures
- **Swipe Left/Right**: Navigasi antar tab
- **Touch Feedback**: Visual feedback saat tap
- **Pull to Refresh**: Update data dengan swipe down

### Mobile Optimization
- **Responsive Design**: Layout yang menyesuaikan layar
- **Touch-friendly**: Button minimal 44x44px
- **Safe Area**: Support untuk notch dan home indicator
- **Orientation**: Lock portrait untuk mobile

### Offline Capabilities
- **Local Storage**: Data tersimpan di device
- **Background Sync**: Sync otomatis saat online
- **Cache Strategy**: Resource di-cache untuk offline
- **Conflict Resolution**: Handle data yang berbeda

## 🔐 Admin Features

### Authentication
- **Email/Password**: Login dengan Supabase Auth
- **Role-based Access**: Admin vs User permissions
- **Session Management**: Auto-logout setelah idle

### Admin Actions
- **Add/Edit/Delete**: Manage permit data
- **Bulk Operations**: Import/export data
- **System Settings**: Configure application
- **User Management**: Manage user accounts

## 📊 Data Fields

### Permit Information
- **permit_code**: Kode unik permit
- **plate**: Nomor polisi kendaraan
- **owner**: Nama pemilik
- **type**: Jenis kendaraan
- **stnk_exp**: Masa berlaku STNK
- **simc_exp**: Masa berlaku SIM C
- **sima_exp**: Masa berlaku SIM A
- **status**: Status permit (active/expired)
- **notes**: Catatan tambahan

### Log Information
- **timestamp**: Waktu scan
- **event**: Jenis event (IN/OUT/SCAN)
- **permit_code**: Kode permit yang di-scan
- **plate**: Nomor polisi
- **user**: User yang melakukan scan

## 🚀 Deployment

### Netlify
1. Upload ke GitHub
2. Connect ke Netlify
3. Deploy otomatis

### Vercel
1. Upload ke GitHub
2. Import ke Vercel
3. Deploy dengan preview

### Manual Server
1. Upload ke web server
2. Konfigurasi HTTPS
3. Test PWA functionality

## 🔧 Configuration

### Supabase Setup
1. Buat project di Supabase
2. Copy URL dan API key
3. Masukkan ke aplikasi
4. Setup Row Level Security (RLS)

### PWA Settings
- **App Name**: Sistem Permit Kendaraan
- **Theme Color**: #0ea5e9 (Sky Blue)
- **Background Color**: #0f172a (Dark Blue)
- **Display Mode**: Standalone
- **Orientation**: Portrait Primary

## 📱 Browser Support

### PWA Features
- ✅ Chrome 67+
- ✅ Edge 79+
- ✅ Firefox 67+
- ✅ Safari 11.1+
- ✅ Samsung Internet 8.2+

### Camera API
- ✅ Chrome 53+
- ✅ Edge 79+
- ✅ Firefox 36+
- ❌ Safari (limited support)

## Troubleshooting

### Data Tidak Tersimpan ke Supabase

Jika data dari form "Tambah Permit" tidak tersimpan ke Supabase, ikuti langkah berikut:

#### 1. Periksa Koneksi Supabase
- Pastikan URL dan ANON KEY sudah benar di tab "Import"
- Klik tombol "Connect" dan pastikan status berubah menjadi "Terhubung ke Supabase"
- Jika gagal, periksa error message yang muncul

#### 2. Periksa Console Browser
- Buka Developer Tools (F12) → Console
- Coba tambah permit baru atau import CSV
- Lihat log yang muncul untuk debugging:
  - `"Attempting to connect to Supabase..."`
  - `"Sending to Supabase: [payload]"`
  - `"Supabase upsert success: [data]"` atau error message

#### 3. Periksa Struktur Tabel di Supabase
Pastikan tabel `permits` memiliki kolom yang sesuai:
```sql
create table if not exists permits (
  permit_code text primary key,
  plate text,
  owner text,
  type text,
  valid_from date,
  valid_to date,
  stnk_exp date,
  simc_exp date,
  sima_exp date,
  status text,
  notes text
);
```

#### 4. Periksa RLS (Row Level Security)
Jika RLS aktif, pastikan ada policy yang mengizinkan INSERT/UPDATE:
```sql
-- Policy untuk INSERT
create policy "Enable insert for authenticated users" on permits
  for insert with check (auth.role() = 'authenticated');

-- Policy untuk SELECT (jika perlu)
create policy "Enable select for all users" on permits
  for select using (true);
```

#### 5. Periksa Data yang Dikirim
- Pastikan tidak ada kolom yang kosong dengan format yang salah
- Sistem otomatis mengkonversi string kosong menjadi `null` untuk kolom DATE
- Periksa apakah `permit_code` tidak duplikat

#### 6. Test Manual
- Coba tambah permit dengan data minimal (hanya `permit_code` dan `plate`)
- Jika masih gagal, cek error detail di console
- Coba sync manual dengan tombol "Sync Sekarang"

### Data Hilang Setelah Refresh

Jika data hilang setelah refresh halaman:

1. **Pastikan Supabase terhubung** sebelum refresh
2. **Login sebagai admin** untuk memastikan akses penuh
3. **Sync manual** dengan tombol "Sync Sekarang" setelah refresh
4. **Periksa localStorage** sebagai backup di Developer Tools → Application → Local Storage

### Import CSV Gagal

Jika import CSV tidak berfungsi:

1. **Format CSV harus sesuai** dengan header yang ada
2. **Kolom `permit_code` boleh kosong** - sistem akan generate otomatis
3. **Pastikan admin login** untuk akses import
4. **Periksa console** untuk error detail

### Barcode Scanner Tidak Bekerja

Jika scanner kamera tidak membaca barcode:

1. **Pastikan HTTPS aktif** (wajib untuk akses kamera)
2. **Izinkan akses kamera** saat browser meminta
3. **Gunakan kamera belakang** (otomatis dipilih)
4. **Alternatif**: Gunakan hardware scanner atau input manual

## Support

Jika masih mengalami masalah:

1. **Buka Console Browser** (F12) dan lihat error messages
2. **Screenshot error** yang muncul
3. **Kirim log console** untuk debugging lebih lanjut
4. **Periksa status Supabase** di dashboard project

## 📄 License

Project ini dibuat untuk internal use. Tidak ada license khusus.

---

**Version**: 1.0.0  
**Last Updated**: December 2024  
**Created By**: Yanuar Afri
