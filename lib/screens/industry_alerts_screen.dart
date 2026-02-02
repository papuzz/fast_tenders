import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fast_tenders/core/constants/app_colors.dart';
import 'package:fast_tenders/core/constants/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:core/core.dart';
import 'package:fast_tenders/features/auth/data/auth_controller.dart';
import 'package:fast_tenders/core/providers/user_profile_provider.dart';

class IndustryAlertsScreen extends ConsumerStatefulWidget {
  const IndustryAlertsScreen({super.key});

  @override
  ConsumerState<IndustryAlertsScreen> createState() =>
      _IndustryAlertsScreenState();
}

class _IndustryAlertsScreenState extends ConsumerState<IndustryAlertsScreen> {
  List<String> _selectedSectors = [];
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadSectors();
  }

  Future<void> _loadSectors() async {
    final user = ref.read(currentUserProvider).value;
    if (user != null) {
      try {
        final profile = await Supabase.instance.client
            .from('business_profiles')
            .select('sectors')
            .eq('id', user.id)
            .maybeSingle();

        if (profile != null && profile['sectors'] != null) {
          setState(() {
            _selectedSectors = List<String>.from(profile['sectors']);
          });
        }
      } catch (e) {
        debugPrint('Error loading sectors: $e');
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _saveSectors() async {
    setState(() {
      _isSaving = true;
    });

    try {
      final user = ref.read(currentUserProvider).value;
      if (user != null) {
        // Use AuthController to ensure data mapping is consistent
        await ref.read(authControllerProvider.notifier).updateBusinessProfile({
          'sectors': _selectedSectors,
        });

        // Trigger scan for existing tenders that match new selections
        try {
          await Supabase.instance.client.rpc(
            'check_existing_tenders_for_user',
            params: {'target_user_id': user.id},
          );
        } catch (rpcError) {
          debugPrint('RPC error (optional): $rpcError');
        }

        // Invalidate the sectors provider so ProfileScreen updates
        ref.invalidate(userSectorsProvider);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Alert preferences updated')),
          );
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving preferences: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Exclude 'All' from selection
    final categories = AppConstants.tenderCategories
        .where((c) => c != 'All')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Industry Alerts'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Select Industries',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Choose the sectors you want to receive alerts for. You will be notified when new tenders match these categories.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: categories.map((category) {
                    final isSelected = _selectedSectors.contains(category);
                    return FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      selectedColor: AppColors.primary.withValues(alpha: 0.2),
                      checkmarkColor: AppColors.primary,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedSectors.add(category);
                          } else {
                            _selectedSectors.remove(category);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _isSaving ? null : _saveSectors,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 24),
              ],
            ),
    );
  }
}

