import 'dart:convert';

import 'package:school_apps/main.dart';

var url = jsonDecode(dataBaseUrl);
String baseUrl = '${url['base_url_api']}';
String baseUrlEdsy = '${url['base_url_lms']}/';
String baseUrlTugas = '$baseUrlEdsy/SoalTugas/';
String baseUrlMateriBahanFile = '$baseUrlEdsy/BahanAjarMateri/';
String baseUrlJawaban = '$baseUrlEdsy/JawabanFile/';
String logoSekolah = '${url['base_url_admin']}/logo/';
String profileGuru = '${url['base_url_admin']}/pasfoto/guru/';
String profileSiswa = '${url['base_url_admin']}/pasfoto/siswa/';

String buktiBayarUrl = '$baseUrlEdsy/BuktiBayar/';

// users
String signIn = "$baseUrl/users/sign-in";
String updateProfileAPi = "$baseUrl/users/update-profile";
String resetPassword = "$baseUrl/users/reset-password-users";
String profile = "$baseUrl/users/profile/";

// tahun ajaran
String tahunAjaran = "$baseUrl/tahun-ajaran/get-data";

//jadwal guru
String matapelajaranGuru = "$baseUrl/jadwal/matapelajaran-guru/";
String matapelajaranGuruRekapAbsen = "$baseUrl/jadwal/matapelajaran-guru/rekap-absen/";
String jadwalGuruHariIni = "$baseUrl/jadwal/jadwal-guru-hari-ini/";
String jadwalGuru = "$baseUrl/jadwal/jadwal-guru/";
String jadwalGuruAbsen = "$baseUrl/jadwal/jadwal-guru-absen/";

//komponen nilai
String inputKomponenNilai = "$baseUrl/komponen-nilai/create";
String komponenNilai = "$baseUrl/komponen-nilai/get-data-and-sum/";
String komponenNilaiAll = "$baseUrl/komponen-nilai/get-data/";
String hapusKomponenNilai = "$baseUrl/komponen-nilai/delete/";
String updateKomponenNilai = "$baseUrl/komponen-nilai/update/";
String masterKomponen = "$baseUrl/komponen";

// bahan mengajar
String inputBahanAjar = "$baseUrl/bahan-ajar/create";
String bahanAjar = "$baseUrl/bahan-ajar/get-data/";
String bahanAjarVideo = "$baseUrl/bahan-ajar/get-data-video/";
String bahanAjarFile = "$baseUrl/bahan-ajar/get-data-file/";
String bahanInputAjarVideo = "$baseUrl/bahan-ajar/create-video";
String bahanInputAjarFile = "$baseUrl/bahan-ajar/create-file";
String bahanHapusAjarVideo = "$baseUrl/bahan-ajar/delete-video/";
String bahanUpdateAjar = "$baseUrl/bahan-ajar/update-bahan-ajar/";
String bahanHapusAjar = "$baseUrl/bahan-ajar/hapus-bahan-ajar/";

//tugas
String inputTugas = "$baseUrl/tugas/create";
String updateTugas = "$baseUrl/tugas/update/";
String getTugas = "$baseUrl/tugas/get-tugas/";
String getdetailTugas = "$baseUrl/tugas/detail-tugas/";
String getdetailTugasSiswa = "$baseUrl/tugas/detail-tugas-siswa/";
String inputDetailTugas = "$baseUrl/tugas/input-detail-tugas/";

//soal
String getSoalbyIdDetailTugas = "$baseUrl/soal/get-soal/";
String createSoalEssay = "$baseUrl/soal/create-soal-esay/";
String createSoalFile = "$baseUrl/soal/create-soal-file/";
String updateSoalEssay = "$baseUrl/soal/update-soal-esay/";
String getSoalDanJawabanByNisn = "$baseUrl/soal/get-soal-dan-jawaban/";

//files
String fileTugas = "$baseUrl/files-tgs-uts-uas/";
String fileBahan = "$baseUrl/files-bahan/";

//jadwal siswa
String jadwalSiswaByNipGuru =
    "$baseUrl/jadwal-siswa/matapelajaran-siswa-by-nip-guru/";
String jadwalSiswaByNisn = "$baseUrl/jadwal-siswa/matapelajaran-siswa-by-nisn/";
String jadwalSiswaByNisnHariIni =
    "$baseUrl/jadwal-siswa/matapelajaran-siswa-by-nisn-hari-ini/";

//presensi
String inputPrensiGuru = '$baseUrl/presensi/create-presensi-guru';
String inputPrensiSiswa = '$baseUrl/presensi/create-presensi-siswa';
String getPrensiSiswaByIdSetJadwalNisn =
    '$baseUrl/presensi/presensi-siswa-by-id-setjadwalandnisn';

//laporan absen siswa
String rekapAbsensiswaByIdSetJadwal =
    '$baseUrl/laporan/rekap-absen-by-idsetjadwal';
String rekapAbsensiswaByNisn = '$baseUrl/laporan/rekap-absen-by-nisn';

//jawaban soal
String inputJawaban = '$baseUrl/jawaban/create-jawaban';
String inputJawabanPg = '$baseUrl/jawaban/create-jawaban-pg';
String inputJawabanFile = '$baseUrl/jawaban/create-jawaban-file';
String jawabanByIdSoal = '$baseUrl/jawaban/jawaban-by-id-soal/';
String konfirmasiPengerjaan = '$baseUrl/jawaban/konfirmasi-pengerjaan';
String konfirmasiPemeriksaan = '$baseUrl/jawaban/konfirmasi-pemeriksaan';
String inputNilai = '$baseUrl/jawaban/input-nilai';

//nilai siswa
String nilaiSiswa = '$baseUrl/nilai-siswa/rekap-nilai/';
String detailNilaiSiswa = '$baseUrl/nilai-siswa/rekap-nilai-detail';
String inputNilaiSiswa = '$baseUrl/nilai-siswa/input-nilai-siswa';
String nilaiFinal = '$baseUrl/nilai-siswa/nilai-siswa-by-id-tugas';
String nilaiSiswaByidKomponen = '$baseUrl/nilai-siswa/nilai-siswa-by-nisn/';
String nilaiFinalByNisn = '$baseUrl/nilai-siswa/rekap-nilai-by-nisn';

//data sekolah
String dataSekolahAPI = '$baseUrl/data-sekolah';

//pengumuman
String pengumunan = '$baseUrl/pengumuman';

//pembayaran
String tagihanPembayaran = '$baseUrl/tagihan-pembayaran/by-nisn';
String tagihanPembayaranLunas = '$baseUrl/tagihan-pembayaran/lunas';
String detailTagihanPembayaran = '$baseUrl/tagihan-pembayaran/detail-by-paket';
String transaksiXendit = '$baseUrl/tagihan-pembayaran/transaction-xendit';
String transaksiUploadFile = '$baseUrl/tagihan-pembayaran/transaksi-upload-file';
String rekapTransaksi = '$baseUrl/tagihan-pembayaran/rekap-pembayaran-siswa';
String detailRekapTransaksiUrl = '$baseUrl/tagihan-pembayaran/rekap-pembayaran-siswa/detail';

//pelanggaran
String urlPelanggaran = '$baseUrl/pelanggaran-siswa/';
