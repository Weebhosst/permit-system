# QR Code Features - Permit System

## 🎯 **Fitur QR Code yang Telah Ditambahkan:**

### **1. Generate QR Code Individual**
- **Pilih Permit**: Dropdown untuk memilih permit yang akan di-generate QR Code
- **Ukuran QR Code**: 128x128, 256x256, atau 512x512 pixels
- **Error Correction**: Low (7%), Medium (15%), Quartile (25%), High (30%)
- **Data Lengkap**: Semua informasi permit dalam format JSON

### **2. Print & Download QR Code**
- **Print QR Code**: Print individual QR Code dengan informasi permit
- **Download PNG**: Download QR Code sebagai file PNG
- **Format Print**: Layout yang rapi untuk stiker atau dokumen

### **3. Bulk QR Code Generation**
- **Multiple Permit**: Pilih beberapa permit sekaligus
- **Format Output**: PNG, SVG, atau PDF
- **Grid Layout**: Tampilan grid yang rapi untuk multiple QR Code
- **Print All**: Print semua QR Code dalam satu halaman

### **4. QR Code Scanner**
- **Camera Selection**: Pilih kamera yang akan digunakan
- **Real-time Scanning**: Scan QR Code secara real-time
- **Data Decode**: Otomatis decode data JSON dari QR Code
- **Permit Validation**: Verifikasi permit dengan database

## 🚀 **Cara Menggunakan:**

### **Generate QR Code Individual:**
1. **Buka tab "QR Code"**
2. **Pilih permit** dari dropdown
3. **Set ukuran** dan error correction level
4. **Klik "Generate QR"**
5. **Print atau Download** QR Code

### **Generate Bulk QR Code:**
1. **Pilih multiple permit** (Ctrl/Cmd + klik)
2. **Set ukuran dan format** output
3. **Klik "Generate Bulk"**
4. **Print semua** QR Code sekaligus

### **Scan QR Code:**
1. **Pilih kamera** yang akan digunakan
2. **Klik "Mulai Scan"**
3. **Arahkan kamera** ke QR Code
4. **Lihat hasil** decode dan validasi

## 📱 **Data yang Disimpan dalam QR Code:**

```json
{
  "permit_code": "PERMIT-000001",
  "plate": "B 1234 ABC",
  "owner": "John Doe",
  "type": "MOTOR",
  "valid_from": "2024-01-01",
  "valid_to": "2025-01-01",
  "stnk_exp": "2025-06-01",
  "simc_exp": "2026-01-01",
  "sima_exp": "2026-01-01",
  "status": "active",
  "timestamp": "2024-12-20T10:30:00.000Z"
}
```

## 🔧 **Technical Details:**

### **Library yang Digunakan:**
- **QRCode.js**: Untuk generate QR Code
- **ZXing Library**: Untuk scan QR Code
- **Canvas API**: Untuk render dan export

### **Format Output:**
- **PNG**: Raster image untuk print dan download
- **SVG**: Vector image untuk scaling yang baik
- **PDF**: Document format untuk bulk printing

### **Error Correction Levels:**
- **L (Low)**: 7% - Untuk QR Code yang besar dan jelas
- **M (Medium)**: 15% - Default, balance antara size dan reliability
- **Q (Quartile)**: 25% - Untuk QR Code yang mungkin rusak
- **H (High)**: 30% - Untuk QR Code yang sangat reliable

## 📋 **Use Cases:**

### **1. Stiker Kendaraan**
- QR Code dengan ukuran 256x256
- Error correction Medium atau High
- Print pada stiker yang tahan cuaca

### **2. Dokumen Permit**
- QR Code dengan ukuran 128x128
- Error correction Low atau Medium
- Embed dalam dokumen digital

### **3. Bulk Production**
- Generate QR Code untuk semua permit aktif
- Format SVG untuk scaling yang baik
- Print dalam sheet untuk distribusi

### **4. Field Verification**
- Scan QR Code di lapangan
- Verifikasi data permit secara real-time
- Log aktivitas scan untuk audit trail

## ⚠️ **Best Practices:**

### **QR Code Generation:**
- **Ukuran minimal**: 128x128 untuk readability yang baik
- **Error correction**: Medium (15%) untuk balance optimal
- **Margin**: 2 pixels untuk scan yang mudah
- **Contrast**: Hitam di atas putih untuk readability maksimal

### **QR Code Usage:**
- **Print quality**: Pastikan print resolution tinggi
- **Material**: Gunakan material yang tahan cuaca untuk outdoor
- **Placement**: Hindari tempat yang mudah rusak atau tertutup
- **Testing**: Test scan sebelum deploy

### **Scanner Setup:**
- **Camera quality**: Gunakan kamera dengan resolusi baik
- **Lighting**: Pastikan pencahayaan cukup
- **Distance**: Optimal scan distance 10-30 cm
- **Stability**: Jaga kamera tetap stabil saat scan

## 🎨 **Customization Options:**

### **Visual Customization:**
- **Colors**: Custom dark dan light colors
- **Size**: Multiple size options
- **Margin**: Adjustable margin untuk layout
- **Format**: Multiple output formats

### **Data Customization:**
- **Fields**: Pilih field yang akan disimpan
- **Format**: JSON atau plain text
- **Metadata**: Tambah timestamp atau user info
- **Validation**: Custom validation rules

## 🔮 **Future Enhancements:**

### **Planned Features:**
- **Custom QR Code Design**: Logo dan branding
- **Batch Processing**: Process multiple files
- **API Integration**: Generate via REST API
- **Analytics**: Track QR Code usage
- **Offline Mode**: Generate tanpa internet

### **Advanced Features:**
- **Dynamic QR Code**: Update data secara real-time
- **Encryption**: Secure data dalam QR Code
- **Multi-language**: Support multiple languages
- **Cloud Sync**: Sync dengan cloud storage

## 📞 **Support & Troubleshooting:**

### **Common Issues:**
1. **QR Code tidak terbaca**: Periksa ukuran dan error correction
2. **Scan tidak akurat**: Pastikan kamera stabil dan pencahayaan baik
3. **Generate error**: Periksa data permit yang dipilih
4. **Print tidak rapi**: Pastikan print resolution tinggi

### **Getting Help:**
- **Console Logs**: Periksa browser console untuk error
- **Test Data**: Gunakan data sample untuk testing
- **Browser Support**: Pastikan browser support modern APIs
- **Camera Permissions**: Izinkan akses kamera untuk scanning

---

**QR Code System** telah terintegrasi penuh dengan **Permit System** dan siap digunakan untuk berbagai kebutuhan bisnis! 🎉
