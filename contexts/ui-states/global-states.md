# Global UI States Definition

Gunakan definisi ini di semua user story agar konsisten. Cukup tulis nama state-nya saja di `ux-notes.md`, tidak perlu jelaskan ulang.

---

## Loading State

| Aspect | Definition |
|--------|------------|
| **Trigger** | Saat data sedang di-fetch dari server |
| **UI** | Skeleton loader / spinner di area konten |
| **Interaction** | Tombol aksi disabled, tampilkan loading spinner di dalam tombol |
| **Timeout** | Jika > 10 detik, tampilkan "Memuat ulang..." dengan tombol retry |

## Empty State

| Aspect | Definition |
|--------|------------|
| **Trigger** | Data kosong (belum ada konten, hasil filter tidak cocok) |
| **UI** | Ilustrasi + teks penjelasan + CTA (jika relevan) |
| **Example** | "Belum ada transaksi. Mulai belanja sekarang!" + tombol "Belanja" |
| **CTA** | Sediakan 1 tombol aksi utama untuk memulai |

## Error State

| Aspect | Definition |
|--------|------------|
| **Trigger** | Gagal fetch data / submit form / koneksi terputus |
| **UI** | Pesan error jelas (bukan kode), ilustrasi opsional |
| **Message** | Bahasa manusia: "Gagal memuat data. Periksa koneksi Anda." |
| **Action** | Tombol "Coba Lagi" yang melakukan retry |
| **Timeout** | Jika retry gagal 3x, tampilkan kontak support |

## Success State

| Aspect | Definition |
|--------|------------|
| **Trigger** | Operasi berhasil (submit, update, delete) |
| **UI** | Toast / banner hijau di pojok atas, auto-dismiss 5 detik |
| **Message** | Ringkas: "Transaksi berhasil!" / "Data berhasil disimpan" |
| **Action** | Redirect atau refresh data otomatis |

## Not Found State (404)

| Aspect | Definition |
|--------|------------|
| **Trigger** | Halaman/data tidak ditemukan |
| **UI** | Ilustrasi 404 + teks "Halaman tidak ditemukan" |
| **Action** | Tombol "Ke Beranda" |

## Form Validation State

| Aspect | Definition |
|--------|------------|
| **Trigger** | Input tidak valid saat submit / blur |
| **UI** | Border merah di field error + teks bantuan di bawah field |
| **Message** | Spesifik: "Email tidak valid" bukan "Input error" |
| **Timing** | Validasi real-time setelah user selesai mengetik (debounce 300ms) |
