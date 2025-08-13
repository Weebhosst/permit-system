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

## 🐛 Troubleshooting

### PWA Tidak Bisa Install
- Pastikan HTTPS aktif
- Clear browser cache
- Restart browser
- Check service worker

### Camera Tidak Bekerja
- Izinkan akses kamera
- Gunakan kamera belakang
- Pastikan barcode jelas
- Check browser permissions

### Data Tidak Sync
- Check koneksi internet
- Verify Supabase credentials
- Check browser console
- Refresh halaman

## 📞 Support

Untuk bantuan dan pertanyaan:
- **Developer**: Yanuar Afri
- **Email**: [your-email@domain.com]
- **GitHub**: [your-github-username]

## 📄 License

Project ini dibuat untuk internal use. Tidak ada license khusus.

---

**Version**: 1.0.0  
**Last Updated**: December 2024  
**Created By**: Yanuar Afri
