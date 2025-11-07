# Ballin Mobile: Your favorite football shop - now coming to your phone!

_**DISCLAIMER**: Repositori ini dibuat untuk rangkaian tugas individu mata kuliah Pemrograman Berbasis Platform Ilmu Komputer Universitas Indonesia, atas nama Nathanael Leander Herdanatra, NPM 2406421320. Aplikasi yang terdapat di repositori ini merupakan simulasi dan bukan toko online asli._

## **Overview**

Projek ini adalah _mobile app_ untuk aplikasi toko sepak bola _online_ yang dibuat dengan _framework_ Flutter.

<details>
<summary><h2><b>Jawaban Pertanyaan Tugas 7</b></h2></summary>

### Jelaskan apa itu _widget tree_ pada Flutter dan bagaimana hubungan _parent-child_ (induk-anak) bekerja antar widget.

Dalam Flutter, _widget tree_ adalah struktur hirarkis yang berisi beberapa _widget_ di mana suatu _widget_ dapat memiliki anak berupa _widget_ lain. Struktur ini merepresentasikan bagaimana antarmuka pengguna (UI) aplikasi dibangun. Flutter akan membaca _widget tree_ ini untuk menggambar UI di layar. Hubungan _parent-child_ (induk-anak) merupakan inti inti dari _widget tree_.

_Parent widget_ (induk) adalah _widget_ yang berisi _widget_ lain. _Parent widget_ bertanggung jawab untuk mengatur posisi, ukuran, dan konfigurasi lainnya untuk _child widget_-nya.

_Child Widget_ (anak) adalah _widget_ yang berada di dalam _parent widget_. Sebuah _parent_ bisa memiliki satu anak (`child`) atau beberapa anak (`children`).

Suatu _child_ akan mewarisi atribut-atribut dari _parent_-nya, kecuali dinyatakan secara spesifik (di-_override_). Hal ini sangat bermanfaat untuk menerapkan batasan _constraint_ pada _child widget_. Sebagai contoh, suatu _widget_ `Container` dapat memiliki anak berupa widget `Text` atau `Icon`. Hasilnya adalah suatu _container_ yang memiliki teks dan ikon di dalamnya.

### Sebutkan semua _widget_ yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Berikut adalah daftar _widget_ yang digunakan dalam proyek ini.

-   `MaterialApp`: _Widget_ utama aplikasi yang mendefinisikan suatu aplikasi yang dibuat dengan Material Design System.
-   `AppBar`: Merupakan _widget_ untuk menampilkan _title bar_ dari aplikasi yang ada di bagian atas tampilan.
-   `Scaffold`: Menyediakan kerangka dasar untuk halaman aplikasi, termasuk `AppBar`, `body`, dan elemen lainnya.
-   `Text`: Menampilkan string teks dengan gaya tertentu.
-   `Padding`: Memberikan ruang kosong (bantalan) di sekitar _widget_ anaknya.
-   `Column`: Menyusun daftar _widget_ anak dalam arah vertikal.
-   `Center`: Memposisikan _widget_ anaknya di tengah area yang tersedia.
-   `GridView`: Menampilkan _widget_ dalam bentuk _grid_ (kisi) dua dimensi.
-   `Material`: Sebuah _widget_ yang menyediakan kanvas untuk elemen Material Design, digunakan di sini untuk memberikan warna latar dan bentuk pada kartu.
-   `InkWell`: Membuat _widget_ anaknya dapat merespons sentuhan (seperti ketukan) dan menampilkan efek ketika disentuh.
-   `ScaffoldMessenger` dan `SnackBar`: `ScaffoldMessenger` merupakan API yang digunakan untuk menampilkan `SnackBar`, yaitu notifikasi sementara yang muncul di bagian bawah layar.
-   `Container`: Sebuah _widget_ serbaguna yang dapat digunakan untuk menampung, menata, dan mendekorasi _widget_ lain.
-   `Icon`: Menampilkan ikon grafis.
-   Dua _widget_ kustom `MyHomePage` untuk menampilkan halaman utama aplikasi, dan `ItemCard` untuk menampilkan tombol item dalam bentuk kartu.

