// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'TenderWin ኢትዮጵያ';

  @override
  String get welcomeMessage => 'ወደ TenderWin እንኳን በደህና መጡ!';

  @override
  String get welcomeBack => 'እንኳን በደህና ተመለሱ';

  @override
  String get loginSubtitle => 'ጨረታዎችን ለማግኘት ይግቡ';

  @override
  String get emailLabel => 'ኢሜይል';

  @override
  String get phoneLabel => 'ስልክ ቁጥር';

  @override
  String get usePhone => 'በስልክ ቁጥር ይጠቀሙ';

  @override
  String get useEmail => 'በኢሜይል ይጠቀሙ';

  @override
  String get sendOtp => 'OTP ላክ';

  @override
  String get verifyOtp => 'OTP አረጋግጥ';

  @override
  String get otpLabel => 'የማረጋገጫ ኮድ (OTP)';

  @override
  String get phoneHint => 'እባክዎ ስልክ ቁጥርዎን ያስገቡ';

  @override
  String get otpHint => 'እባክዎ ወደ ስልክዎ የተላከውን ኮድ ያስገቡ';

  @override
  String get phoneFormatHelper => 'ቅርጸት: +2519...';

  @override
  String get emailHint => 'እባክዎ ኢሜይልዎን ያስገቡ';

  @override
  String get passwordLabel => 'የይለፍ ቃል';

  @override
  String get passwordHint => 'እባክዎ የይለፍ ቃልዎን ያስገቡ';

  @override
  String get forgotPassword => 'የይለፍ ቃል ረሱ?';

  @override
  String get loginButton => 'ይግቡ';

  @override
  String get noAccount => 'መለያ የለዎትም?';

  @override
  String get signUpButton => 'ይመዝገቡ';

  @override
  String get createAccount => 'መለያ ይፍጠሩ';

  @override
  String get signUpSubtitle => 'ጨረታዎችን ማሸነፍ ለመጀመር ይመዝገቡ';

  @override
  String get fullNameLabel => 'ሙሉ ስም';

  @override
  String get fullNameHint => 'እባክዎ ሙሉ ስምዎን ያስገቡ';

  @override
  String get passwordHint2 => 'እባክዎ የይለፍ ቃል ያስገቡ';

  @override
  String get passwordLengthError => 'የይለፍ ቃል ቢያንስ 6 ቁምፊዎች መሆን አለበት';

  @override
  String get confirmPassword => 'የይለፍ ቃል አረጋግጥ';

  @override
  String get passwordMismatch => 'የይለፍ ቃሎች አይዛመዱም';

  @override
  String get accountCreated => 'መለያ ተፈጥሯል! እባክዎ ለማረጋገጥ ኢሜይልዎን ያረጋግጡ።';

  @override
  String get alreadyHaveAccount => 'መለያ አለዎት?';

  @override
  String get resetPasswordTitle => 'የይለፍ ቃል ዳግም አስጀምር';

  @override
  String get forgotPasswordTitle => 'የይለፍ ቃልዎን ረሱ?';

  @override
  String get forgotPasswordDesc =>
      'ኢሜይልዎን ያስገቡ እና የይለፍ ቃልዎን ዳግም ለማስጀመር አገናኝ እንልክልዎታለን።';

  @override
  String get sendResetLink => 'የመልሶ ማግኛ አገናኝ ላክ';

  @override
  String get resetLinkSent => 'የይለፍ ቃል ዳግም ማስጀመሪያ አገናኝ ወደ ኢሜይልዎ ተልኳል';

  @override
  String get tendersTitle => 'ጨረታዎች';

  @override
  String get searchHint => 'ጨረታዎችን ፈልግ / የተቃኘ ጽሑፍ...';

  @override
  String get catAll => 'ሁሉም';

  @override
  String get catConstruction => 'ኮንስትራክሽን';

  @override
  String get catIT => 'አይቲ እና ቴሌኮም';

  @override
  String get catHealth => 'ጤና';

  @override
  String get catEnergy => 'ኢነርጂ';

  @override
  String get catSupply => 'አቅርቦት';

  @override
  String hoursLeft(int count) {
    return '$count ሰዓታት ቀርተዋል';
  }

  @override
  String daysLeft(int count) {
    return '$count ቀናት ቀርተዋል';
  }

  @override
  String get proLabel => 'PRO';

  @override
  String get settingsTitle => 'ቅንብሮች';

  @override
  String get settingsComingSoon => 'ቅንብሮች እና መገለጫ (በቅርብ ቀን)';

  @override
  String get cpoRequired => 'CPO ያስፈልጋል';

  @override
  String get shareCard => 'ካርዱን አጋራ';

  @override
  String get viewDetails => 'ዝርዝሮችን ይመልከቱ';

  @override
  String endsInHours(int count) {
    return 'በ$count ሰዓታት ውስጥ ያበቃል';
  }

  @override
  String get cpoRange => '1% - 2%';

  @override
  String get cpoCalcTitle => 'CPO ማስያ';

  @override
  String get cpoCalcDesc => 'የጨረታ ማስያዣዎን (CPO) ወዲያውኑ ያስሉ።';

  @override
  String get totalBidAmount => 'ጠቅላላ የጨረታ መጠን';

  @override
  String get bidAmountHelper => 'የቅናሽዎን ጠቅላላ መጠን ያስገቡ';

  @override
  String get percentageLabel => 'በመቶኛ (%)';

  @override
  String get fixedAmountLabel => 'የተወሰነ መጠን';

  @override
  String get percentage => 'በመቶኛ';

  @override
  String get generatingCpo => 'የ CPO መጠየቂያ ደብዳቤ በማመንጨት ላይ... (በቅርብ ቀን)';

  @override
  String get generateCpoLetter => 'የባንክ CPO መጠየቂያ ደብዳቤ ይፍጠሩ';

  @override
  String get navTenders => 'ጨረታዎች';

  @override
  String get navCpo => 'CPO ማስያ';

  @override
  String get navProfile => 'መገለጫ';

  @override
  String postedAgo(Object time) {
    return '$time ተለጠፈ';
  }

  @override
  String openingDate(Object date) {
    return 'መክፈቻ: $date';
  }

  @override
  String closingDate(Object date) {
    return 'መዝጊያ: $date';
  }

  @override
  String get today => 'ዛሬ';

  @override
  String get yesterday => 'ትናንት';

  @override
  String daysAgo(Object count) {
    return 'ከ $count ቀናት በፊት';
  }

  @override
  String get noTendersFound => 'ምንም ጨረታ አልተገኘም';

  @override
  String get adjustFilters => 'እባክዎ ፍለጋዎን ወይም ማጣሪያዎችን ያስተካክሉ';

  @override
  String get drawerAllTenders => 'ሁሉም ጨረታዎች';

  @override
  String get drawerMyTenders => 'የእኔ ጨረታዎች';

  @override
  String get drawerFreeTenders => 'ነፃ ጨረታዎች';

  @override
  String get drawerSavedTenders => 'የተቀመጡ ጨረታዎች';

  @override
  String get drawerUnread => 'ያልተነበቡ';

  @override
  String get drawerTrashed => 'የተጣሉ';

  @override
  String get drawerSettings => 'ቅንብሮች';

  @override
  String get drawerAbout => 'ስለ እኛ';

  @override
  String get drawerHelp => 'እርዳታ';

  @override
  String get proMember => 'ፕሮ አባል';

  @override
  String get locationET => '• አዲስ አበባ, ኢትዮጵያ';

  @override
  String get walletSection => 'የኪስ ቦርሳ እና ክፍያዎች';

  @override
  String get availableBalance => 'ያለዎት ቀሪ ሂሳብ';

  @override
  String get topUp => 'ሂሳብ ይሙሉ';

  @override
  String get preferences => 'ምርጫዎች';

  @override
  String get langPreference => 'የቋንቋ ምርጫ';

  @override
  String get industryAlerts => 'የኢንዱስትሪ ማንቂያዎች';

  @override
  String get industries => 'ኮንስትራክሽን፣ አይቲ፣ ሎጂስቲክስ';

  @override
  String get helpSupport => 'እርዳታ እና ድጋፍ';

  @override
  String get ocrScanningTitle => 'የ OCR ቅኝትን እንዴት መጠቀም እንደሚቻል';

  @override
  String get ocrScanningDesc => 'የወረቀት ጨረታዎችን ወዲያውኑ ወደ ዲጂታል መረጃ ይቀይሩ።';

  @override
  String get faq => 'ተደጋጋሚ ጥያቄዎች';

  @override
  String get contactSupport => 'የደንበኞች ድጋፍን ያግኙ';

  @override
  String get logout => 'ከመለያ ይውጡ';

  @override
  String get appVersion => 'TenderEthiopia v2.4.0 (Build 88)';
}
