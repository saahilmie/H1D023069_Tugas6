# TUGAS 6 PERTEMUAN 8

**Nama:** Khonsaa Hilmi Mufiida  
**NIM:** H1D023069  

---

## PENJELASAN PROSES PASSING DATA DARI FORM MENUJU TAMPILAN

### **Persiapan Data di Halaman Form (`form_data.dart`)**

Pada halaman form, data disimpan dalam **TextEditingController** untuk setiap field input:

```dart
final _namaController = TextEditingController(text: "Khonsaa Hilmi Mufiida");
final _nimController = TextEditingController(text: "H1D023069");
final _tahunController = TextEditingController(text: "2004");
```

**Penjelasan:**
- `TextEditingController` berfungsi untuk mengambil dan mengontrol nilai dari TextField
- Setiap controller menyimpan data yang diinput oleh user
- Data tersebut dapat diakses menggunakan `.text` (contoh: `_namaController.text`)

---

### **Proses Validasi Form**

Sebelum data dikirim, dilakukan validasi menggunakan **Form** dan **GlobalKey**:

```dart
final _formKey = GlobalKey<FormState>();

// Validasi saat tombol Simpan ditekan
if (_formKey.currentState!.validate()) {
  // Jika valid, lanjut ke proses passing data
}
```

**Penjelasan:**
- `GlobalKey<FormState>` digunakan untuk mengakses state form
- `validate()` akan mengecek semua validator di setiap TextFormField
- Jika ada field yang kosong, akan muncul pesan error dan data tidak dikirim

---

### **Passing Data Menggunakan Navigator.push dengan Constructor Parameters**

Ketika tombol **"Simpan"** ditekan dan form valid, data dikirim ke halaman `TampilDataPage` menggunakan **Navigator.push**:

```dart
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, anim, _, child) {
      return FadeTransition(
        opacity: anim,
        child: child,
      );
    },
    pageBuilder: (context, _, __) => TampilDataPage(
      nama: _namaController.text,
      nim: _nimController.text,
      tahun: int.tryParse(_tahunController.text) ?? 0,
    ),
  ),
);
```

**Penjelasan:**
- **`Navigator.push()`** → Digunakan untuk berpindah ke halaman baru
- **`PageRouteBuilder`** → Membuat custom route dengan animasi FadeTransition
- **Data dikirim sebagai parameter constructor** → `nama`, `nim`, dan `tahun` dikirim langsung ke `TampilDataPage`
- **`_namaController.text`** → Mengambil nilai String dari TextField nama
- **`int.tryParse(_tahunController.text)`** → Mengkonversi String tahun lahir menjadi integer

---

### **Penerimaan Data di Halaman Tampilan (`tampil_data.dart`)**

Di halaman `TampilDataPage`, data diterima melalui **constructor parameters**:

```dart
class TampilDataPage extends StatelessWidget {
  final String nama;
  final String nim;
  final int tahun;

  const TampilDataPage({
    super.key,
    required this.nama,
    required this.nim,
    required this.tahun,
  });
  
  // ...
}
```

**Penjelasan:**
- Data disimpan sebagai **final property** di dalam class
- **`required`** memastikan data harus diisi saat membuat instance `TampilDataPage`
- Tipe data sudah ditentukan: `String` untuk nama & nim, `int` untuk tahun
- Data langsung dapat digunakan di dalam method `build()`

---

### **Penggunaan Data yang Telah Diterima**

Data yang sudah diterima kemudian ditampilkan dan diolah:

```dart
@override
Widget build(BuildContext context) {
  // Menghitung umur dari tahun lahir
  int umur = DateTime.now().year - tahun;

  return Scaffold(
    // ...
    Text("Nama ku $nama \nNIM $nim"),
    Text("dan umur aku $umur tahun"),
    // ...
  );
}
```

**Penjelasan:**
- **`DateTime.now().year`** → Mendapatkan tahun sekarang
- **`DateTime.now().year - tahun`** → Menghitung umur dengan mengurangi tahun sekarang dengan tahun lahir
- Data `nama` dan `nim` ditampilkan langsung menggunakan string interpolation
- Data `umur` yang telah dihitung juga ditampilkan

---

## Diagram Alur Passing Data

```
[FormDataPage]
      |
      | User input data (nama, nim, tahun)
      | Data disimpan di TextEditingController
      |
      v
[Validasi Form]
      |
      | _formKey.currentState!.validate()
      |
      v
[Navigator.push]
      |
      | Passing data via constructor:
      | - nama: _namaController.text
      | - nim: _nimController.text  
      | - tahun: int.tryParse(_tahunController.text)
      |
      v
[TampilDataPage]
      |
      | Menerima data via constructor parameters
      | - final String nama
      | - final String nim
      | - final int tahun
      |
      v
[Tampilkan Data]
      |
      | - Tampilkan nama & nim
      | - Hitung umur: DateTime.now().year - tahun
      | - Tampilkan umur
```

---

## Metode Passing Data yang Digunakan

### **Constructor Parameters (Named Parameters)**

Aplikasi ini menggunakan metode **Constructor Parameters** dengan **named parameters** untuk passing data.

#### **Keuntungan Metode Ini:**

**Type-safe** Data memiliki tipe yang jelas dan tidak bisa salah tipe  
**Required parameters** Mencegah error karena data null atau tidak lengkap  
**Mudah dipahami** Code lebih readable dan maintainable  
**Best practice** Sesuai rekomendasi Flutter untuk passing data sederhana  
**Compile-time checking** Error terdeteksi saat compile, bukan saat runtime

---

## Screenshot Aplikasi
Maaf kak, ada kendala teknis saat running aplikasi (NDK saya error 🥲). Tapi source code sudah lengkap, sempat saya coba di tampilan web tapi tidak sempat saya sreenshot.

### Halaman Form Input Data
- Form input dengan 3 field (Nama, NIM, Tahun Lahir)
- Validasi input untuk memastikan tidak ada field kosong
- Button "Simpan" yang setelah di klik akan mengarah ke tampilan data/perkenalan

### Halaman Tampilan Data
- Menampilkan data yang telah diinput
- Perhitungan umur otomatis
- Button "Kembali" untuk kembali ke form

---
