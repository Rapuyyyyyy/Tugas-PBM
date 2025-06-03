# flutter_mini_habit_tracker

## Nama:
Mahardika Rafaditya Dwi Putra Hastomo, NIM: 452210146

## Tujuan Praktikum:
Mempelajari dan mengimplementasikan manajemen data lokal sederhana di Flutter tanpa database eksternal. Praktikum ini juga bertujuan untuk memahami penggunaan `StatefulWidget`, dialog dinamis, dan perubahan tema (light/dark mode) dalam aplikasi.

## Deskripsi Aplikasi:
Aplikasi ini merupakan *Habit Tracker Mini* yang memungkinkan pengguna untuk menambahkan, mengedit, menghapus, dan menandai kebiasaan harian (habits) yang telah dilakukan. Data habit dimuat dari file lokal `assets/habits.json`, dan pengguna dapat mengatur status masing-masing habit secara manual.

## Screenshot Emulator:
### Tampilan Umum
- Halaman utama aplikasi
  ![homepage](assets/images/homepage.png)

### Interaksi Tambah/Edit Habit
- Tombol tambah habit
  ![tombol_plus](assets/images/tombol_plus.png)
- Form isi habit
  ![isi_form](assets/images/isi_form.png)
- Form kosong (validasi error)
  ![tanpa_nama](assets/images/tanpa_nama.png)
- Hasil setelah edit habit
  ![hasil_edit_form](assets/images/hasil_edit_form.png)
- Edit habit dialog
  ![edit_habit](assets/images/edit_habit.png)

### Penghapusan Habit
- Ikon tiga titik untuk opsi habit
  ![titik_tiga](assets/images/titik_tiga.png)
- Dialog konfirmasi hapus
  ![dialog_hapus](assets/images/dialog_hapus.png)
- Tampilan setelah habit dihapus
  ![setelah_dihapus](assets/images/setelah_dihapus.png)

### Fitur Checkbox & Reset
- Uji coba centang habit (strikethrough)
  ![uji_strikethrough](assets/images/uji_strikethrough.png)
- Progres bar kebiasaan yang sudah dilakukan
  ![uji_progres_bar](assets/images/uji_progres_bar.png)
- Reset checkbox
  ![uji_reset](assets/images/uji_reset.png)

### Debugging Console Output
- Debug saat menambahkan habit
  ![add_debug_console](assets/images/add_debug_console.png)
- Debug saat mengedit habit
  ![edit_debug_console](assets/images/edit_debug_console.png)
- Debug saat menghapus habit
  ![delete_debug_console](assets/images/delete_debug_console.png)
- Debug pengecekan kondisi tertentu
  ![check_debug_console](assets/images/check_debug_console.png)

### Uji State & Efek UI
- Efek ephemeral state
  ![uji_ephemeral_state](assets/images/uji_ephemeral_state.png)

## Penjelasan Program:
- Aplikasi dibangun menggunakan **Flutter** dan bahasa pemrograman **Dart**.
- Fitur utama:
  - **Tambah Habit**: Melalui tombol `+` atau ikon di AppBar, pengguna bisa menambahkan habit baru melalui dialog dengan validasi form.
  - **Edit Habit**: Tekan ikon menu (⋮) lalu pilih “Edit” untuk mengubah nama atau deskripsi habit.
  - **Hapus Habit**: Akses opsi “Hapus” dari menu yang sama, dengan konfirmasi dialog sebelum penghapusan.
  - **Checkbox**: Menandai apakah habit telah dilakukan.
  - **Reset**: Tombol `refresh` akan menghapus semua tanda centang.
  - **Tema Gelap/Terang**: Toggle tema langsung dari AppBar menggunakan ikon lampu/gelap.
- Desain menggunakan kombinasi warna adaptif tergantung tema (light/dark) dengan tampilan bersih dan interaktif.
- Data dimuat dari file `assets/habits.json` menggunakan `DefaultAssetBundle`, dan parsing dilakukan dengan `jsonDecode`.
- ID habit baru dihasilkan secara otomatis berdasarkan nilai ID terbesar saat ini menggunakan fungsi `max`.

## Cara Menjalankan Aplikasi:
flutter pub get flutter run