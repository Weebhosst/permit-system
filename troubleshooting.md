# Troubleshooting Guide - Permit System

## 🚨 Warning: Multiple GoTrueClient Instances

### **Pesan Error:**
```
supabase-js@2:7 Multiple GoTrueClient instances detected in the same browser context. 
This is not an error, but this should be avoided as it may produce undefined behavior 
when used concurrently under the same storage key
```

### **Apa Artinya:**
- **Multiple instances** Supabase client dibuat di browser yang sama
- **Storage key konflik** menyebabkan data auth tidak tersimpan dengan benar
- **Behavior tidak terduga** saat login/logout dan data persistence

### **Penyebab:**
1. **Refresh halaman berulang** tanpa cleanup yang proper
2. **Koneksi/disconnect berulang** tanpa dispose client lama
3. **Multiple tab** yang menggunakan Supabase
4. **Browser cache** yang menyimpan client lama

### **Solusi yang Sudah Diterapkan:**

#### ✅ **1. Proper Client Disposal**
```javascript
// Dispose old client before creating new one
if (supabaseClient) {
  try {
    await supabaseClient.auth.signOut();
    supabaseClient = null;
  } catch (e) {
    console.log('Error disposing old client:', e);
  }
}
```

#### ✅ **2. Unique Storage Key**
```javascript
// Create new client with unique storage key
const storageKey = `permit-system-${Date.now()}`;
supabaseClient = window.supabase.createClient(url, key, {
  auth: {
    storageKey: storageKey,
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: false
  }
});
```

#### ✅ **3. Page Unload Cleanup**
```javascript
// Cleanup on page unload
window.addEventListener('beforeunload', () => {
  if (supabaseClient) {
    try {
      supabaseClient.auth.signOut();
    } catch (e) {
      console.log('Error during cleanup:', e);
    }
  }
});
```

#### ✅ **4. Reset Client Function**
```javascript
const sbResetClient = async () => {
  // Force cleanup and clear storage
  // Use this if still experiencing issues
};
```

### **Langkah Troubleshooting:**

#### **Langkah 1: Reset Client**
1. Buka tab "Import"
2. Klik tombol **"Reset Client"** (orange)
3. Tunggu sampai muncul "Supabase client berhasil di-reset"
4. Coba koneksi ulang

#### **Langkah 2: Clear Browser Data**
1. Buka Developer Tools (F12)
2. Klik kanan tombol refresh → "Empty Cache and Hard Reload"
3. Atau buka Settings → Privacy → Clear browsing data
4. Restart browser

#### **Langkah 3: Test Koneksi Baru**
1. Masukkan URL dan ANON KEY Supabase
2. Klik "Simpan & Sambungkan"
3. Periksa console untuk error
4. Pastikan status "Terhubung ke Supabase"

#### **Langkah 4: Test Login**
1. Masukkan email dan password admin
2. Klik "Login"
3. Pastikan status berubah menjadi "Login sebagai admin: [email]"

### **Prevention Tips:**

#### **✅ Yang Harus Dilakukan:**
- **Gunakan tombol "Reset Client"** jika ada masalah koneksi
- **Disconnect dulu** sebelum connect ulang
- **Clear cache** jika warning muncul berulang
- **Restart browser** jika masalah persist

#### **❌ Yang Tidak Boleh:**
- **Refresh halaman berulang** tanpa disconnect
- **Multiple tab** yang sama-sama connect ke Supabase
- **Connect/disconnect** terlalu cepat berulang
- **Ignore warning** yang muncul berulang

### **Jika Masih Bermasalah:**

#### **1. Periksa Console Browser**
- Buka Developer Tools (F12) → Console
- Cari error yang berhubungan dengan Supabase
- Screenshot error untuk debugging

#### **2. Periksa Network Tab**
- Developer Tools → Network
- Lihat request ke Supabase
- Periksa response dan status code

#### **3. Test di Browser Lain**
- Coba di Chrome, Firefox, atau Edge
- Pastikan bukan masalah browser specific

#### **4. Reset Lengkap**
1. Klik "Reset Client"
2. Clear browser cache
3. Restart browser
4. Setup ulang dari awal

### **Monitoring & Debug:**

#### **Console Logs yang Harus Muncul:**
```
"Attempting to connect to Supabase..."
"Supabase client created, testing connection..."
"Supabase connection successful"
"Data berhasil di-sync: X permits, Y logs"
```

#### **Status yang Harus Normal:**
- ✅ "Terhubung ke Supabase"
- ✅ "Login sebagai admin: [email]"
- ✅ "Data tersimpan ke Supabase + Browser"

### **Contact Support:**
Jika masalah masih persist setelah semua langkah di atas:
1. **Screenshot console** dengan error
2. **Screenshot status** Supabase
3. **Browser dan OS** yang digunakan
4. **Langkah yang sudah dicoba**

---

**Note:** Warning ini biasanya tidak mengganggu fungsionalitas, tapi sebaiknya diatasi untuk menghindari masalah di masa depan.
