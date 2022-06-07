// We use name route
// All our routes will be available here
import 'package:flutter/widgets.dart';
import 'package:school_apps/screens/OnBoarding/OnBoarding.dart';
import 'package:school_apps/screens/OnBoarding/SuccessOnBoarding.dart';
import 'package:school_apps/screens/features/guru/home/guru_screens.dart';
import 'package:school_apps/screens/features/guru/home/pengumuman.dart';
import 'package:school_apps/screens/features/guru/home_guru.dart';
import 'package:school_apps/screens/features/guru/jadwal_pelajaran_guru/jadwal_pelajaran_guru_screen.dart';
import 'package:school_apps/screens/features/guru/menu_pembelajaran/menu_pembelajaran_screens.dart';
import 'package:school_apps/screens/features/guru/profile/detail_profile_screens.dart';
import 'package:school_apps/screens/features/guru/profile/profile_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/input_nilai_screens.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/edit_nilai_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/siswa_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai.dart';
// import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa_keterampilan/edit_nilai_screen.dart';
// import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa_keterampilan/input_nilai_screen.dart';
// import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa_keterampilan/siswa_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/input_komponen_nilai_keterampilan_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/komponen_nilai/kategori_nilai_screen.dart';
import 'package:school_apps/screens/features/guru/sub_manajemen_penilaian/sub_menu_penilaian_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/input_bahan_ajar_form.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/input_file_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/input_video_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/play_video_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar/update_bahan_ajar_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_jadwal_hari_ini/jadwal_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/detail_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/input_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/playVideoYoutube.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/quiz_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz/update_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/input_soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/jawaban_quiz_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/soal_quiz_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_quiz/soal_quiz/update_soal_quiz.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/input_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/jawaban_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/soal_tugas/update_soal.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/input_tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/playVideoYoutube.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas/update_tugas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_tugas/tugas_scareens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/input_soal_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/soal_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/soal_ujian/update_soal_ujian.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/detail_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/input_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/tugas_screens_.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian/update_ujian_screens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_ujian/ujian_scareens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/laporan_absen_wali_kelas_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/mata_pelajaran_menu_wali_kelas_lihat_absen_screen.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/mata_pelajaran_menu_wali_kelas_screeens.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/sub_menu_wali_kelas_lihat_nilai.dart';
import 'package:school_apps/screens/features/guru/sub_menu_wali_kelas/sub_menu_wali_kelas_screen.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/absensi_kelas_screens.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/detail_absen_siswa_diguru_screen.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/laporan_absen_kelas_screen.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/mata_pelajaran_untuk_absen_screen.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/mata_pelajaran_untuk_laporan_absen.dart';
import 'package:school_apps/screens/features/guru/sub_presensi_kelas/sub_presensi_kelas.dart';
import 'package:school_apps/screens/features/siswa/home/pengumuman.dart';
import 'package:school_apps/screens/features/siswa/home/siswa_screens.dart';
import 'package:school_apps/screens/features/siswa/home_siswa.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/DetailHistoryScreens.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/DetailRekapPembayaranScreens.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/DetailTagihanScreens.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/HistoryTransaksi.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/MenuKeuanganScreens.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/PilihMetodePembayaran.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/RekapPembayaran.dart';
import 'package:school_apps/screens/features/siswa/keuangan/Screens/TagihanScreens.dart';
import 'package:school_apps/screens/features/siswa/menu_pembelajaran_siswa/menu_pembelajaran_screens.dart';
import 'package:school_apps/screens/features/siswa/profile/detail_profile_screens.dart';
import 'package:school_apps/screens/features/siswa/profile/profile_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_bahan_ajar_siswa/bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_bahan_ajar_siswa/bahan_ajar/play_video_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_bahan_ajar_siswa/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_jadwal/jadwal_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/data_pelanggaran/detailpelanggaran.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/data_pelanggaran/menu_pelanggaran.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_kesiswaan/kesiswaan_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/detail_nilai_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/mata_pelajaran_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_nilai/nilai_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_presensi/absen_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_presensi/detail_absen_per_siiswa.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_presensi/mata_pelajaran_screen.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_quiz_siswa/quiz_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_quiz_siswa/quiz_siswa/detail_quiz_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_quiz_siswa/quiz_siswa/quiz_screens_.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_quiz_siswa/soal_quiz/soal_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/soal_tugas/soal_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas/detail_tugas_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas/playVideoYoutube.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas/tugas_screens.dart';
import 'package:school_apps/screens/features/siswa/sub_menu_tugas_siswa/tugas_scareens.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid/pengumuman.dart';
import 'package:school_apps/screens/features/wali_murid/home_walimurid/walimurid_screen.dart';
import 'package:school_apps/screens/features/wali_murid/jadwal_pelajaran/jadwal_pelajaran_walimurid_screen.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/DetailHistoryScreens.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/DetailRekapPembayaranScreens.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/DetailTagihanScreens.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/HistoryTransaksi.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/MenuKeuanganScreens.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/PilihMetodePembayaran.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/RekapPembayaran.dart';
import 'package:school_apps/screens/features/wali_murid/keuangan/screens/TagihanScreens.dart';
import 'package:school_apps/screens/features/wali_murid/menu_pembelajaran/menu_pembelajaran_screen.dart';
import 'package:school_apps/screens/features/wali_murid/profil/detail_profil_screen.dart';
import 'package:school_apps/screens/features/wali_murid/profil/profil_screen.dart';
import 'package:school_apps/screens/features/wali_murid/profil/ubah_password.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar/play_video_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_bahan_ajar/bahan_ajar_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_jadwal/jadwal_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/data_menu_pelanggaran/detail_pelanggaran.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/data_menu_pelanggaran/menu_pelanggaran.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_kesiswaan/menu_kesiswaan_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/detail_nilai_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/mata_pelajaran_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_nilai/nilai_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/absen_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/detail_absen_per_siswa.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_presensi/mata_pelajaran_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/detail_quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz/quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_quiz/soal_quiz/soal_quiz_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/soal_tugas/soal_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/detail_tugas_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/playvideoyoutube.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas/tugas_screen.dart';
import 'package:school_apps/screens/features/wali_murid/sub_menu_tugas/tugas_screen.dart';
import 'package:school_apps/screens/forgot_password/forgot_password_screen.dart';
import 'package:school_apps/screens/login/login_screens.dart';
import 'package:school_apps/screens/login_success/login_success_screen.dart';
import 'package:school_apps/screens/sign_up/sign_up_screen.dart';