### Apa fungsi dari _widget_ `MaterialApp`? Jelaskan mengapa _widget_ ini sering digunakan sebagai _widget root_.

`MaterialApp` adalah _convenience widget_ yang menginisialisasi dan menyediakan banyak fitur dasar aplikasi berbasis Material Design (_design language_ yang digunakan Google di aplikasi _mobile_ untuk OS Android). Fungsi utamanya adalah untuk menampung _widget-widget_ lain di bawahnya menyediakan tema aplikasi yang konsisten, mengelola _routing_, serta mengatur pengaturan global tingkat aplikasi.

`MaterialApp` digunakan sebagai _root widget_ karena memudahkan setup aplikasi, dengan sekali panggil MaterialApp, aplikasi sudah punya tema, _routing_, dan infrastruktur Material lainnya sehingga banyak fitur siap pakai, serta menjadi pusat kontrol fungsi-fungsi global aplikasi.

### Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?

`StatelessWidget` adalah jenis _widget_ yang tidak dapat diubah (_immutable_) setelah _widget_ itu diinisialisasi/dibuat. Sepanjang jalannya program, _widget_ memiliki tampilan dan perilaku yang sama dan tidak berubah. `StatelessWidget` berguna untuk menampilkan data statis seperti judul aplikasi, `AppBar` dan _item-item_ lain yang bersifat tetap.

`StatefulWidget` adalah jenis _widget_ yang dapat diubah tampilan atau perilakunya setelah _widget_ itu diinisialisasi/dibuat. Jenis _widget_ ini memiliki lebih dari satu _state_ yang bersifat _mutable_ (dapat diubah) seiring berjalannya program. `StatefulWidget` berguna untuk menampilkan data yang berubah secara dinamis, seperti _views count_ atau daftar artikel/produk yang dapat berubah sewaktu-waktu.

### Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?

`BuildContext` adalah objek yang mewakili lokasi suatu _widget_ di _widget tree_. Objek ini memungkinkan _widget_ berinteraksi dengan _widget_ lain dan mengakses berbagai layanan dan data dalam aplikasi, sehingga menjadi komponen yang sangat penting. `BuildContext` memberikan akses suatu _widget_ ke _parent_ dan _ancestor_ dari _widget_ tersebut, memungkinkan adanya inheritansi, seperti untuk mengakses `Theme.of(context)` atau `MediaQuery.of(context)`, yang menyediakan data bersama di sepanjang _widget tree_. Selain itu, `BuildContext` juga digunakan untuk navigasi dan perpindahan _state_ suatu widget.

Penerapannya yang paling umum adalah pada metode `build`, di mana `BuildContext` digunakan sebagai argumen dari metode `build`. Hal ini dimaksudkan agar proses pembuatan _widget_ dapat mengakses _widget_ lain yang merupakan _parent_ dari _widget_ tersebut.

### Jelaskan konsep "_hot reload_" di Flutter dan bagaimana bedanya dengan "_hot restart_".

_Hot reload_ adalah fitur di Flutter yang sangat bermanfaat untuk proses _debugging_, di mana fitur ini memungkinkan pengembang untuk mengaplikasikan perubahan pada kode aplikasi secara cepat, dengan menginjeksikan kode yang telah diperbarui pada Dart VM dan membangun ulang _widget tree_, mempertahankan _state_ aplikasi. Hal ini berbeda dengan _hot restart_ yang memulai kembali aplikasi dari awal dan mengubah _state_ aplikasi ke _state_ inisial. Kelebihan _hot reload_ adalah cara ini cepat dan mempertahankan _state_ aplikasi, cocok untuk perubahan pada UI dan logika yang minor. Akan tetapi, _hot reload_ tidak menerapkan perubahan pada variabel global dan kode di luar _widget tree_. Untuk kasus ini, _hot restart_ adalah cara yang dibutuhkan untuk mengaplikasikan perubahan tersebut.

</details>

<details>
<summary><h2><b>Jawaban Pertanyaan Tugas 8</b></h2></summary>

### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

