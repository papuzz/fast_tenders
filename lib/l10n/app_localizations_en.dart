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
  String get selectIndustries => 'Select Industries';

  @override
  String get chooseSectorsAlerts =>
      'Choose the sectors you want to receive alerts for. You will be notified when new tenders match these categories.';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get alertPreferencesUpdated => 'Alert preferences updated';

  @override
  String errorSavingPreferences(String error) {
    return 'Error saving preferences: $error';
  }

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
  String get membershipPlan => 'Membership Plan';

  @override
  String get currentStatus => 'CURRENT STATUS';

  @override
  String get annualPremiumAccess => 'Annual Premium Access';

  @override
  String validUntil(String date) {
    return 'Valid until $date';
  }

  @override
  String get upgradeOrChangePlan => 'Upgrade or Change Plan';

  @override
  String get updateBusinessProfile => 'Update Business Profile';

  @override
  String get updateBusinessProfileSubtitle =>
      'Refine your preferences and matches';

  @override
  String get teamManagementSubtitle => 'Manage corporate access';

  @override
  String get noSectorsSelected => 'No sectors selected';

  @override
  String get loading => 'Loading...';

  @override
  String get catConsultancy => 'Consultancy';

  @override
  String get catNonConsultancy => 'Non-Consultancy';

  @override
  String get catAgriculture => 'Agriculture';

  @override
  String get catEducation => 'Education';

  @override
  String get catFinance => 'Finance & Insurance';

  @override
  String get catTransport => 'Transport';

  @override
  String get catManufacturing => 'Manufacturing';

  @override
  String get catHotel => 'Hotel & Services';

  @override
  String get catCleaning => 'Cleaning & Security';

  @override
  String get supplier => 'Supplier';

  @override
  String get contractor => 'Contractor';

  @override
  String get consultant => 'Consultant';

  @override
  String get generalTrading => 'General Trading';

  @override
  String get service => 'Service';

  @override
  String grade(String grade) {
    return 'Grade $grade';
  }

  @override
  String get na => 'N/A';

  @override
  String get ministries => 'Ministries';

  @override
  String get universities => 'Universities';

  @override
  String get ngos => 'NGOs';

  @override
  String get soes => 'SOEs';

  @override
  String get addisAbaba => 'Addis Ababa';

  @override
  String get oromia => 'Oromia';

  @override
  String get amhara => 'Amhara';

  @override
  String get nationwide => 'Nationwide';

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

  @override
  String get activePlan => 'ACTIVE PLAN';

  @override
  String get active => 'ACTIVE';

  @override
  String get seatAllocation => 'Seat Allocation';

  @override
  String get used => 'Used';

  @override
  String renewsOn(String date) {
    return 'Renews on $date';
  }

  @override
  String get upgradeOrRenew => 'Upgrade or Renew';

  @override
  String get teamMembers => 'Team Members';

  @override
  String manageAccessSlots(int count) {
    return 'Manage access for your $count corporate slots';
  }

  @override
  String slotAvailable(int count) {
    return 'Slot $count: Available';
  }

  @override
  String get inviteViaEmailPhone => 'Invite via email or phone number';

  @override
  String get emailPhoneHint => 'Email or +251...';

  @override
  String inviteSentTo(String text) {
    return 'Invite sent to $text';
  }

  @override
  String get enterEmailPhoneError => 'Please enter an email or phone number';

  @override
  String get invite => 'Invite';

  @override
  String get email => 'Email';

  @override
  String get phoneWithPrefix => 'Phone (+251)';

  @override
  String get inviteThirdMember => 'Invite a third team member';

  @override
  String get add => 'Add';

  @override
  String get slot3Config => 'Slot 3 configuration';

  @override
  String get pendingStatus => 'PENDING STATUS';

  @override
  String get invitePending => 'Invite pending';

  @override
  String get invitationResent => 'Invitation resent';

  @override
  String get resend => 'Resend';

  @override
  String get invitationCancelled => 'Invitation cancelled';

  @override
  String get cancel => 'Cancel';

  @override
  String get collaborativeTendering => 'Collaborative Tendering';

  @override
  String get collaborativeTenderingDesc =>
      'Team members share your corporate OCR quota (500 pages/mo) and can contribute to tender bidding analysis in real-time.';

  @override
  String get ethiopianMarketEnterprise => 'ETHIOPIAN MARKET ENTERPRISE';

  @override
  String get teamManagementTitle => 'Team Management';

  @override
  String get membership => 'Membership';

  @override
  String get corporate => 'Corporate';

  @override
  String get personal => 'Personal';

  @override
  String pricePerYear(String price) {
    return '$price ETB / year';
  }

  @override
  String pricePer6Mo(String price) {
    return '$price ETB / 6 mo';
  }

  @override
  String pricePer3Mo(String price) {
    return '$price ETB / 3 mo';
  }

  @override
  String get oneYearPremiumAccess => '1 Year Premium Access';

  @override
  String get bestValue => 'Best Value';

  @override
  String get realTimeAlerts => 'Real-time Alerts';

  @override
  String get sixMonthsPro => '6 Months Pro';

  @override
  String get threeMonthsBasic => '3 Months Basic';

  @override
  String get enterpriseAnnual => 'Enterprise Annual';

  @override
  String get threeUserLicenses => '3 User Licenses';

  @override
  String get multiUserDashboard => 'Multi-user Dashboard';

  @override
  String get business6Month => 'Business 6 Month';

  @override
  String get businessQuarterly => 'Business Quarterly';

  @override
  String get payWithTelebirrChapa => 'Pay with Telebirr / Chapa';

  @override
  String get subscriptionTerms =>
      'By subscribing, you agree to our Terms of Service. Secure encrypted payment processing.';

  @override
  String get completePayment => 'Complete Payment';

  @override
  String get userNotLoggedIn =>
      'User not logged in. Please log in to continue.';

  @override
  String get redirectingToChapa => 'Redirecting to Chapa...';

  @override
  String get couldNotLaunchPayment => 'Could not launch payment URL';

  @override
  String get payNowWithChapa => 'Pay Now with Chapa';

  @override
  String get paymentSuccessful => 'Payment Successful!';

  @override
  String get subscriptionActivated =>
      'Your subscription has been activated. You can now access all premium features.';

  @override
  String get goToDashboard => 'Go to Dashboard';
}
