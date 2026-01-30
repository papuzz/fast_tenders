// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TenderWin Ethiopia';

  @override
  String get welcomeMessage => 'Welcome to TenderWin!';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get loginSubtitle => 'Login to access your tenders';

  @override
  String get emailLabel => 'Email';

  @override
  String get phoneLabel => 'Phone Number';

  @override
  String get usePhone => 'Use Phone Number';

  @override
  String get useEmail => 'Use Email';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get otpLabel => 'OTP Code';

  @override
  String get phoneHint => 'Please enter your phone number';

  @override
  String get otpHint => 'Please enter the code sent to your phone';

  @override
  String get phoneFormatHelper => 'Format: +2519...';

  @override
  String get emailHint => 'Please enter your email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'Please enter your password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginButton => 'Login';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get signUpSubtitle => 'Sign up to start winning tenders';

  @override
  String get fullNameLabel => 'Full Name';

  @override
  String get fullNameHint => 'Please enter your full name';

  @override
  String get passwordHint2 => 'Please enter a password';

  @override
  String get passwordLengthError => 'Password must be at least 6 characters';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get accountCreated =>
      'Account created! Please check your email for confirmation.';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get forgotPasswordTitle => 'Forgot your password?';

  @override
  String get forgotPasswordDesc =>
      'Enter your email address and we will send you a link to reset your password.';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get resetLinkSent => 'Password reset link sent to your email';

  @override
  String get tendersTitle => 'Tenders';

  @override
  String get searchHint => 'Search tenders / scanned text...';

  @override
  String get catAll => 'All';

  @override
  String get catConstruction => 'Construction';

  @override
  String get catIT => 'IT & Telecom';

  @override
  String get catHealth => 'Health';

  @override
  String get catEnergy => 'Energy';

  @override
  String get catSupply => 'Supply';

  @override
  String hoursLeft(int count) {
    return '$count Hours Left';
  }

  @override
  String daysLeft(int count) {
    return '$count Days Left';
  }

  @override
  String get proLabel => 'PRO';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsComingSoon => 'Settings & Profile (Coming Soon)';

  @override
  String get cpoRequired => 'CPO REQUIRED';

  @override
  String get shareCard => 'Share Card';

  @override
  String get viewDetails => 'View Details';

  @override
  String endsInHours(int count) {
    return 'Ends in ${count}h';
  }

  @override
  String get cpoRange => '1% - 2%';

  @override
  String get cpoCalcTitle => 'CPO Calculator';

  @override
  String get cpoCalcDesc => 'Calculate your Bid Bond (CPO) instantly.';

  @override
  String get totalBidAmount => 'Total Bid Amount';

  @override
  String get bidAmountHelper => 'Enter the total amount of your offer';

  @override
  String get percentageLabel => 'Percentage (%)';

  @override
  String get fixedAmountLabel => 'Fixed Amount';

  @override
  String get percentage => 'Percentage';

  @override
  String get generatingCpo => 'Generating CPO Request Letter... (Coming Soon)';

  @override
  String get generateCpoLetter => 'Generate Bank CPO Request Letter';

  @override
  String get navTenders => 'Tenders';

  @override
  String get navBrowse => 'Browse';

  @override
  String get navCpo => 'CPO Calc';

  @override
  String get navProfile => 'Profile';

  @override
  String postedAgo(Object time) {
    return 'Posted $time';
  }

  @override
  String openingDate(Object date) {
    return 'Opening: $date';
  }

  @override
  String closingDate(Object date) {
    return 'Closing: $date';
  }

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String daysAgo(Object count) {
    return '$count days ago';
  }

  @override
  String get noTendersFound => 'No tenders found';

  @override
  String get adjustFilters => 'Try adjusting your search or filters';

  @override
  String get drawerAllTenders => 'All Tenders';

  @override
  String get drawerMyTenders => 'My Tenders';

  @override
  String get drawerFreeTenders => 'Free Tenders';

  @override
  String get drawerSavedTenders => 'Saved Tenders';

  @override
  String get drawerUnread => 'Unread';

  @override
  String get drawerTrashed => 'Trashed';

  @override
  String get drawerSettings => 'Settings';

  @override
  String get drawerAbout => 'About';

  @override
  String get drawerHelp => 'Help';

  @override
  String get proMember => 'PRO MEMBER';

  @override
  String get locationET => '• Addis Ababa, ET';

  @override
  String get walletSection => 'Wallet & Payments';

  @override
  String get availableBalance => 'AVAILABLE BALANCE';

  @override
  String get topUp => 'Top Up';

  @override
  String get preferences => 'Preferences';

  @override
  String get langPreference => 'Language Preference';

  @override
  String get industryAlerts => 'Industry Alerts';

  @override
  String get industries => 'Construction, IT, Logistics';

  @override
  String get helpSupport => 'Help & Support';

  @override
  String get ocrScanningTitle => 'How to use OCR Scanning';

  @override
  String get ocrScanningDesc =>
      'Convert paper tenders to digital data instantly.';

  @override
  String get faq => 'Frequently Asked Questions';

  @override
  String get contactSupport => 'Contact Customer Support';

  @override
  String get logout => 'Logout Account';

  @override
  String get appVersion => 'TenderEthiopia v2.4.0 (Build 88)';

  @override
  String get profileSetupTitle => 'Setup Profile';

  @override
  String get skip => 'Skip';

  @override
  String get profileUpdatedSyncing =>
      'Profile Updated! Your feed is syncing...';

  @override
  String profileUpdateError(String error) {
    return 'Error updating profile: $error';
  }

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get finish => 'Finish';

  @override
  String get businessBasicsTitle => 'Business Basics';

  @override
  String get businessBasicsSubtitle =>
      'Tell us about your company so we can find the right tenders.';

  @override
  String get businessNameLabel => 'Business Name';

  @override
  String get businessNameHint => 'e.g., Ethio Tech Solutions';

  @override
  String get businessTypeLabel => 'Business Type';

  @override
  String get primarySectorLabel => 'Primary Sector (Select all that apply)';

  @override
  String get primarySectorSubtitle =>
      'We use this to recommend tenders you can actually win.';

  @override
  String get legalLicenseTitle => 'Legal & License Info';

  @override
  String get legalLicenseSubtitle => 'Help us verify your eligibility.';

  @override
  String get tradeLicenseCategoryLabel => 'Trade License Category';

  @override
  String get licenseGradeLabel => 'License Grade (if applicable)';

  @override
  String get vatRegisteredLabel => 'VAT Registered?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get taxComplianceDeclaration =>
      'I declare my tax compliance status is up to date.';

  @override
  String get taxComplianceSubtitle => 'Trust-based declaration.';

  @override
  String get targetInstitutionsTitle => 'Target Institutions & Regions';

  @override
  String get targetInstitutionsSubtitle =>
      'Hyper-relevant notifications, less spam.';

  @override
  String get preferredInstitutionsLabel => 'Preferred Institutions';

  @override
  String get operatingRegionsLabel => 'Operating Regions';

  @override
  String get alertPreferencesTitle => 'Alert Preferences';

  @override
  String get alertPreferencesSubtitle => 'Let users control noise early.';

  @override
  String get alertMatchingTender => 'Matching tender published';

  @override
  String get alertMatchingTenderSubtitle =>
      'Notify me when a tender matches my profile';

  @override
  String get alertFavoriteInstitution => 'Favorite institution posts';

  @override
  String get alertFavoriteInstitutionSubtitle =>
      'Notify me when my preferred institutions post';

  @override
  String get alertDeadlineApproaching => 'Deadline approaching';

  @override
  String get alertDeadlineApproachingSubtitle =>
      'Notify me 48h before deadline';

  @override
  String get alertCompetitorWins => 'Competitor wins';

  @override
  String get alertCompetitorWinsSubtitle =>
      'Notify me when a competitor wins a similar tender';

  @override
  String get profileReadyToSyncTitle => 'Profile Ready to Sync';

  @override
  String get profileReadyToSyncSubtitle =>
      'Your preferences will be used to filter and recommend tenders.';

  @override
  String get personalizedTenderFeed => 'Personalized tender feed';

  @override
  String get customizedAlerts => 'Customized alerts';

  @override
  String get sectorSpecificMatching => 'Sector-specific matching';

  @override
  String get configurationStatusComplete => 'Configuration Status: Complete';

  @override
  String get saveAndUpdateFeed => 'Save & Update My Feed';

  @override
  String get previewMatchesLabel => 'Preview of matches for your sectors:';

  @override
  String get previewTenderTitle => 'Office Supplies Procurement';

  @override
  String get previewTenderSubtitle => 'Ministry of Education • 2 Days left';

  @override
  String get filterByCategory => 'Filter by Category';

  @override
  String get reset => 'Reset';

  @override
  String get clearAllFilters => 'Clear All Filters';

  @override
  String get failedToLoadTenders => 'Failed to load tenders';

  @override
  String get retry => 'Retry';

  @override
  String get tenderBookmarkUpdated => 'Tender bookmark updated';

  @override
  String errorWithCount(String error) {
    return 'Error: $error';
  }

  @override
  String get summaryTitle => 'Summary';

  @override
  String get organizationLabel => 'Organization';

  @override
  String get projectLabel => 'Project';

  @override
  String get deadlineLabel => 'Deadline';

  @override
  String get bidBondLabel => 'Bid Bond';

  @override
  String get notSpecified => 'Not specified';

  @override
  String get eligibilityLabel => 'Eligibility';

  @override
  String get unknown => 'Unknown';

  @override
  String get descriptionTitle => 'Description';

  @override
  String get noDescriptionAvailable =>
      'No description available for this tender.';

  @override
  String get historicalWinningPrices => 'Historical Winning Prices';

  @override
  String get unlockMarketInsights =>
      'Unlock market insights for\nsimilar tenders';

  @override
  String get saved => 'Saved';

  @override
  String get save => 'Save';

  @override
  String get alertsSetForTender => 'Alerts set for this tender';

  @override
  String get alertsDisabled => 'Alerts disabled';

  @override
  String get pleaseLoginToSeeSaved => 'Please login to see saved tenders';

  @override
  String get noSavedTendersYet => 'No saved tenders yet';

  @override
  String noItemsIn(String title) {
    return 'No items in $title';
  }

  @override
  String get aiSummaryTitle => 'AI Summary';

  @override
  String get generateSummary => 'Generate Summary';

  @override
  String get generatingSummary => 'Generating...';

  @override
  String get aiSummaryDisclaimer =>
      'AI-generated summary. Please refer to official documents for final details.';

  @override
  String get aiSummaryError => 'Failed to generate summary.';
}
