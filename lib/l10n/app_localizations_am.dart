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
  String get comingSoon => 'በቅርብ ቀን';

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
  String get navBrowse => 'መፈለጊያ';

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
  String get selectIndustries => 'ኢንዱስትሪዎችን ይምረጡ';

  @override
  String get chooseSectorsAlerts =>
      'ማንቂያዎችን ማግኘት የሚፈልጉባቸውን ዘርፎች ይምረጡ። አዳዲስ ጨረታዎች ከነዚህ ምድቦች ጋር ሲዛመዱ ማሳወቂያ ይደርስዎታል።';

  @override
  String get saveChanges => 'ለውጦችን አስቀምጥ';

  @override
  String get alertPreferencesUpdated => 'የማንቂያ ምርጫዎች ተዘምነዋል';

  @override
  String errorSavingPreferences(String error) {
    return 'ምርጫዎችን በማስቀመጥ ላይ ስህተት ተከስቷል፡ $error';
  }

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

  @override
  String get membershipPlan => 'የአባልነት ዕቅድ';

  @override
  String get currentStatus => 'የአሁኑ ሁኔታ';

  @override
  String get annualPremiumAccess => 'የዓመታዊ ፕሪሚየም መዳረሻ';

  @override
  String validUntil(String date) {
    return 'እስከ $date ድረስ ያገለግላል';
  }

  @override
  String get upgradeOrChangePlan => 'ዕቅድን ያሻሽሉ ወይም ይቀይሩ';

  @override
  String get updateBusinessProfile => 'የንግድ መገለጫን ያዘምኑ';

  @override
  String get updateBusinessProfileSubtitle => 'ምርጫዎችዎን እና ተዛማጆችን ያስተካክሉ';

  @override
  String get teamManagementSubtitle => 'የድርጅት መዳረሻን ያስተዳድሩ';

  @override
  String get noSectorsSelected => 'ምንም ዘርፎች አልተመረጡም';

  @override
  String get loading => 'በመጫን ላይ...';

  @override
  String get catConsultancy => 'የምክር አገልግሎት';

  @override
  String get catNonConsultancy => 'ከምክር ውጭ አገልግሎት';

  @override
  String get catAgriculture => 'እርሻ';

  @override
  String get catEducation => 'ትምህርት';

  @override
  String get catFinance => 'ፋይናንስ እና መድህን';

  @override
  String get catTransport => 'ትራንስፖርት';

  @override
  String get catManufacturing => 'ማኑፋክቸሪንግ';

  @override
  String get catHotel => 'ሆቴል እና አገልግሎቶች';

  @override
  String get catCleaning => 'ጽዳት እና ጥበቃ';

  @override
  String get supplier => 'አቅራቢ';

  @override
  String get contractor => 'ተቋራጭ';

  @override
  String get consultant => 'አማካሪ';

  @override
  String get generalTrading => 'ጠቅላላ ንግድ';

  @override
  String get service => 'አገልግሎት';

  @override
  String grade(String grade) {
    return 'ደረጃ $grade';
  }

  @override
  String get na => 'አይመለከትም';

  @override
  String get ministries => 'ሚኒስቴር መስሪያ ቤቶች';

  @override
  String get universities => 'ዩኒቨርሲቲዎች';

  @override
  String get ngos => 'መንግስታዊ ያልሆኑ ድርጅቶች (NGOs)';

  @override
  String get soes => 'የመንግስት የልማት ድርጅቶች';

  @override
  String get addisAbaba => 'አዲስ አበባ';

  @override
  String get oromia => 'ኦሮሚያ';

  @override
  String get amhara => 'አማራ';

  @override
  String get nationwide => 'ሀገር አቀፍ';

  @override
  String get profileSetupTitle => 'መገለጫ አዋቅር';

  @override
  String get skip => 'ዝለል';

  @override
  String get profileUpdatedSyncing => 'መገለጫ ተዘምኗል! የእርስዎ ዝርዝር እየተመሳሰለ ነው...';

  @override
  String profileUpdateError(String error) {
    return 'መገለጫ በማዘመን ላይ ስህተት፡ $error';
  }

  @override
  String get back => 'ተመለስ';

  @override
  String get next => 'ቀጣይ';

  @override
  String get finish => 'ጨርስ';

  @override
  String get businessBasicsTitle => 'የንግድ መሠረታዊ ነገሮች';

  @override
  String get businessBasicsSubtitle => 'ትክክለኛውን ጨረታ እንድናገኝልዎ ስለ ድርጅትዎ ይንገሩን።';

  @override
  String get businessNameLabel => 'የንግድ ስም';

  @override
  String get businessNameHint => 'ለምሳሌ፡ ኢትዮ ቴክ ሶሉሽንስ';

  @override
  String get businessTypeLabel => 'የንግድ ዓይነት';

  @override
  String get primarySectorLabel => 'ዋና ዘርፍ (ሁሉንም የሚመለከታቸውን ይምረጡ)';

  @override
  String get primarySectorSubtitle => 'ይህንን የምንጠቀመው ማሸነፍ የሚችሉትን ጨረታ ለመምከር ነው።';

  @override
  String get legalLicenseTitle => 'የህግ እና ፈቃድ መረጃ';

  @override
  String get legalLicenseSubtitle => 'ብቁነትዎን ለማረጋገጥ ያግዙን።';

  @override
  String get tradeLicenseCategoryLabel => 'የንግድ ፈቃድ ምድብ';

  @override
  String get licenseGradeLabel => 'የፈቃድ ደረጃ (የሚመለከተው ከሆነ)';

  @override
  String get vatRegisteredLabel => 'ተጨማሪ እሴት ታክስ ተመዝጋቢ?';

  @override
  String get yes => 'አዎ';

  @override
  String get no => 'አይ';

  @override
  String get taxComplianceDeclaration => 'የግብር ተገዢነት ሁኔታዬ ወቅታዊ መሆኑን አረጋግጣለሁ።';

  @override
  String get taxComplianceSubtitle => 'በእምነት ላይ የተመሰረተ መግለጫ።';

  @override
  String get targetInstitutionsTitle => 'የታለመላቸው ተቋማት እና ክልሎች';

  @override
  String get targetInstitutionsSubtitle => 'በጣም ጠቃሚ ማሳወቂያዎች፣ ያነሰ አይፈለጌ መልዕክት።';

  @override
  String get preferredInstitutionsLabel => 'ተመራጭ ተቋማት';

  @override
  String get operatingRegionsLabel => 'የስራ ክልሎች';

  @override
  String get alertPreferencesTitle => 'የማንቂያ ምርጫዎች';

  @override
  String get alertPreferencesSubtitle => 'ተጠቃሚዎች ድምጽን ቀድመው እንዲቆጣጠሩ ያድርጉ።';

  @override
  String get alertMatchingTender => 'ተዛማጅ ጨረታ ታትሟል';

  @override
  String get alertMatchingTenderSubtitle => 'ጨረታ ከመገለጫዬ ጋር ሲዛመድ አሳውቀኝ';

  @override
  String get alertFavoriteInstitution => 'ተወዳጅ ተቋም ልጥፎች';

  @override
  String get alertFavoriteInstitutionSubtitle => 'የምርጫ ተቋሞቼ ሲለጥፉ አሳውቀኝ';

  @override
  String get alertDeadlineApproaching => 'የማብቂያ ቀን እየቀረበ ነው';

  @override
  String get alertDeadlineApproachingSubtitle => 'ከማብቂያው 48 ሰዓት በፊት አሳውቀኝ';

  @override
  String get alertCompetitorWins => 'ተወዳዳሪ አሸንፏል';

  @override
  String get alertCompetitorWinsSubtitle => 'ተወዳዳሪ ተመሳሳይ ጨረታ ሲያሸንፍ አሳውቀኝ';

  @override
  String get profileReadyToSyncTitle => 'መገለጫ ለማመሳሰል ዝግጁ ነው';

  @override
  String get profileReadyToSyncSubtitle =>
      'ምርጫዎችዎ ጨረታዎችን ለማጣራት እና ለመምከር ያገለግላሉ።';

  @override
  String get personalizedTenderFeed => 'የተበጀ የጨረታ ዝርዝር';

  @override
  String get customizedAlerts => 'የተበጁ ማንቂያዎች';

  @override
  String get sectorSpecificMatching => 'ዘርፍ-ተኮር ማዛመድ';

  @override
  String get configurationStatusComplete => 'የማዋቀር ሁኔታ፡ ተጠናቅቋል';

  @override
  String get saveAndUpdateFeed => 'አስቀምጥ እና ዝርዝሬን አዘምን';

  @override
  String get previewMatchesLabel => 'ለዘርፍዎ ተዛማጅ ቅድመ እይታ፡';

  @override
  String get previewTenderTitle => 'የቢሮ ዕቃዎች ግዥ';

  @override
  String get previewTenderSubtitle => 'ትምህርት ሚኒስቴር • 2 ቀናት ቀርተዋል';

  @override
  String get filterByCategory => 'በምድብ አጣራ';

  @override
  String get reset => 'ዳግም አስጀምር';

  @override
  String get clearAllFilters => 'ሁሉንም ማጣሪያዎች አጽዳ';

  @override
  String get failedToLoadTenders => 'ጨረታዎችን መጫን አልተቻለም';

  @override
  String get retry => 'እንደገና ይሞክሩ';

  @override
  String get tenderBookmarkUpdated => 'የጨረታ ዕልባት ተዘምኗል';

  @override
  String errorWithCount(String error) {
    return 'ስህተት፡ $error';
  }

  @override
  String get summaryTitle => 'ማጠቃለያ';

  @override
  String get organizationLabel => 'ድርጅት';

  @override
  String get projectLabel => 'ፕሮጀክት';

  @override
  String get deadlineLabel => 'የማብቂያ ቀን';

  @override
  String get bidBondLabel => 'የጨረታ ማስያዣ';

  @override
  String get notSpecified => 'አልተገለጸም';

  @override
  String get eligibilityLabel => 'ብቁነት';

  @override
  String get unknown => 'ያልታወቀ';

  @override
  String get descriptionTitle => 'መግለጫ';

  @override
  String get noDescriptionAvailable => 'ለዚህ ጨረታ ምንም መግለጫ የለም።';

  @override
  String get historicalWinningPrices => 'ታሪካዊ የማሸነፊያ ዋጋዎች';

  @override
  String get unlockMarketInsights => 'ለተመሳሳይ ጨረታዎች\nየገበያ ግንዛቤዎችን ይክፈቱ';

  @override
  String get saved => 'ተቀምጧል';

  @override
  String get save => 'አስቀምጥ';

  @override
  String get alertsSetForTender => 'ለዚህ ጨረታ ማንቂያዎች ተዘጋጅተዋል';

  @override
  String get alertsDisabled => 'ማንቂያዎች ተሰናክለዋል';

  @override
  String get pleaseLoginToSeeSaved => 'የተቀመጡ ጨረታዎችን ለማየት እባክዎ ይግቡ';

  @override
  String get noSavedTendersYet => 'እስካሁን ምንም የተቀመጠ ጨረታ የለም';

  @override
  String noItemsIn(String title) {
    return 'በ$title ውስጥ ምንም ንጥል የለም';
  }

  @override
  String get aiSummaryTitle => 'የ AI ማጠቃለያ';

  @override
  String get generateSummary => 'ማጠቃለያ አመንጭ';

  @override
  String get generatingSummary => 'በማመንጨት ላይ...';

  @override
  String get aiSummaryDisclaimer =>
      'በ AI የተመነጨ ማጠቃለያ። እባክዎ ለተሟላ ዝርዝር ኦፊሴላዊ ሰነዶችን ይመልከቱ።';

  @override
  String get aiSummaryError => 'ማጠቃለያውን ማመንጨት አልተቻለም።';

  @override
  String get activePlan => 'ንቁ ዕቅድ';

  @override
  String get active => 'ንቁ';

  @override
  String get seatAllocation => 'የመቀመጫ ድልድል';

  @override
  String get used => 'ጥቅም ላይ የዋለ';

  @override
  String renewsOn(String date) {
    return 'በ$date ይታደሳል';
  }

  @override
  String get upgradeOrRenew => 'ያሻሽሉ ወይም ያድሱ';

  @override
  String get teamMembers => 'የቡድን አባላት';

  @override
  String manageAccessSlots(int count) {
    return 'ለ$count የድርጅት ቦታዎችዎ መዳረሻን ያስተዳድሩ';
  }

  @override
  String slotAvailable(int count) {
    return 'ቦታ $count፡ ክፍት ነው';
  }

  @override
  String get inviteViaEmailPhone => 'በኢሜይል ወይም በስልክ ቁጥር ይጋብዙ';

  @override
  String get emailPhoneHint => 'ኢሜይል ወይም +251...';

  @override
  String inviteSentTo(String text) {
    return 'ግብዣ ወደ $text ተልኳል';
  }

  @override
  String get enterEmailPhoneError => 'እባክዎ ኢሜይል ወይም ስልክ ቁጥር ያስገቡ';

  @override
  String get invite => 'ጋብዝ';

  @override
  String get email => 'ኢሜይል';

  @override
  String get phoneWithPrefix => 'ስልክ (+251)';

  @override
  String get inviteThirdMember => 'ሶስተኛ የቡድን አባል ይጋብዙ';

  @override
  String get add => 'ጨምር';

  @override
  String get slot3Config => 'የቦታ 3 ውቅር';

  @override
  String get pendingStatus => 'በጥበቃ ላይ ያለ ሁኔታ';

  @override
  String get invitePending => 'ግብዣ በጥበቃ ላይ';

  @override
  String get invitationResent => 'ግብዣው እንደገና ተልኳል';

  @override
  String get resend => 'እንደገና ላክ';

  @override
  String get invitationCancelled => 'ግብዣው ተሰርዟል';

  @override
  String get cancel => 'ሰርዝ';

  @override
  String get collaborativeTendering => 'የትብብር ጨረታ';

  @override
  String get collaborativeTenderingDesc =>
      'የቡድን አባላት የእርስዎን የድርጅት OCR ኮታ (በወር 500 ገጾች) ይጋራሉ እና በእውነተኛ ጊዜ ለጨረታ ተሳትፎ አስተዋፅኦ ማድረግ ይችላሉ።';

  @override
  String get ethiopianMarketEnterprise => 'የኢትዮጵያ ገበያ ድርጅት';

  @override
  String get teamManagementTitle => 'የቡድን አስተዳደር';

  @override
  String get membership => 'አባልነት';

  @override
  String get corporate => 'ድርጅታዊ';

  @override
  String get personal => 'ግል';

  @override
  String pricePerYear(String price) {
    return '$price ብር / በዓመት';
  }

  @override
  String pricePer6Mo(String price) {
    return '$price ብር / ለ6 ወር';
  }

  @override
  String pricePer3Mo(String price) {
    return '$price ብር / ለ3 ወር';
  }

  @override
  String get oneYearPremiumAccess => 'የ1 ዓመት ፕሪሚየም መዳረሻ';

  @override
  String get bestValue => 'ምርጥ ዋጋ';

  @override
  String get realTimeAlerts => 'የእውነተኛ ጊዜ ማንቂያዎች';

  @override
  String get sixMonthsPro => 'የ6 ወራት ፕሮ';

  @override
  String get threeMonthsBasic => 'የ3 ወራት መሠረታዊ';

  @override
  String get enterpriseAnnual => 'የድርጅት ዓመታዊ';

  @override
  String get threeUserLicenses => 'የ3 ተጠቃሚዎች ፈቃድ';

  @override
  String get multiUserDashboard => 'የብዙ ተጠቃሚዎች ዳሽቦርድ';

  @override
  String get business6Month => 'ቢዝነስ 6 ወር';

  @override
  String get businessQuarterly => 'ቢዝነስ በየሶስት ወሩ';

  @override
  String get payWithTelebirrChapa => 'በቴሌብር / ቻፓ ይክፈሉ';

  @override
  String get subscriptionTerms =>
      'በመመዝገብዎ በአገልግሎት ውላችን ይስማማሉ። ደህንነቱ የተጠበቀ ክፍያ።';

  @override
  String get completePayment => 'ክፍያውን ያጠናቅቁ';

  @override
  String get userNotLoggedIn => 'ተጠቃሚ አልገባም። ለመቀጠል እባክዎ ይግቡ።';

  @override
  String get redirectingToChapa => 'ወደ ቻፓ በማዛወር ላይ...';

  @override
  String get couldNotLaunchPayment => 'የክፍያ አገናኙን መክፈት አልተቻለም';

  @override
  String get payNowWithChapa => 'አሁን በቻፓ ይክፈሉ';

  @override
  String get paymentSuccessful => 'ክፍያው ተሳክቷል!';

  @override
  String get subscriptionActivated =>
      'አባልነትዎ ነቅቷል። አሁን ሁሉንም የፕሪሚየም አገልግሎቶች ማግኘት ይችላሉ።';

  @override
  String get goToDashboard => 'ወደ ዳሽቦርድ ይሂዱ';
}
