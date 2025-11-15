# Ballin Mobile: Your favorite football shop - now coming to your phone!

_**DISCLAIMER**: Repositori ini dibuat untuk rangkaian tugas individu mata kuliah Pemrograman Berbasis Platform Ilmu Komputer Universitas Indonesia, atas nama Nathanael Leander Herdanatra, NPM 2406421320. Aplikasi yang terdapat di repositori ini merupakan simulasi dan bukan toko online asli._

## **Overview**

Projek ini adalah _mobile app_ untuk aplikasi toko sepak bola _online_ yang dibuat dengan _framework_ Flutter.

Deployment URL (Django): [https://nathanael-leander-ballin.pbp.cs.ui.ac.id/](https://nathanael-leander-ballin.pbp.cs.ui.ac.id/)

Download APK file: [https://github.com/nathanaeru/ballin-mobile/releases/download/Release/app-release.apk](https://github.com/nathanaeru/ballin-mobile/releases/download/Release/app-release.apk)

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

Untuk mengakses warna tema tersebut, dapat digunakan `Theme.of(context).colorScheme`, sebagai contoh, pada Homepage bagian inisialisasi AppBar:

```dart
...
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ballin",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
...
```

</details>

<details>
<summary><h2><b>Jawaban Pertanyaan Tugas 9</b></h2></summary>

### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?

-   Pada dasarnya, JSON adalah sebuah `Map<String, dynamic>` yang memetakan suatu string nama atribut ke nilai dari atribut tersebut, di mana nilai ini bisa bertipe data apapun. Hal ini menyebabkan Dart tidak tahu tipe data apa yang ada di dalamnya sampai aplikasi dijalankan. Ini sangat berisiko, misal jika ada kesalahan mengonversi data `price` yang mana seharusnya bertipe `int` malah menjadi `String`, ini dapat menyebabkan _runtime error_ ketika dilakukan operasi artimetika pada data `int` tersebut. Dengan adanya model, dapat dilakukan konversi dan validasi secara eksplisit dari `json["price"]` menjadi `int price`. Jika ada kesalahan, permasalahan akan ditangkap ketika _parsing_ dan bukan ketika _runtime_ aplikasi yang berinteraksi dengan data. Ini dapat mencegah propagasi kesalahan lebih lanjut dan mempermudah _debugging_.
-   Penggunaan model dapat memastikan bahwa data memiliki _null safety_. Saat mengakses `map['name']`, nilainya bisa saja `null` (karena _key_-nya tidak ada atau nilainya memang `null` di JSON). Jika tidak ditangani, hal ini dapat memicu `NullPointerException`. Dengan model, kita dapat mendefinisikan properti yang wajib ada (non-nullable) di _constructor_ (misalnya `required this.name`), hal ini menyebabkan kasus `null` ditangani saat _parsing_ di `fromJson`, sehingga objek dijamin memiliki nilai yang valid.
-   _Maintainability_ dapat menjadi lebih sulit jika tidak menerapkan model. Sebagai contoh, menggunakan `productMap['is_featured']` jauh lebih sulit dibaca dan rentan salah ketik (typo) daripada `product.isFeatured`. Selain itu, IDE tidak dapat menangkap kesalahan nama _key_ jika mengggunakan `Map` (misal, `productMap['is_faetured']`), tetapi jika menggunakan model, IDE dapat langsung menangkap kesalahan typo `product.isFaetured` dan mencegah dimulainya _runtime_ sampai kesalahan diperbaiki.

### Apa fungsi package `http` dan `CookieRequest` dalam tugas ini? Jelaskan perbedaan peran `http` vs` CookieRequest`.

`http` adalah _package_ yang menyediakan peralatan dasar untuk melakukan _HTTP request_. Sifatnya _stateless_, `http` hanya mengirim `request` dan menerima `response` dari halaman web, dan secara bawaan tidak menyimpan _cookies_ atau _session_.

`CookieRequest` adalah sebuah _class_ dari _package_ `pbp_django_auth` yang secara khusus menangani autentikasi dengan website berbasis Django. `CookieRequest` dapat menyimpan _cookies_ yang diterima (seperti data pengguna yang saat ini _logged in_), serta secara otomatis melampirkan _cookies_ untuk melakukan _request_ lain. Singkatnya, `http` adalah alat mentah, sedangkan `CookieRequest` adalah _wrapper_ untuk mengotomatisasi manajemen _session cookie_ Django.

### Jelaskan mengapa _instance_ `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instansi ini perlu dibagikan karena _state_ autentikasi disimpan dalam instansi ini. Agar seluruh aplikasi tahu bahwa pengguna sudah login dan siapa yang login, semua bagian aplikasi harus menggunakan satu _instance_ `CookieRequest` yang sama. Dalam aplikasi ini, mekanisme berbagi _cookie_ dilakukan menggunakan `Provider` di `lib/main.dart`, di mana dibuat sebuah `CookieRequest` yang dapat diakses di mana saja di _widget tree_ dengan `context.watch<CookieRequest>()`.

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter dapat berkomunikasi dengan Django, perlu ada pengaturan konektivitas sebagai berikut.

-   Pengaturan alamat `10.0.2.2` di `ALLOWED_HOSTS`: Ini adalah alamat IP _loopback_ untuk Android Emulator yang merujuk pada `localhost` server (`127.0.0.1`). Saat server Django berjalan di `localhost:8000`, aplikasi Flutter di emulator harus mengaksesnya melalui `http://10.0.2.2:8000`. Jika pengaturan ini tidak dilakukan, Django akan menolak koneksi dari emulator dan aplikasi Flutter akan gagal terhubung.

-   CORS (_Cross-Origin Resource Sharing_): Ini adalah fitur yang memitigasi permasalahan yang timbul karena _Same-Origin Policy_ pada browser modern. Karena alasan keamanan, browser akan melarang suatu skrip di satu domain (dalam hal ini aplikasi Flutter yang dijalankan lewat Flutter Web) untuk meminta data dari domain lain (dalam hal ini website Django). CORS adalah mekanisme bagi server (Django) untuk memberi tahu browser bahwa domain lain (Flutter Web) diizinkan mengaksesnya. Package seperti `django-cors-headers` digunakan untuk menambahkan header HTTP yang sesuai (seperti _Access-Control-Allow-Origin_). Jika hal ini tidak dilakukan. pada Flutter Web, browser akan memblokir permintaan ke API Django, dan menimbulkan _CORS error_.

-   Pengaturan `SameSite`/Cookie: Ini bertujuan untuk mengontrol apakah _cookie_ dikirim bersama permintaan lintas domain. Untuk mengizinkannya, Django harus diatur agar mengirim cookie dengan `SameSite=None` dan `Secure=True` (ini mewajibkan HTTPS) untuk _cookies_ _session_ maupun CSRF. Jika tidak dilakukan, setiap permintaan setelah login (seperti mengambil data produk) akan gagal autentikasi. Ini karena browser tidak mengirimkan _session cookie_ yang sudah didapat, sehingga Django menganggap pengguna masih anonim/_guest_.

-   Izin Internet di Android: Hal ini agar aplikasi Flutter yang dijalankan di Android dapat mengakses internet. Secara _default_, aplikasi Android berjalan dalam sandbox dan tidak diizinkan melakukan operasi "berbahaya" seperti mengakses internet. Untuk mengizinkan aplikasi Flutter terhubung ke API Django, harus diatur `<uses-permission android:name="android.permission.INTERNET" />` di `AndroidManifest.xml`. Jika tidak dilakukan, aplikasi Android akan crash atau langsung gagal (dengan _SocketException_ atau sejenisnya) setiap kali mencoba melakukan panggilan jaringan karena tidak memiliki izin untuk mengakses jaringan.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

-   Pengguna mengisi data di halaman `ProductForm` di _field_ yang tersedia.
-   Seiring pengguna memasukkan data, fungsi `onChanged` pada setiap _field_ akan memperbarui variabel _state_ lokal dalam `_ProductFormState`.
-   Ketika pengguna menekan tombol "Save", picu fungsi `onPressed` di `ElevatedButton`.
-   Validasi input pengguna oleh `_formKey.currentState!.validate()`.
-   Jika valid, data dari variabel _state_ dikumpulkan dan dienkode menjadi JSON oleh `jsonEncode`.
-   Instance `CookieRequest` (dari `Provider`) mengirim data ini ke _backend_ Django melalui `request.postJson()`. Permintaan ini membawa _body_ JSON dan _session cookie_ (jika pengguna sudah login).
-   Setelah tiba di _backend_, Django menerima permintaan, menggunakan _session cookie_ untuk mengidentifikasi pengguna, mem-_parsing_ data JSON, memvalidasinya di sisi server, dan menyimpan produk baru ke database.
-   Django mengirimkan respons JSON kembali ke Flutter, misalnya `{'status': 'success'}`.
-   Aplikasi Flutter menerima respons secara asinkronus. Jika status respons sukses, tampilkan `SnackBar` pesan sukses lalu arahkan ke `MyHomePage`. Jika gagal, tampilkan `SnackBar` pesan gagal.
-   Jika setelah itu pengguna membuka halaman "All Products" atau "My Products", `FutureBuilder` akan memanggil `fetchProducts`, melakukan `request.get` ke Django, mengambil data produk (termasuk yang baru ditambahkan), mengubahnya menjadi `List<Product>` (menggunakan model `Product.fromJson`), dan menampilkannya dalam `ListView` menggunakan `ProductCard`.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme login:

-   Pengguna mengisi `TextField` Username dan Password.

-   Tombol "Login" ditekan. `CookieRequest` (via `Provider`) melakukan `request.post` ke _endpoint_ login Django.

-   Django memverifikasi username dan password. Jika cocok, Django membuat _session_ di database dan mengaitkannya dengan pengguna tersebut.

-   Django mengirim respons HTTP 200 OK yang berisi respons berupa JSON yang berisi `status`, `username`, dan `message`, serta ada `sessionid` di header `Set-Cookie`.

-   `CookieRequest` secara otomatis mendeteksi dan menyimpan `sessionid` dari header `Set-Cookie`.

-   Aplikasi memeriksa body JSON. Jika _response['status'] == true_, simpan `username` pengguna, tampilkan `SnackBar` dan arahkan ke `MyHomePage` dengan `username` sebagai parameter (dismpan di `LeftDrawer`).

Mekanisme register:

-   Pengguna mengisi `TextField` Username, Password, dan Confirm Password.

-   Tombol "Register" ditekan. `CookieRequest` melakukan `request.post` ke _endpoint_ register Django, mengirimkan data input dalam format JSON.

-   Django menerima data, memvalidasi (pakah username sudah ada, apakah kedua password cocok). Jika valid, Django membuat objek `User` baru di database.

-   Django mengirim respons JSON, misal `{'status': true, 'message': '...'}`.

-   Flutter memeriksa `response['status']`. Jika true, tampilkan `SnackBar` sukses dan arahkan `(Navigator.pushReplacement)` pengguna ke `LoginPage`.

Mekanisme logout:

-   Pengguna menekan tombol "Logout" di dalam `LeftDrawer`.

-   `CookieRequest` memanggil `request.logout()`. `CookieRequest` otomatis melampirkan `sessionid` yang disimpannya.

-   Django menerima permintaan. Berkat `sessionid`, Django tahu siapa yang logout. Django menghancurkan _session_ dari database.

-   Django mengirim respons HTTP 200 OK.

-   `CookieRequest` menghapus `sessionid` dari penyimpanannya.

-   Aplikasi menampilkan `SnackBar` "See you again", lalu mengarahkan (`Navigator.pushReplacement`) pengguna kembali ke `LoginPage`.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

#### Verifikasi _deployment_ proyek Django

Proyek Django ([https://github.com/nathanaeru/ballin](https://github.com/nathanaeru/ballin)) telah di-_deploy_ dengan baik di alamat web [https://nathanael-leander-ballin.pbp.cs.ui.ac.id/](https://nathanael-leander-ballin.pbp.cs.ui.ac.id/) sehingga dapat diakses secara global tanpa perlu _setup localhost_. Perlu ada sedikit penyesuaian untuk memastikan aplikasi Flutter dapat menggunakan API website ini.

#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

Registrasi akun ditangani oleh [`lib/screens/register.dart`](lib/screens/register.dart). Halaman ini bertujuan untuk membuat akun pengguna baru dengan cara mengakses website Django melalui API secara asinkronus. Input yang diberikan adalah username, password, dan konfirmasi password. Untuk keperluan ini dan selanjutnya, pada proyek Flutter perlu diinstal _dependencies_ antara lain `provider`, `http`, dan `pbp_django_auth`, serta perlu ditambahkan pengembalian objek `Provider` yang membuat suatu `CookieRequest` pada [`lib/main.dart`](lib/main.dart). Selain ketiga _package_ utama tersebut, ditambahkan juga `intl` yang bertujuan menangani formatting harga. Juga perlu dipastikan agar aplikasi Android yang nantinya dihasilkan dapat mengakses internet, dengan cara menambahkan _permission_ di [`android/app/src/main/AndroidManifest.xml`](android/app/src/main/AndroidManifest.xml).

#### Membuat halaman login pada proyek tugas Flutter.

Login ditangani oleh [`lib/screens/login.dart`](lib/screens/login.dart). Halaman ini bertujuan untuk melakukan login pengguna dengan cara mengakses website Django melalui API secara asinkronus. Input yang diberikan adalah username dan password. Selain login, juga dibuat logout yang ditangani oleh sebuah tombol di bagian bawah `LeftDrawer`.

#### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

Untuk ini, dibuat aplikasi baru di proyek Django bernama `authentication` dengan beberapa metode di `views.py` untuk menangani _request_ login, register, dan logout, semuanya mengembalikan objek `JsonResponse` yang dapat diolah di aplikasi Flutter, beserta _routing_ yang sesuai (didefinisikan di file `urls.py` di direktori proyek `ballin/urls.py` dan direktori aplikasi `authentication/urls.py`). Selain itu, buat pengaturan di `ballin/settings.py` terkait _allowed hosts_, CORS, dan `SameSite` agar API dapat diakses lewat aplikasi Flutter.

#### Membuat model kustom sesuai dengan proyek aplikasi Django.

Model produk dibuat dari `main/models.py` di proyek Django yang dikonversi ke model Dart menggunakan [quicktype](https://app.quicktype.io/). Lokasi model adalah di [`lib/models/product.dart`](lib/models/product.dart) dengan atribut-atribut yang sama dengan model di Django.

#### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

Kita manfaatkan metode `show_json()` di `main/views.py` yang mengembalikan semua produk yang terdaftar di website dalam sebuah daftar beberapa objek JSON. Setiap produk ditampilkan dalam tampilan kartu di [`lib/widgets/product_card.dart`](lib/widgets/product_card.dart) yang berisi atribut dasar produk (_name, price, description, thumbnail, category, is featured_). Setiap `ProductCard` adalah `InkWell` yang apabila ditekan, akan berpindah ke halaman `ProductDetailPage` yang bersesuaian. Tampilan gambar untuk _thumbnail_ ditangani oleh fungsi `proxy_image()` yang mengembalikan data `HttpResponse` konten gambar (mendukung JP(E)G, PNG, WEBP, dan GIF). Halaman semua produk ada di [`lib/screens/all_product_list.dart`](lib/screens/all_product_list.dart) di mana yang dilakukan di halaman ini adalah _fetching_ daftar produk dari aplikasi Django dan menampilkannya sebagai daftar `ProductCard`.

#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

Halaman ini dibuat di [`lib/screens/product_detail.dart`](lib/screens/product_detail.dart) yang menampilkan seluruh atribut produk, dengan atribut `Product` yang mereferensi kepada produk yang tampil di halaman daftar produk, dan Di setiap halaman produk, tepatnya di `AppBar`-nya, terdapat sebuah tombol untuk kembali ke daftar produk dengan `Navigator.pop()`.

#### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.

Filtering dilakukan dengan membuat halaman baru [`lib/screens/my_product_list.dart`](lib/screens/my_product_list.dart) yang pada dasarnya sama dengan `all_product_list` namun mengakses _endpoint_ berbeda, yang mana _endpoint_ ini memanggil fungsi baru `show_json_by_username()` di `views.py` proyek Django dan mengembalikan daftar produk yang dibuat oleh username tertentu, dikemas dalam suatu JSON. Sama seperti sebelumnya, daftar ini juga menampilkan daftar `ProductCard` yang jika ditekan, akan beralih ke halaman detail produk.

</details>