import 'screens/features/guru/sub_manajemen_penilaian/input_nilai/siswa/input_nilai_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),

  //guru routes
  GuruScreen.routeName: (context) => GuruScreen(),
  SubMenuManajemenPenilaian.routeName: (context) => SubMenuManajemenPenilaian(),
  BeforeInputKategoriNilai.routeName: (context) => BeforeInputKategoriNilai(),
  InputKategoriNilai.routeName: (context) => InputKategoriNilai(),
  ManajemenNilai.routeName: (context) => ManajemenNilai(),
  ListNilaiSiswa.routeName: (context) => ListNilaiSiswa(),
  SubMenuPresensiKelas.routeName: (context) => SubMenuPresensiKelas(),
  MataPelajaranUntukAbsen.routeName: (context) => MataPelajaranUntukAbsen(),
  AbsenKelasScreen.routeName: (context) => AbsenKelasScreen(),
  InputNilai.routeName: (context) => InputNilai(),
  EditNilai.routeName: (context) => EditNilai(),
  MataPelajaranUntukLaporanAbsen.routeName: (context) =>
      MataPelajaranUntukLaporanAbsen(),
  LaporanAbsenKelasScreen.routeName: (context) => LaporanAbsenKelasScreen(),
  JadwalKelasGuru.routeName: (context) => JadwalKelasGuru(),
  SubMenuWaliKelas.routeName: (context) => SubMenuWaliKelas(),
  MataPelajaranMenuWaliKelas.routeName: (context) =>
      MataPelajaranMenuWaliKelas(),
  SubWaliKelasLihatNilai.routeName: (context) => SubWaliKelasLihatNilai(),
  MataPelajaranMenuWaliKelasLihatAbsen.routeName: (context) =>
      MataPelajaranMenuWaliKelasLihatAbsen(),
  WaliKelasLaporanAbsenKelasScreen.routeName: (context) =>
      WaliKelasLaporanAbsenKelasScreen(),
  // InputNilaiKeterampilanPersiswa.routeName: (context) => InputNilaiKeterampilanPersiswa(),
  // InputNilaiKeterampilan.routeName: (context) => InputNilaiKeterampilan(),
  // EditNilaiKeterampilan.routeName: (context) => EditNilaiKeterampilan(),
  DetailAbsenSiswaPerTanggalDiGuru.routeName: (context) =>
      DetailAbsenSiswaPerTanggalDiGuru(),
  HomeGuru.routeName: (context) => HomeGuru(),
  JadwalPelajaranGuru.routeName: (context) => JadwalPelajaranGuru(),
  MenuPembelajaran.routeName: (context) => MenuPembelajaran(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  InputKategoriNilaiKeterampilan.routeName: (context) =>
      InputKategoriNilaiKeterampilan(),
  SubMenuBahanajar.routeName: (context) => SubMenuBahanajar(),
  BahanMengajar.routeName: (context) => BahanMengajar(),
  InputBahanAjar.routeName: (context) => InputBahanAjar(),
  InputVideo.routeName: (context) => InputVideo(),
  InputFile.routeName: (context) => InputFile(),
  UpdateBahanAjar.routeName: (context) => UpdateBahanAjar(),
  SubMenuTugas.routeName: (context) => SubMenuTugas(),
  MenuTugas.routeName: (context) => MenuTugas(),
  InputTugas.routeName: (context) => InputTugas(),
  UpdateTugas.routeName: (context) => UpdateTugas(),
  SoalTugas.routeName: (context) => SoalTugas(),
  InputSoalEssay.routeName: (context) => const InputSoalEssay(),
  DetailTugas.routeName: (context) => DetailTugas(),
  UpdateSoalEssay.routeName: (context) => const UpdateSoalEssay(),
  SubMenuQuiz.routeName: (context) => SubMenuQuiz(),
  MenuQuiz.routeName: (context) => MenuQuiz(),
  InputQuiz.routeName: (context) => InputQuiz(),
  UpdateQuiz.routeName: (context) => UpdateQuiz(),
  DetailQuiz.routeName: (context) => DetailQuiz(),
  InputSoalQuiz.routeName: (context) => const InputSoalQuiz(),
  SoalQuiz.routeName: (context) => SoalQuiz(),
  UpdateSoalQuiz.routeName: (context) => const UpdateSoalQuiz(),
  SubMenuUjian.routeName: (context) => SubMenuUjian(),
  MenuUjian.routeName: (context) => MenuUjian(),
  InputUjian.routeName: (context) => InputUjian(),
  UpdateUjian.routeName: (context) => UpdateUjian(),
  DetailUjian.routeName: (context) => DetailUjian(),
  InputSoalUjian.routeName: (context) => const InputSoalUjian(),
  SoalUjian.routeName: (context) => SoalUjian(),
  UpdateSoalUjian.routeName: (context) => const UpdateSoalUjian(),
  JawabanSiswaDiGuru.routeName: (context) => JawabanSiswaDiGuru(),
  PengumumanGuru.routeName: (context) => PengumumanGuru(),
  PlayVideo.routeName: (context) => PlayVideo(),
  JawabanQuizSiswaDiGuru.routeName: (context) => JawabanQuizSiswaDiGuru(),
  SubMenuQuizSiswa.routeName: (context) => SubMenuQuizSiswa(),
  MenuQuizSiswa.routeName: (context) => MenuQuizSiswa(),
  DetailQuizSiswa.routeName: (context) => DetailQuizSiswa(),
  SoalQuizSiswa.routeName: (context) => SoalQuizSiswa(),
  PlayVideoDetailTugasSiswa.routeName: (context) => PlayVideoDetailTugasSiswa(),
  PlayVideoDetailTugas.routeName: (context) => PlayVideoDetailTugas(),
  SiswaScreen.routeName: (context) => SiswaScreen(),
  MataPelajaranLiatNilai.routeName: (context) => MataPelajaranLiatNilai(),
  LihatNilaiSiswa.routeName: (context) => LihatNilaiSiswa(),
  MataPelajaranLiatAbsen.routeName: (context) => MataPelajaranLiatAbsen(),
  DetailAbsenSiswa.routeName: (context) => DetailAbsenSiswa(),
  JadwalKelasSiswa.routeName: (context) => JadwalKelasSiswa(),
  DetailAbsenSiswaPerTanggal.routeName: (context) =>
      DetailAbsenSiswaPerTanggal(),
  HomeSiswa.routeName: (context) => HomeSiswa(),
  ProfileSiswaScreen.routeName: (context) => ProfileSiswaScreen(),
  MenuPembelajaranSiswa.routeName: (context) => MenuPembelajaranSiswa(),
  SubMenuBahanajarSiswa.routeName: (context) => SubMenuBahanajarSiswa(),
  BahanMengajarSiswa.routeName: (context) => BahanMengajarSiswa(),
  SubMenuTugasSiswa.routeName: (context) => SubMenuTugasSiswa(),
  MenuTugasSiswa.routeName: (context) => MenuTugasSiswa(),
  DetailTugasSiswa.routeName: (context) => DetailTugasSiswa(),
  SoalTugasSiswa.routeName: (context) => SoalTugasSiswa(),
  DetailPengumumanSiswa.routeName: (context) => DetailPengumumanSiswa(),
  PlayVideoSiswa.routeName: (context) => PlayVideoSiswa(),
  DetailProfileSiswaScreen.routeName: (context) => const DetailProfileSiswaScreen(),
  PlayVideoDetailQuiz.routeName: (context) => PlayVideoDetailQuiz(),
  DetailProfileGuruScreen.routeName: (context) => DetailProfileGuruScreen(),
  DetailNilaiSiswaScrenn.routeName: (context) => DetailNilaiSiswaScrenn(),
  Onboarding.routerName: (context) => Onboarding(),
  SuccessOnboarding.routeName: (context) => SuccessOnboarding(),
  MenuKeuanganScreens.routeName: (context) => MenuKeuanganScreens(),
  TagihanScreens.routeName: (context) => TagihanScreens(),
  DetailTagihanScreens.routeName: (context) => DetailTagihanScreens(),
  HistoryScreens.routeName: (context) => HistoryScreens(),
  DetailHistoryScreens.routeName: (context) => DetailHistoryScreens(),
  RekapPembayaranScreens.routeName: (context) => RekapPembayaranScreens(),
  DetailRekapScreens.routeName: (context) => DetailRekapScreens(),
  PilihMetodePembayaran.routeName: (context) => PilihMetodePembayaran(),
  KesiswaanScreen.routeName: (context) => const KesiswaanScreen(),
  MenuPelanggaran.routeName: (context) => const MenuPelanggaran(),
  DetailPelanggaran.routeName: (context) => const DetailPelanggaran(),
  HomeWaliMurid.routeName: (context) => const HomeWaliMurid(),
  WaliMuridScreen.routeName: (context) => const WaliMuridScreen(),
  DetailPengumumanSiswaWaliMurid.routeName: (context) => const DetailPengumumanSiswaWaliMurid(),
  JadwalPelajaranSiswaWaliMurid.routeName: (context) => JadwalPelajaranSiswaWaliMurid(),
  WaliMuridDetailHistoryScreens.routeName: (context) => const WaliMuridDetailHistoryScreens(),
  WaliMuridDetailRekapScreens.routeName: (context) => const WaliMuridDetailRekapScreens(),
  WaliMuridDetailTagihanScreens.routeName: (context) => const WaliMuridDetailTagihanScreens(),
  WaliMuridHistoryScreens.routeName: (context) => const WaliMuridHistoryScreens(),
  WaliMuridMenuKeuanganScreens.routeName: (context) => const WaliMuridMenuKeuanganScreens(),
  WaliMuridPilihMetodePembayaran.routeName: (context) => const WaliMuridPilihMetodePembayaran(),
  WaliMuridRekapPembayaranScreens.routeName: (context) => const WaliMuridRekapPembayaranScreens(),
  WaliMuridTagihanScreens.routeName: (context) => const WaliMuridTagihanScreens(),
  WaliMuridMenuPembelajaranSiswa.routeName: (context) => const WaliMuridMenuPembelajaranSiswa(),
  WaliMuridDetailProfileSiswaScreen.routeName: (context) => const WaliMuridDetailProfileSiswaScreen(),
  ProfileWaliMuridScreen.routeName: (context) => const ProfileWaliMuridScreen(),
  WaliMuridUbahPassword.routeName: (context) => const WaliMuridUbahPassword(),
  SubMenuBahanajarSiswaWaliMurid.routeName: (context) => const SubMenuBahanajarSiswaWaliMurid(),
  PlayVideoSiswaWaliMurid.routeName: (context) => const PlayVideoSiswaWaliMurid(),
  WaliMuridBahanMengajarSiswa.routeName: (context) => const WaliMuridBahanMengajarSiswa(),
  JadwalKelasSiswaWaliMurid.routeName: (context) => const JadwalKelasSiswaWaliMurid(),
  WaliMuridSubMenuKesiswaan.routeName: (context) => const WaliMuridSubMenuKesiswaan(),
  WaliMuridMenuPelanggaran.routeName: (context) => const WaliMuridMenuPelanggaran(),
  WaliMuridDetailPelanggaran.routeName: (context) => const WaliMuridDetailPelanggaran(),
  WaliMuridLihatNilaiSiswa.routeName: (context) => const WaliMuridLihatNilaiSiswa(),
  WaliMuridMataPelajaranLiatNilai.routeName: (context) => const WaliMuridMataPelajaranLiatNilai(),
  WaliMuridDetailNilaiSiswaScrenn.routeName: (context) => const WaliMuridDetailNilaiSiswaScrenn(),
  WaliMuridDetailAbsenSiswa.routeName: (context) => const WaliMuridDetailAbsenSiswa(),
  WaliMuridDetailAbsenSiswaPerTanggal.routeName: (context) => const WaliMuridDetailAbsenSiswaPerTanggal(),
  WaliMuridMataPelajaranLiatAbsen.routeName: (context) => const WaliMuridMataPelajaranLiatAbsen(),
  WaliMuridSubMenuQuizSiswa.routeName: (context) => const WaliMuridSubMenuQuizSiswa(),
  WaliMuridDetailQuizSiswa.routeName: (context) => const WaliMuridDetailQuizSiswa(),
  WaliMuridMenuQuizSiswa.routeName: (context) => const WaliMuridMenuQuizSiswa(),
  WaliMuridSoalQuizSiswa.routeName: (context) => const WaliMuridSoalQuizSiswa(),
  WaliMuridSubMenuTugasSiswa.routeName: (context) => const WaliMuridSubMenuTugasSiswa(),
  WaliMuridSoalTugasSiswa.routeName: (context) => const WaliMuridSoalTugasSiswa(),
  WaliMuridMenuTugasSiswa.routeName: (context) => const WaliMuridMenuTugasSiswa(),
  WaliMuridDetailTugasSiswa.routeName: (context) => const WaliMuridDetailTugasSiswa(),
  WaliMuridPlayVideoDetailTugasSiswa.routeName: (context) => const WaliMuridPlayVideoDetailTugasSiswa(),
  
};