`Navigator.push()` bertujuan menambahkan rute baru (dalam hal ini tampilan/_screen_ aplikasi) ke _stack_ navigasi, yang mana hal ini memungkinkan pengguna untuk kembali ke halaman sebelumnya, yang ditangani oleh `Navigation.pop()`. Metode ini digunakan untuk membuat _routing_ di mana pengguna dapat mengulang (_undo_) _state_ sebelumnya, seperti dari halaman beranda (_homepage_) kemudian ke halaman detail _post_/produk kemudian kembali lagi ke _homepage_.

`Navigator.pushReplacement()` menggantikan rute yang saat ini ditampilkan dengan rute baru, dengan cara hapus (`pop`) rute saat ini dan tambahkan (`push`) rute yang baru. Metode ini digunakan untuk membuat _routing_ di mana pengguna tidak dapat mengulang (_undo_) _state_ sebelumnya, seperti peralihan dari _splash screen_ ke tampilan utama aplikasi.

### Bagaimana kamu memanfaatkan _hierarchy widget_ seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

_Hierarchy widget_ dimanfaatkan untuk membangun struktur halaman konsisten di seluruh aplikasi.

-   `Scaffold` digunakan untuk membungkus tampilan utama (_screen_) dari setiap aplikasi, di mana `Scaffold` menyediakan slot standar untuk elemen-elemen seperti `AppBar`, `Drawer`, dan `Body`.
-   `AppBar` adalah _header_ aplikasi, di mana _widget_ ini ditempatkan di properti `appBar` di `Scaffold`. `AppBar` ini digunakan untuk menampilkan judul halaman dan tombol aksi (untuk aktivasi `Drawer`) yang konsisten di seluruh aplikasi.
-   `Drawer` adalah menu samping (_sidebar_) yang berisi tautan ke berbagai bagian aplikasi (dalam hal ini `Home` dan `Add Product`). Hasilnya, pengguna dapat mengakses menu navigasi yang sama dari mana saja, menciptakan pengalaman navigasi yang mulus dan dapat diprediksi.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan _layout widget_ seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

-   `Padding` digunakan untuk memberikan ruang kosong di pinggiran suatu elemen sehingga tidak langsung menempel dengan elemen lain. Hal ini membuat tampilan yang lebih terbaca, rapi, dan menarik. Ini digunakan di banyak elemen seperti membungkus setiap elemen pada _form_ penambahan produk.
-   `SingleChildScrollView` digunakan untuk membuat suatu elemen menjadi bisa di-_scroll_. Ini sangat berguna untuk mencegah beberapa bagian elemen yang ukurannya melebihi _viewport_ tidak dapat diakses. Dalam aplikasi ini, `SingleChildScrollView` digunakan untuk membungkus `body` dari tampilan `AddProduct` agar _form_ dapat di-_scroll_ ke bawah.
-   `ListView` digunakan untuk membuat tampilan beberapa elemen yang tersusun dalam suatu daftar linear. Ini berguna untuk menampilkan beberapa elemen dengan posisi yang searah, misal semua elemen tersusun secara horizontal atau vertikal. Dalam aplikasi ini, `ListView` digunakan sebagai `child` dari `LeftDrawer` yang digunakan untuk menyusun elemen-elemen `Drawer` secara vertikal.

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Warna tema disesuaikan di `main.dart` ketika proses _building_ dari `MyApp`. Atribut yang digunakan untuk tema adalah `theme`. Sebagai contoh, aplikasi ini menerapkan tema sebagai berikut.

```dart
theme: ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        primary: const Color.fromARGB(255, 0, 145, 254),
        secondary: const Color.fromARGB(255, 174, 206, 254),
        surface: const Color.fromARGB(255, 255, 254, 254),
    ),
),
```

Ini menandakan bahwa aplikasi menggunakan tema cerah (_light theme_) dan menggunakan skema warna primer, sekunder, dan permukaan (latar belakang) seperti di atas. Tema ini konsisten dengan skema warna yang dipakai di versi _web app_ dari aplikasi ([https://nathanael-leander-ballin.pbp.cs.ui.ac.id/](https://nathanael-leander-ballin.pbp.cs.ui.ac.id/)).

</details>
