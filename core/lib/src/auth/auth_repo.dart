import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:core/src/network/supabase_client.dart';

abstract class AuthRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(
    String email,
    String password,
    String fullName,
    String? phone,
  );
  Future<void> signInWithPhone(String phone);
  Future<AuthResponse> verifyOTP(String phone, String token);
  Future<void> ensureUserInPublicTable();
  Future<void> resetPassword(String email);
  Future<void> signOut();
  Stream<AuthState> get authStateChanges;
  User? get currentUser;
  Future<bool> updateUser({String? fullName, String? phone});
  Future<void> updateBusinessProfile(Map<String, dynamic> data);
}

class SupabaseAuthRepository implements AuthRepository {
  final SupabaseClient _supabase = SupabaseClientWrapper.client;

  @override
  Future<void> signInWithEmail(String email, String password) async {
    await _supabase.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signUpWithEmail(
    String email,
    String password,
    String fullName,
    String? phone,
  ) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );

      if (authResponse.user != null) {
        // Profiles table is handled by trigger usually, but we can double check
        await ensureUserInPublicTable();
      }
    } catch (e) {
      // ignore: avoid_print
      print('Signup Error: $e');
      rethrow;
    }
  }

  @override
  Future<void> signInWithPhone(String phone) async {
    await _supabase.auth.signInWithOtp(phone: phone);
  }

  @override
  Future<AuthResponse> verifyOTP(String phone, String token) async {
    return await _supabase.auth.verifyOTP(
      phone: phone,
      token: token,
      type: OtpType.sms,
    );
  }

  @override
  Future<void> ensureUserInPublicTable() async {
    final currentUser = _supabase.auth.currentUser;
    if (currentUser != null) {
      await _supabase.from('profiles').upsert({
        'id': currentUser.id,
        'email': currentUser.email,
        'full_name':
            currentUser.userMetadata?['full_name'] ??
            currentUser.userMetadata?['name'] ??
            'User',
      }, onConflict: 'id');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
    try {
      if (Hive.isBoxOpen('auth')) await Hive.box('auth').clear();
      if (Hive.isBoxOpen('user')) await Hive.box('user').clear();
    } catch (_) {}
  }

  @override
  Stream<AuthState> get authStateChanges =>
      _supabase.auth.onAuthStateChange.handleError((error) {
        // Log or handle the retryable fetch exception
        if (error.toString().contains('AuthRetryableFetchException')) {
          // This is a known Supabase issue, usually transient
        }
      });

  @override
  User? get currentUser => _supabase.auth.currentUser;

  @override
  Future<bool> updateUser({String? fullName, String? phone}) async {
    try {
      final currentUser = _supabase.auth.currentUser;
      if (currentUser == null) return false;

      final newUserMetadata = {
        ...(currentUser.userMetadata ?? {}),
        if (fullName != null) 'full_name': fullName,
      };

      await _supabase.auth.updateUser(
        UserAttributes(data: newUserMetadata),
      );

      final Map<String, dynamic> updateData = {};
      if (fullName != null) updateData['full_name'] = fullName;
      if (phone != null) updateData['phone_number'] = phone;

      if (updateData.isNotEmpty) {
        await _supabase
            .from('profiles')
            .update(updateData)
            .eq('id', currentUser.id);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> updateBusinessProfile(Map<String, dynamic> data) async {
    final user = _supabase.auth.currentUser;
    if (user == null) throw Exception('No user logged in');

    // Map UI camelCase keys to database snake_case columns
    // We use a conditional map to allow partial updates (don't overwrite with nulls if key is missing)
    final Map<String, dynamic> mappedData = {'id': user.id};

    if (data.containsKey('businessName')) {
      mappedData['business_name'] = data['businessName'];
    }
    if (data.containsKey('businessType')) {
      mappedData['business_type'] = data['businessType'];
    }
    if (data.containsKey('sectors')) mappedData['sectors'] = data['sectors'];
    if (data.containsKey('licenseCategory')) {
      mappedData['license_category'] = data['licenseCategory'];
    }
    if (data.containsKey('licenseGrade')) {
      mappedData['license_grade'] = data['licenseGrade'];
    }
    if (data.containsKey('vatRegistered')) {
      mappedData['vat_registered'] = data['vatRegistered'];
    }
    if (data.containsKey('taxCompliance')) {
      mappedData['tax_compliance'] = data['taxCompliance'];
    }
    if (data.containsKey('maxContractSize')) {
      mappedData['max_contract_size'] = data['maxContractSize'];
    }
    if (data.containsKey('bidBondComfort')) {
      mappedData['bid_bond_comfort'] = data['bidBondComfort'];
    }
    if (data.containsKey('yearsInOperation')) {
      mappedData['years_in_operation'] = data['yearsInOperation'];
    }
    if (data.containsKey('projectsCompleted')) {
      mappedData['projects_completed'] = data['projectsCompleted'];
    }
    if (data.containsKey('majorClient')) {
      mappedData['major_client'] = data['majorClient'];
    }
    if (data.containsKey('preferredInstitutions')) {
      mappedData['preferred_institutions'] = data['preferredInstitutions'];
    }
    if (data.containsKey('operatingRegions')) {
      mappedData['operating_regions'] = data['operatingRegions'];
    }
    if (data.containsKey('alertMatch')) {
      mappedData['alert_match'] = data['alertMatch'];
    }
    if (data.containsKey('alertFavorite')) {
      mappedData['alert_favorite'] = data['alertFavorite'];
    }
    if (data.containsKey('alertDeadline')) {
      mappedData['alert_deadline'] = data['alertDeadline'];
    }
    if (data.containsKey('alertCompetitor')) {
      mappedData['alert_competitor'] = data['alertCompetitor'];
    }

    await _supabase.from('business_profiles').upsert(mappedData);
  }
}