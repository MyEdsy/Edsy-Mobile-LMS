import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:school_apps/size_config.dart';

/*
garis: #87CEFA
Background biru: #1C305C
Tulisan font EDSY: #1C305C
 */

const kPrimaryColor = Color(0xFF1C305C);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kColorTeal = Color(0xFF008080);
const kColorTealSlow = Color(0xFF159897);
const kColorTealToSlow = Color(0xFF03c0c1);
const kColorBlue = Color(0xFF3EB2FF);
const kColorGreen = Color(0xFF00FCA6);
const kColorRedSlow = Color(0xFFf55f60);
const kColorYellow = Color(0xFFFFC654);

const mBackgroundColor = Color(0xFFFAFAFA);
const mBlueColor = Color(0xFF2C53B1);
const mGreyColor = Color(0xFFC5C5C5);
const mTitleColor = Color(0xFF23374D);
const mSubtitleColor = Color(0xFF8E8E8E);
const mBorderColor = Color(0xFFE8E8F3);
const mFillColor = Color(0xFFFFFFFF);
const mCardTitleColor = Color(0xFF2E4ECF);
const mCardSubtitleColor = mTitleColor;

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kUsernameNullError = "Please Enter your username";
const String kKategoryNullError = "Please Enter your category";
const String kJudulBahanyNullError = "Judul bahan ajar tidak boleh kosong";
const String kKeteranganNullError = "Keterangan tidak boleh kosong";
const String kPersentaseBobotNullError = "Please Enter your weight percentage";
const String kInvalidUsernameError = "Please Enter Valid username";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  fillColor: kPrimaryColor,
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

// Style for title
var mTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mTitleColor, fontSize: 14);

var mTitleStyleColorWhite = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mFillColor, fontSize: 12);

var mTitleStyle16 = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: mTitleColor, fontSize: 16);

var mTitleStyleColorTeal = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: kColorTeal, fontSize: 10);

var mTitleStyleColorRed = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: kColorRedSlow, fontSize: 10);

// Style for title Name
var mTitleStyleNameApps = GoogleFonts.inter(
  fontWeight: FontWeight.bold,
  color: mTitleColor,
  fontSize: 18,
);

var mTitleStyletugas = GoogleFonts.inter(
  fontWeight: FontWeight.bold,
  color: mTitleColor,
  fontSize: 12,
);

// Style for Discount Section
var mMoreDiscountStyle = GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w700, color: mBlueColor);

// Style for Service Section
var mServiceTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, fontSize: 12, color: mTitleColor);

var mServiceTitleStyleBold = GoogleFonts.inter(
    fontWeight: FontWeight.bold, fontSize: 12, color: mTitleColor);

var mServiceSubtitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 10, color: mSubtitleColor);

var mServiceSubtitleStyle12 = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 12, color: mSubtitleColor);

var mServiceSeeAll = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 12, color: mSubtitleColor);

// Style for Popular Destination Section
var mPopularDestinationTitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: mCardTitleColor,
);
var mPopularDestinationSubtitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 10,
  color: mCardSubtitleColor,
);

// Style for Travlog Section
var mTravlogTitleStyle = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w900, color: mFillColor);
var mTravlogContentStyle = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: mTitleColor);
var mTravlogPlaceStyle = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: mBlueColor);

DateTime _parseDateStr(String inputString) {
  DateFormat format = DateFormat.yMMMMd();
  return format.parse(inputString);
}

parseDateIndo(tanggal) {
  initializeDateFormatting('id_ID', null);
  var dateValue =
      new DateFormat("yyyy-MM-ddTHH:mm:ssZ", "id_ID").parseUTC(tanggal);
  String formattedDate =
      DateFormat("dd MMM yyyy - HH:mm", "id_ID").format(dateValue);

  return formattedDate;
}

nameDay(data) {
  initializeDateFormatting('id_ID', null);
  var nameDate = new DateFormat('EEEE', "id_ID").format(data);
  // String formattedDate =
  // DateFormat("EEEE").format(dateValue);
  return nameDate;
}

parseDateIndoFullNameMount(tanggal) {
  initializeDateFormatting('id_ID', null);
  print(tanggal);
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ", "id_ID").parseUTC(tanggal);
  print(dateValue);
  String formattedDate =
      DateFormat("dd MMMM yyyy - HH:mm", "id_ID").format(dateValue);

  return formattedDate;
}

parseDate(tanggal) {
  initializeDateFormatting('id_ID', null);
  var dateValue =
      new DateFormat("yyyy-MMMM-ddTHH:mm:ssZ", "id_ID").parseUTC(tanggal);
  String formattedDate =
      DateFormat("dd-mm-yyyy HH:mm", "id_ID").format(dateValue);

  return formattedDate;
}

