######
REVISI
######


**
PI
**
-submit dari user masuk ke tabel bayangan_absen dengan status waiting confirmation. data2 dilain hari masih tetap ada hingga di hapus
-saat admin telah melakukan acc, absen dihapus dari bayangan ke tabel absen
-akun bisa disuspend
-tabel status memuat semua jenis absen(hadir,ijin1hari,alpha,sakit,cuti) dan ijin(ijin per jam saat jam kerja)
-struktur tabel ijin
	id_i
	id_k
	tanggal
	jenis (ijin 1 hari || ijin perjam)
	durasi
	denda
-karyawan berhak mengakses sebatas laporan.