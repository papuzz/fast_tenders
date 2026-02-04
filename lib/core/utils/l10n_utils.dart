import 'package:flutter/material.dart';
import 'package:fast_tenders/l10n/app_localizations.dart';

class L10nUtils {
  static String getCategoryLabel(BuildContext context, String key) {
    final l10n = AppLocalizations.of(context)!;
    switch (key) {
      case 'All':
        return l10n.catAll;
      case 'Construction':
        return l10n.catConstruction;
      case 'IT & Telecom':
      case 'IT & electronics':
        return l10n.catIT;
      case 'Healthcare':
      case 'Health':
      case 'Medical supplies':
        return l10n.catHealth;
      case 'Energy':
        return l10n.catEnergy;
      case 'Goods & Supply':
      case 'Supply':
      case 'Office supplies':
        return l10n.catSupply;
      case 'Consultancy':
      case 'Consultant':
      case 'Consulting':
        return l10n.catConsultancy;
      case 'Non-Consultancy':
        return l10n.catNonConsultancy;
      case 'Agriculture':
        return l10n.catAgriculture;
      case 'Education':
        return l10n.catEducation;
      case 'Finance & Insurance':
        return l10n.catFinance;
      case 'Transport':
        return l10n.catTransport;
      case 'Manufacturing':
        return l10n.catManufacturing;
      case 'Hotel & Services':
        return l10n.catHotel;
      case 'Cleaning & Security':
        return l10n.catCleaning;
      // Business Profile additions
      case 'Supplier':
        return l10n.supplier;
      case 'Contractor':
        return l10n.contractor;
      case 'General Trading':
        return l10n.generalTrading;
      case 'Service':
        return l10n.service;
      case 'Grade 1':
        return l10n.grade('1');
      case 'Grade 2':
        return l10n.grade('2');
      case 'Grade 3':
        return l10n.grade('3');
      case 'Grade 4':
        return l10n.grade('4');
      case 'N/A':
        return l10n.na;
      case 'Ministries':
        return l10n.ministries;
      case 'Universities':
        return l10n.universities;
      case 'NGOs':
        return l10n.ngos;
      case 'SOEs':
        return l10n.soes;
      case 'Addis Ababa':
        return l10n.addisAbaba;
      case 'Oromia':
        return l10n.oromia;
      case 'Amhara':
        return l10n.amhara;
      case 'Nationwide':
        return l10n.nationwide;
      default:
        return key;
    }
  }
}