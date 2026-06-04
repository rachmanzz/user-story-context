# Q&A Flow Scenario — Pure Questions

This scenario shows an Indonesian-language session (conversation follows user's language).
**All generated output files will be in English** regardless of conversation language.

---

## Turn 1 — AI Membuka Sesi

```
Halo! Saya akan membantu menyusun user story untuk project Anda.
Saya akan bertanya beberapa hal secara bertahap.

Setelah semua informasi terkumpul, saya akan generate:
  ├── user-story.md  (map/index)
  └── includes/*.md  (detail per kategori)
  
  (Catatan: semua file output dalam Bahasa Inggris)

Mari mulai!
```

---

## FASE 1: Project Context (3-4 pertanyaan)

### Turn 2 — AI

```
Pertanyaan 1:
Apa nama project atau produk yang akan dibuat?

Contoh: "TokoKita", "Sistem Absensi Karyawan", "Aplikasi Laundry Online"
```

### Turn 3 — User menjawab

### Turn 4 — AI

```
Pertanyaan 2:
Apa masalah utama yang ingin diselesaikan oleh project ini?

Contoh: "Pelanggan susah cari laundry terdekat", "Karyawan masih pakai absensi manual"
```

### Turn 5 — User menjawab

### Turn 6 — AI

```
Pertanyaan 3:
Siapa saja target user atau pengguna dari sistem ini? Sebutkan role-role-nya.

Contoh: "Admin, Karyawan, Manager" atau "Pembeli, Penjual, Kurir"
```

### Turn 7 — User menjawab

### Turn 8 — AI

```
Pertanyaan 4:
Apa timeline target project? Berapa sprint atau berapa lama?

Contoh: "3 sprint, masing-masing 2 minggu" atau "Harus rilis bulan depan"
```

### Turn 9 — User menjawab

### Turn 10 — AI merangkum

```
Baik, saya rangkum Fase 1:
- Project: [nama]
- Masalah: [problem]
- User: [roles]
- Timeline: [timeline]

Sudah benar? Kalau sudah, kita lanjut ke fitur-fiturnya.
```

---

## FASE 2: Feature Breakdown (3-4 pertanyaan)

### Turn 11 — AI

```
Pertanyaan 5:
Apa saja fitur utama atau modul dari project ini? Sebutkan sebagai epik/epic.

Contoh:
- Manajemen Produk (CRUD produk, kategori)
- Keranjang & Checkout
- Pembayaran
- Laporan Penjualan
```

### Turn 12 — User menjawab

### Turn 13 — AI

```
Pertanyaan 6:
Dari epik yang disebutkan, jelaskan alur inti (core flow) dari masing-masing.

Contoh untuk "Checkout":
"User masuk ke keranjang → pilih alamat → pilih pembayaran → konfirmasi → dapat order ID"
```

### Turn 14 — User menjawab

### Turn 15 — AI

```
Pertanyaan 7:
Role user mana saja yang terlibat di setiap epik?

Contoh:
- Manajemen Produk → Admin
- Checkout → Pembeli
- Laporan → Admin, Manager
```

### Turn 16 — User menjawab

### Turn 17 — AI merangkum

```
Rangkuman Fase 2:
- Epik 1: [nama] — alur: [flow] — role: [roles]
- Epik 2: [nama] — alur: [flow] — role: [roles]
...

Lanjut ke teknis?
```

---

## FASE 3: Technical & Constraints (2-3 pertanyaan)

### Turn 18 — AI

```
Pertanyaan 8:
Platform apa yang digunakan? Web, mobile, API, atau kombinasi?

Contoh: "Web (React + Node.js)", "Mobile (Flutter)", "API-only"
```

### Turn 19 — User menjawab

### Turn 20 — AI

```
Pertanyaan 9:
Apakah ada constraint teknis yang sudah ditentukan?
Misalnya: metode auth (JWT/OAuth), database, integrasi pihak ketiga.

Contoh: "Pakai JWT, integrasi Midtrans payment, database PostgreSQL"
```

### Turn 21 — User menjawab

### Turn 22 — AI

```
Pertanyaan 10:
Ada requirement khusus untuk performa atau keamanan?

Contoh: "Halaman harus load < 2 detik", "Ada rate limiting", "Semua API harus HTTPS"
```

### Turn 23 — User menjawab

### Turn 24 — AI merangkum

```
Rangkuman Fase 3:
- Platform: [platform]
- Constraints: [constraints]
- Performa/Security: [requirements]

Lanjut prioritas?
```

---

## FASE 4: Prioritization (2 pertanyaan)

### Turn 25 — AI

```
Pertanyaan 11:
Dari semua epik/fitur yang disebutkan, mana yang termasuk:
- Must Have (wajib, tidak bisa rilis tanpa ini)
- Should Have (penting, tapi bisa ditunda)
- Could Have (nice to have, kalo ada waktu)

Contoh:
- Must: Login, Manajemen Produk, Checkout
- Should: Laporan Penjualan
- Could: Notifikasi Email
```

### Turn 26 — User menjawab

### Turn 27 — AI

```
Pertanyaan 12:
Apakah ada dependensi antar fitur? Fitur mana yang harus selesai dulu sebelum fitur lain bisa dikerjakan?

Contoh: "Checkout butuh Login selesai dulu", "Laporan butuh data transaksi"
```

### Turn 28 — User menjawab

### Turn 29 — AI merangkum & konfirmasi generate

```
Rangkuman Final:

Project: [nama]
Epik:
  EPIC-1 [nama] — Must — tergantung: [deps]
  EPIC-2 [nama] — Should — tergantung: [deps]
  EPIC-3 [nama] — Could — tergantung: [deps]

Technical: [platform], [auth], [db]

Siap? Saya akan generate:
  ├── user-story.md
  └── includes/ (7 file)

Lanjut generate? (y/n)
```

---

## FASE 5: Generate Output

### Turn 30 — User: "y"

### Turn 31 — AI generate semua file:

```
Berikut output lengkap:

=== user-story.md ===
[full content]

=== includes/epics.md ===
[full content]

=== includes/user-stories.md ===
[full content]

=== includes/acceptance-criteria.md ===
[full content]

=== includes/bdd-scenarios.md ===
[full content]

=== includes/technical-notes.md ===
[full content]

=== includes/ux-notes.md ===
[full content]

=== includes/glossary.md ===
[full content]
```

---

## Turn Summary

| Phase | Turn | AI Asks | User Answers |
|-------|------|---------|--------------|
| Opening | 1 | 1 | 0 |
| Project Context | 2-10 | 4 + 1 summary | 4 |
| Feature Breakdown | 11-17 | 3 + 1 summary | 3 |
| Technical | 18-24 | 3 + 1 summary | 3 |
| Prioritization | 25-29 | 2 + 1 summary | 2 |
| Confirmation | 30 | 1 | 1 |
| Generate | 31 | Generate all files | 0 |
| **Total** | **31** | **~16 turns** | **~13 turns** |

**Note:** All generated output files are in English regardless of conversation language.