bulanIndo(kodeBulan) {
  var bulan = '';
  if(kodeBulan == '1') {
    bulan = 'Januari';
  }else if(kodeBulan == '2') {
    bulan = 'Februari';
  }else if(kodeBulan == '3') {
    bulan = 'Maret';
  }else if(kodeBulan == '4') {
    bulan = 'April';
  }else if(kodeBulan == '5') {
    bulan = 'Mei';
  }else if(kodeBulan == '6') {
    bulan = 'Juni';
  }else if(kodeBulan == '7') {
    bulan = 'Juli';
  }else if(kodeBulan == '8') {
    bulan = 'Agustus';
  }else if(kodeBulan == '9') {
    bulan = 'September';
  }else if(kodeBulan == '10') {
    bulan = 'Oktober';
  }else if(kodeBulan == '11') {
    bulan = 'November';
  }else if(kodeBulan == '12') {
    bulan = 'Desember';
  }else {
    bulan = '';
  }

  return bulan;
}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

var perseDate = () {
  var today = new DateTime.now();
  var formatedTanggal = new DateFormat.MMMM().format(today);
  return formatedTanggal;
};

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}



class CustomColors {
  static const Color GreyBackground = Color.fromRGBO(249, 252, 255, 1);
  static const Color GreyBorder = Color.fromRGBO(207, 207, 207, 1);

  static const Color GreenLight = Color.fromRGBO(93, 230, 26, 1);
  static const Color GreenDark = Color.fromRGBO(57, 170, 2, 1);
  static const Color GreenIcon = Color.fromRGBO(30, 209, 2, 1);
  static const Color GreenAccent = Color.fromRGBO(30, 209, 2, 1);
  static const Color GreenShadow = Color.fromRGBO(30, 209, 2, 0.24); // 24%
  static const Color GreenBackground =
      Color.fromRGBO(181, 255, 155, 0.36); // 36%

  static const Color OrangeIcon = Color.fromRGBO(236, 108, 11, 1);
  static const Color OrangeBackground =
      Color.fromRGBO(255, 208, 155, 0.36); // 36%

  static const Color PurpleLight = Color.fromRGBO(248, 87, 195, 1);
  static const Color PurpleDark = Color.fromRGBO(224, 19, 156, 1);
  static const Color PurpleIcon = Color.fromRGBO(209, 2, 99, 1);
  static const Color PurpleAccent = Color.fromRGBO(209, 2, 99, 1);
  static const Color PurpleShadow = Color.fromRGBO(209, 2, 99, 0.27); // 27%
  static const Color PurpleBackground =
      Color.fromRGBO(255, 155, 205, 0.36); // 36%

  static const Color DeeppurlpleIcon = Color.fromRGBO(191, 0, 128, 1);
  static const Color DeeppurlpleBackground =
      Color.fromRGBO(245, 155, 255, 0.36); // 36%

  static const Color BlueLight = Color.fromRGBO(126, 182, 255, 1);
  static const Color BlueDark = Color.fromRGBO(95, 135, 231, 1);
  static const Color BlueIcon = Color.fromRGBO(9, 172, 206, 1);
  static const Color BlueBackground =
      Color.fromRGBO(155, 255, 248, 0.36); // 36%
  static const Color BlueShadow = Color.fromRGBO(104, 148, 238, 1);

  static const Color HeaderBlueLight = Color.fromRGBO(129, 199, 245, 1);
  static const Color HeaderBlueDark = Color.fromRGBO(56, 103, 213, 1);
  static const Color HeaderGreyLight =
      Color.fromRGBO(225, 255, 255, 0.31); // 31%

  static const Color YellowIcon = Color.fromRGBO(249, 194, 41, 1);
  static const Color YellowBell = Color.fromRGBO(225, 220, 0, 1);
  static const Color YellowAccent = Color.fromRGBO(255, 213, 6, 1);
  static const Color YellowShadow = Color.fromRGBO(243, 230, 37, 0.27); // 27%
  static const Color YellowBackground =
      Color.fromRGBO(255, 238, 155, 0.36); // 36%

  static const Color BellGrey = Color.fromRGBO(217, 217, 217, 1);
  static const Color BellYellow = Color.fromRGBO(255, 220, 0, 1);

  static const Color TrashRed = Color.fromRGBO(251, 54, 54, 1);
  static const Color TrashRedBackground = Color.fromRGBO(255, 207, 207, 1);

  static const Color TextHeader = Color.fromRGBO(85, 78, 143, 1);
  static const Color TextHeaderGrey = Color.fromRGBO(104, 104, 104, 1);
  static const Color TextSubHeaderGrey = Color.fromRGBO(161, 161, 161, 1);
  static const Color TextSubHeader = Color.fromRGBO(139, 135, 179, 1);
  static const Color TextBody = Color.fromRGBO(130, 160, 183, 1);
  static const Color TextGrey = Color.fromRGBO(198, 198, 200, 1);
  static const Color TextWhite = Color.fromRGBO(243, 243, 243, 1);
  static const Color HeaderCircle = Color.fromRGBO(255, 255, 255, 0.17);
}
