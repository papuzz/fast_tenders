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
