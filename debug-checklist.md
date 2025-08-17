# Debug Checklist - Permit System

## 🔍 Langkah Debug untuk Masalah "Data Tidak Tersimpan ke Supabase"

### ✅ Langkah 1: Periksa Koneksi Supabase
- [ ] Buka tab "Import" di aplikasi
- [ ] Pastikan URL Supabase sudah benar (format: `https://[project-id].supabase.co`)
- [ ] Pastikan ANON KEY sudah benar (dari Settings → API di dashboard Supabase)
- [ ] Klik tombol "Connect"
- [ ] Status harus berubah menjadi "Terhubung ke Supabase"
- [ ] Jika gagal, catat error message yang muncul

### ✅ Langkah 2: Periksa Console Browser
- [ ] Buka Developer Tools (F12)
- [ ] Pilih tab "Console"
- [ ] Refresh halaman
- [ ] Lihat apakah ada log:
  - `"Attempting to connect to Supabase..."`
  - `"Supabase connection successful"`
- [ ] Jika ada error, screenshot dan catat

### ✅ Langkah 3: Test Tambah Permit
- [ ] Pastikan sudah login sebagai admin
- [ ] Buka tab "Tambah Permit"
- [ ] Isi form dengan data minimal:
  - Permit Code: `TEST-001`
  - Plate: `B 1234 ABC`
  - Owner: `Test User`
  - Type: `MOTOR`
- [ ] Klik "Simpan Permit"
- [ ] Periksa console untuk log:
  - `"Sending to Supabase: [payload]"`
  - `"Supabase upsert success: [data]"` atau error message

### ✅ Langkah 4: Periksa Database Supabase
- [ ] Buka dashboard Supabase
- [ ] Pilih project
- [ ] Buka "Table Editor"
- [ ] Pilih tabel `permits`
- [ ] Lihat apakah data baru muncul
- [ ] Jika tidak ada, buka "Logs" untuk melihat error

### ✅ Langkah 5: Periksa Struktur Tabel
- [ ] Di Table Editor, klik tabel `permits`
- [ ] Pastikan kolom ada:
  - `permit_code` (text, primary key)
  - `plate` (text)
  - `owner` (text)
  - `type` (text)
  - `valid_from` (date)
  - `valid_to` (date)
  - `stnk_exp` (date)
  - `simc_exp` (date)
  - `sima_exp` (date)
  - `status` (text)
  - `notes` (text)

### ✅ Langkah 6: Periksa RLS Policies
- [ ] Di Table Editor, klik tabel `permits`
- [ ] Pilih tab "Policies"
- [ ] Pastikan ada policy untuk:
  - SELECT (untuk semua user)
  - INSERT (untuk authenticated users)
  - UPDATE (untuk authenticated users)
  - DELETE (untuk authenticated users)

### ✅ Langkah 7: Test Import CSV
- [ ] Siapkan file CSV dengan format:
  ```csv
  permit_code,plate,owner,type,valid_from,valid_to,stnk_exp,simc_exp,sima_exp,status,notes
  TEST-002,B 5678 DEF,Test User 2,MOTOR,2024-01-01,2025-01-01,2025-06-01,2026-01-01,2026-01-01,active,test
  ```
- [ ] Upload file CSV
- [ ] Periksa console untuk error
- [ ] Periksa apakah data muncul di tabel

### ✅ Langkah 8: Test Sync Manual
- [ ] Setelah tambah data, klik tombol "Sync Sekarang"
- [ ] Periksa console untuk log:
  - `"Pulling data from Supabase..."`
  - `"Sync complete: [X] permits, [Y] logs"`
- [ ] Periksa apakah data tetap ada setelah refresh

### ✅ Langkah 9: Periksa Authentication
- [ ] Pastikan sudah login sebagai admin
- [ ] Periksa status login di tab "Import"
- [ ] Jika belum login, masukkan email dan password admin
- [ ] Klik "Login Admin"

### ✅ Langkah 10: Periksa Network
- [ ] Di Developer Tools, pilih tab "Network"
- [ ] Coba tambah permit atau sync
- [ ] Lihat request ke Supabase
- [ ] Periksa response dan status code

## 🚨 Error yang Sering Muncul

### Error: "Gagal simpan ke Supabase: [message]"
**Kemungkinan penyebab:**
- RLS policy tidak mengizinkan INSERT
- Struktur tabel tidak sesuai
- Data type tidak valid (misal string kosong untuk kolom DATE)
- Duplikat primary key

**Solusi:**
- Jalankan script SQL setup
- Periksa RLS policies
- Pastikan data yang dikirim valid

### Error: "Gagal konek Supabase"
**Kemungkinan penyebab:**
- URL atau ANON KEY salah
- Project Supabase tidak aktif
- Internet connection bermasalah

**Solusi:**
- Double-check credentials
- Test di browser lain
- Periksa status project Supabase

### Error: "Data berhasil di-sync: 0 permits, 0 logs"
**Kemungkinan penyebab:**
- Tabel kosong
- RLS policy tidak mengizinkan SELECT
- Koneksi terputus

**Solusi:**
- Periksa RLS policies
- Test koneksi ulang
- Coba insert data manual

## 📋 Data yang Perlu Dikumpulkan

Jika masih bermasalah, siapkan:
1. **Screenshot error** yang muncul
2. **Log console** lengkap
3. **Struktur tabel** dari Supabase
4. **RLS policies** yang aktif
5. **Data CSV** yang dicoba diimport
6. **Browser dan OS** yang digunakan

## 🔧 Langkah Selanjutnya

Jika semua checklist sudah dilakukan tapi masih bermasalah:
1. **Restart aplikasi** dan coba lagi
2. **Clear browser cache** dan cookies
3. **Test di browser lain** (Chrome, Firefox, Edge)
4. **Hubungi support** dengan data yang sudah dikumpulkan
