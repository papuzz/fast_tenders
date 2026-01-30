import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'TenderWin Ethiopia'**
  String get appTitle;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to TenderWin!'**
  String get welcomeMessage;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Login to access your tenders'**
  String get loginSubtitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneLabel;

  /// No description provided for @usePhone.
  ///
  /// In en, this message translates to:
  /// **'Use Phone Number'**
  String get usePhone;

  /// No description provided for @useEmail.
  ///
  /// In en, this message translates to:
  /// **'Use Email'**
  String get useEmail;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @otpLabel.
  ///
  /// In en, this message translates to:
  /// **'OTP Code'**
  String get otpLabel;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get phoneHint;

  /// No description provided for @otpHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code sent to your phone'**
  String get otpHint;

  /// No description provided for @phoneFormatHelper.
  ///
  /// In en, this message translates to:
  /// **'Format: +2519...'**
  String get phoneFormatHelper;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get passwordHint;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up to start winning tenders'**
  String get signUpSubtitle;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name'**
  String get fullNameHint;

  /// No description provided for @passwordHint2.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get passwordHint2;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordLengthError;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created! Please check your email for confirmation.'**
  String get accountCreated;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we will send you a link to reset your password.'**
  String get forgotPasswordDesc;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @resetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent to your email'**
  String get resetLinkSent;

  /// No description provided for @tendersTitle.
  ///
  /// In en, this message translates to:
  /// **'Tenders'**
  String get tendersTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search tenders / scanned text...'**
  String get searchHint;

  /// No description provided for @catAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get catAll;

  /// No description provided for @catConstruction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get catConstruction;

  /// No description provided for @catIT.
  ///
  /// In en, this message translates to:
  /// **'IT & Telecom'**
  String get catIT;

  /// No description provided for @catHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get catHealth;

  /// No description provided for @catEnergy.
  ///
  /// In en, this message translates to:
  /// **'Energy'**
  String get catEnergy;

  /// No description provided for @catSupply.
  ///
  /// In en, this message translates to:
  /// **'Supply'**
  String get catSupply;

  /// No description provided for @hoursLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} Hours Left'**
  String hoursLeft(int count);

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} Days Left'**
  String daysLeft(int count);

  /// No description provided for @proLabel.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get proLabel;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Settings & Profile (Coming Soon)'**
  String get settingsComingSoon;

  /// No description provided for @cpoRequired.
  ///
  /// In en, this message translates to:
  /// **'CPO REQUIRED'**
  String get cpoRequired;

  /// No description provided for @shareCard.
  ///
  /// In en, this message translates to:
  /// **'Share Card'**
  String get shareCard;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @endsInHours.
  ///
  /// In en, this message translates to:
  /// **'Ends in {count}h'**
  String endsInHours(int count);

  /// No description provided for @cpoRange.
  ///
  /// In en, this message translates to:
  /// **'1% - 2%'**
  String get cpoRange;

  /// No description provided for @cpoCalcTitle.
  ///
  /// In en, this message translates to:
  /// **'CPO Calculator'**
  String get cpoCalcTitle;

  /// No description provided for @cpoCalcDesc.
  ///
  /// In en, this message translates to:
  /// **'Calculate your Bid Bond (CPO) instantly.'**
  String get cpoCalcDesc;

  /// No description provided for @totalBidAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Bid Amount'**
  String get totalBidAmount;

  /// No description provided for @bidAmountHelper.
  ///
  /// In en, this message translates to:
  /// **'Enter the total amount of your offer'**
  String get bidAmountHelper;

  /// No description provided for @percentageLabel.
  ///
  /// In en, this message translates to:
  /// **'Percentage (%)'**
  String get percentageLabel;

  /// No description provided for @fixedAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Fixed Amount'**
  String get fixedAmountLabel;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @generatingCpo.
  ///
  /// In en, this message translates to:
  /// **'Generating CPO Request Letter... (Coming Soon)'**
  String get generatingCpo;

  /// No description provided for @generateCpoLetter.
  ///
  /// In en, this message translates to:
  /// **'Generate Bank CPO Request Letter'**
  String get generateCpoLetter;

  /// No description provided for @navTenders.
  ///
  /// In en, this message translates to:
  /// **'Tenders'**
  String get navTenders;

  /// No description provided for @navBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get navBrowse;

  /// No description provided for @navCpo.
  ///
  /// In en, this message translates to:
  /// **'CPO Calc'**
  String get navCpo;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @postedAgo.
  ///
  /// In en, this message translates to:
  /// **'Posted {time}'**
  String postedAgo(Object time);

  /// No description provided for @openingDate.
  ///
  /// In en, this message translates to:
  /// **'Opening: {date}'**
  String openingDate(Object date);

  /// No description provided for @closingDate.
  ///
  /// In en, this message translates to:
  /// **'Closing: {date}'**
  String closingDate(Object date);

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(Object count);

  /// No description provided for @noTendersFound.
  ///
  /// In en, this message translates to:
  /// **'No tenders found'**
  String get noTendersFound;

  /// No description provided for @adjustFilters.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get adjustFilters;

  /// No description provided for @drawerAllTenders.
  ///
  /// In en, this message translates to:
  /// **'All Tenders'**
  String get drawerAllTenders;

  /// No description provided for @drawerMyTenders.
  ///
  /// In en, this message translates to:
  /// **'My Tenders'**
  String get drawerMyTenders;

  /// No description provided for @drawerFreeTenders.
  ///
  /// In en, this message translates to:
  /// **'Free Tenders'**
  String get drawerFreeTenders;

  /// No description provided for @drawerSavedTenders.
  ///
  /// In en, this message translates to:
  /// **'Saved Tenders'**
  String get drawerSavedTenders;

  /// No description provided for @drawerUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get drawerUnread;

  /// No description provided for @drawerTrashed.
  ///
  /// In en, this message translates to:
  /// **'Trashed'**
  String get drawerTrashed;

  /// No description provided for @drawerSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawerSettings;

  /// No description provided for @drawerAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get drawerAbout;

  /// No description provided for @drawerHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get drawerHelp;

  /// No description provided for @proMember.
  ///
  /// In en, this message translates to:
  /// **'PRO MEMBER'**
  String get proMember;

  /// No description provided for @locationET.
  ///
  /// In en, this message translates to:
  /// **'• Addis Ababa, ET'**
  String get locationET;

  /// No description provided for @walletSection.
  ///
  /// In en, this message translates to:
  /// **'Wallet & Payments'**
  String get walletSection;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE BALANCE'**
  String get availableBalance;

  /// No description provided for @topUp.
  ///
  /// In en, this message translates to:
  /// **'Top Up'**
  String get topUp;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @langPreference.
  ///
  /// In en, this message translates to:
  /// **'Language Preference'**
  String get langPreference;

  /// No description provided for @industryAlerts.
  ///
  /// In en, this message translates to:
  /// **'Industry Alerts'**
  String get industryAlerts;

  /// No description provided for @industries.
  ///
  /// In en, this message translates to:
  /// **'Construction, IT, Logistics'**
  String get industries;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @ocrScanningTitle.
  ///
  /// In en, this message translates to:
  /// **'How to use OCR Scanning'**
  String get ocrScanningTitle;

  /// No description provided for @ocrScanningDesc.
  ///
  /// In en, this message translates to:
  /// **'Convert paper tenders to digital data instantly.'**
  String get ocrScanningDesc;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faq;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Customer Support'**
  String get contactSupport;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout Account'**
  String get logout;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'TenderEthiopia v2.4.0 (Build 88)'**
  String get appVersion;

  /// No description provided for @profileSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Setup Profile'**
  String get profileSetupTitle;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @profileUpdatedSyncing.
  ///
  /// In en, this message translates to:
  /// **'Profile Updated! Your feed is syncing...'**
  String get profileUpdatedSyncing;

  /// No description provided for @profileUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Error updating profile: {error}'**
  String profileUpdateError(String error);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @businessBasicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Business Basics'**
  String get businessBasicsTitle;

  /// No description provided for @businessBasicsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us about your company so we can find the right tenders.'**
  String get businessBasicsSubtitle;

  /// No description provided for @businessNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Business Name'**
  String get businessNameLabel;

  /// No description provided for @businessNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Ethio Tech Solutions'**
  String get businessNameHint;

  /// No description provided for @businessTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Business Type'**
  String get businessTypeLabel;

  /// No description provided for @primarySectorLabel.
  ///
  /// In en, this message translates to:
  /// **'Primary Sector (Select all that apply)'**
  String get primarySectorLabel;

  /// No description provided for @primarySectorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We use this to recommend tenders you can actually win.'**
  String get primarySectorSubtitle;

  /// No description provided for @legalLicenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal & License Info'**
  String get legalLicenseTitle;

  /// No description provided for @legalLicenseSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help us verify your eligibility.'**
  String get legalLicenseSubtitle;

  /// No description provided for @tradeLicenseCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Trade License Category'**
  String get tradeLicenseCategoryLabel;

  /// No description provided for @licenseGradeLabel.
  ///
  /// In en, this message translates to:
  /// **'License Grade (if applicable)'**
  String get licenseGradeLabel;

  /// No description provided for @vatRegisteredLabel.
  ///
  /// In en, this message translates to:
  /// **'VAT Registered?'**
  String get vatRegisteredLabel;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @taxComplianceDeclaration.
  ///
  /// In en, this message translates to:
  /// **'I declare my tax compliance status is up to date.'**
  String get taxComplianceDeclaration;

  /// No description provided for @taxComplianceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trust-based declaration.'**
  String get taxComplianceSubtitle;

  /// No description provided for @targetInstitutionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Target Institutions & Regions'**
  String get targetInstitutionsTitle;

  /// No description provided for @targetInstitutionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hyper-relevant notifications, less spam.'**
  String get targetInstitutionsSubtitle;

  /// No description provided for @preferredInstitutionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Preferred Institutions'**
  String get preferredInstitutionsLabel;

  /// No description provided for @operatingRegionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Operating Regions'**
  String get operatingRegionsLabel;

  /// No description provided for @alertPreferencesTitle.
  ///
  /// In en, this message translates to:
  /// **'Alert Preferences'**
  String get alertPreferencesTitle;

  /// No description provided for @alertPreferencesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let users control noise early.'**
  String get alertPreferencesSubtitle;

  /// No description provided for @alertMatchingTender.
  ///
  /// In en, this message translates to:
  /// **'Matching tender published'**
  String get alertMatchingTender;

  /// No description provided for @alertMatchingTenderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify me when a tender matches my profile'**
  String get alertMatchingTenderSubtitle;

  /// No description provided for @alertFavoriteInstitution.
  ///
  /// In en, this message translates to:
  /// **'Favorite institution posts'**
  String get alertFavoriteInstitution;

  /// No description provided for @alertFavoriteInstitutionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify me when my preferred institutions post'**
  String get alertFavoriteInstitutionSubtitle;

  /// No description provided for @alertDeadlineApproaching.
  ///
  /// In en, this message translates to:
  /// **'Deadline approaching'**
  String get alertDeadlineApproaching;

  /// No description provided for @alertDeadlineApproachingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify me 48h before deadline'**
  String get alertDeadlineApproachingSubtitle;

  /// No description provided for @alertCompetitorWins.
  ///
  /// In en, this message translates to:
  /// **'Competitor wins'**
  String get alertCompetitorWins;

  /// No description provided for @alertCompetitorWinsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notify me when a competitor wins a similar tender'**
  String get alertCompetitorWinsSubtitle;

  /// No description provided for @profileReadyToSyncTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Ready to Sync'**
  String get profileReadyToSyncTitle;

  /// No description provided for @profileReadyToSyncSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your preferences will be used to filter and recommend tenders.'**
  String get profileReadyToSyncSubtitle;

  /// No description provided for @personalizedTenderFeed.
  ///
  /// In en, this message translates to:
  /// **'Personalized tender feed'**
  String get personalizedTenderFeed;

  /// No description provided for @customizedAlerts.
  ///
  /// In en, this message translates to:
  /// **'Customized alerts'**
  String get customizedAlerts;

  /// No description provided for @sectorSpecificMatching.
  ///
  /// In en, this message translates to:
  /// **'Sector-specific matching'**
  String get sectorSpecificMatching;

  /// No description provided for @configurationStatusComplete.
  ///
  /// In en, this message translates to:
  /// **'Configuration Status: Complete'**
  String get configurationStatusComplete;

  /// No description provided for @saveAndUpdateFeed.
  ///
  /// In en, this message translates to:
  /// **'Save & Update My Feed'**
  String get saveAndUpdateFeed;

  /// No description provided for @previewMatchesLabel.
  ///
  /// In en, this message translates to:
  /// **'Preview of matches for your sectors:'**
  String get previewMatchesLabel;

  /// No description provided for @previewTenderTitle.
  ///
  /// In en, this message translates to:
  /// **'Office Supplies Procurement'**
  String get previewTenderTitle;

  /// No description provided for @previewTenderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Education • 2 Days left'**
  String get previewTenderSubtitle;

  /// No description provided for @filterByCategory.
  ///
  /// In en, this message translates to:
  /// **'Filter by Category'**
  String get filterByCategory;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @clearAllFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear All Filters'**
  String get clearAllFilters;

  /// No description provided for @failedToLoadTenders.
  ///
  /// In en, this message translates to:
  /// **'Failed to load tenders'**
  String get failedToLoadTenders;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @tenderBookmarkUpdated.
  ///
  /// In en, this message translates to:
  /// **'Tender bookmark updated'**
  String get tenderBookmarkUpdated;

  /// No description provided for @errorWithCount.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorWithCount(String error);

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summaryTitle;

  /// No description provided for @organizationLabel.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get organizationLabel;

  /// No description provided for @projectLabel.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get projectLabel;

  /// No description provided for @deadlineLabel.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get deadlineLabel;

  /// No description provided for @bidBondLabel.
  ///
  /// In en, this message translates to:
  /// **'Bid Bond'**
  String get bidBondLabel;

  /// No description provided for @notSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get notSpecified;

  /// No description provided for @eligibilityLabel.
  ///
  /// In en, this message translates to:
  /// **'Eligibility'**
  String get eligibilityLabel;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @descriptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionTitle;

  /// No description provided for @noDescriptionAvailable.
  ///
  /// In en, this message translates to:
  /// **'No description available for this tender.'**
  String get noDescriptionAvailable;

  /// No description provided for @historicalWinningPrices.
  ///
  /// In en, this message translates to:
  /// **'Historical Winning Prices'**
  String get historicalWinningPrices;

  /// No description provided for @unlockMarketInsights.
  ///
  /// In en, this message translates to:
  /// **'Unlock market insights for\nsimilar tenders'**
  String get unlockMarketInsights;

  /// No description provided for @saved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saved;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @alertsSetForTender.
  ///
  /// In en, this message translates to:
  /// **'Alerts set for this tender'**
  String get alertsSetForTender;

  /// No description provided for @alertsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Alerts disabled'**
  String get alertsDisabled;

  /// No description provided for @pleaseLoginToSeeSaved.
  ///
  /// In en, this message translates to:
  /// **'Please login to see saved tenders'**
  String get pleaseLoginToSeeSaved;

  /// No description provided for @noSavedTendersYet.
  ///
  /// In en, this message translates to:
  /// **'No saved tenders yet'**
  String get noSavedTendersYet;

  /// No description provided for @noItemsIn.
  ///
  /// In en, this message translates to:
  /// **'No items in {title}'**
  String noItemsIn(String title);

  /// No description provided for @aiSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Summary'**
  String get aiSummaryTitle;

  /// No description provided for @generateSummary.
  ///
  /// In en, this message translates to:
  /// **'Generate Summary'**
  String get generateSummary;

  /// No description provided for @generatingSummary.
  ///
  /// In en, this message translates to:
  /// **'Generating...'**
  String get generatingSummary;

  /// No description provided for @aiSummaryDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'AI-generated summary. Please refer to official documents for final details.'**
  String get aiSummaryDisclaimer;

  /// No description provided for @aiSummaryError.
  ///
  /// In en, this message translates to:
  /// **'Failed to generate summary.'**
  String get aiSummaryError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
