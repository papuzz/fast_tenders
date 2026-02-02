import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fast_tenders/core/constants/app_colors.dart';
import 'dart:math' as math;

class MembershipSelectionScreen extends ConsumerStatefulWidget {
  const MembershipSelectionScreen({super.key});

  @override
  ConsumerState<MembershipSelectionScreen> createState() =>
      _MembershipSelectionScreenState();
}

class _MembershipSelectionScreenState
    extends ConsumerState<MembershipSelectionScreen>
    with SingleTickerProviderStateMixin {
  bool _isPersonal = false;
  String _selectedPlanId = 'corporate_year';
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Membership',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.help_outline), onPressed: () {}),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: isDark ? Colors.white : Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Toggle Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: isDark ? Colors.grey[900] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isPersonal = false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !_isPersonal
                                ? (isDark ? Colors.grey[800] : Colors.white)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: !_isPersonal
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Corporate',
                            style: TextStyle(
                              color: !_isPersonal
                                  ? AppColors.primary
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isPersonal = true),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isPersonal
                                ? (isDark ? Colors.grey[800] : Colors.white)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: _isPersonal
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Personal',
                            style: TextStyle(
                              color: _isPersonal
                                  ? AppColors.primary
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Plans List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _isPersonal
                  ? _buildPersonalPlans()
                  : _buildCorporatePlans(),
            ),
            const SizedBox(height: 120), // Space for fixed footer
          ],
        ),
      ),
      bottomSheet: _buildFooter(isDark),
    );
  }

  Widget _buildPersonalPlans() {
    return Column(
      children: [
        _buildPlanCard(
          id: 'personal_year',
          title: '3,500 ETB',
          subtitle: '/ year',
          description: '1 Year Premium Access',
          badge: 'Best Value',
          features: ['Real-time Alerts'],
          isPopular: true,
        ),
        const SizedBox(height: 16),
        _buildPlanCard(
          id: 'personal_6mo',
          title: '2,500 ETB',
          subtitle: '/ 6 mo',
          description: '6 Months Pro',
        ),
        const SizedBox(height: 16),
        _buildPlanCard(
          id: 'personal_3mo',
          title: '2,000 ETB',
          subtitle: '/ 3 mo',
          description: '3 Months Basic',
        ),
      ],
    );
  }

  Widget _buildCorporatePlans() {
    return Column(
      children: [
        _buildPlanCard(
          id: 'corporate_year',
          title: '4,000 ETB',
          subtitle: '/ year',
          description: 'Enterprise Annual',
          badge: '3 User Licenses',
          features: ['Multi-user Dashboard', 'Real-time Alerts'],
          isCorporate: true,
        ),
        const SizedBox(height: 16),
        _buildPlanCard(
          id: 'corporate_6mo',
          title: '3,000 ETB',
          subtitle: '/ 6 mo',
          description: 'Business 6 Month',
        ),
        const SizedBox(height: 16),
        _buildPlanCard(
          id: 'corporate_3mo',
          title: '2,500 ETB',
          subtitle: '/ 3 mo',
          description: 'Business Quarterly',
        ),
      ],
    );
  }

  Widget _buildPlanCard({
    required String id,
    required String title,
    required String subtitle,
    required String description,
    String? badge,
    List<String>? features,
    bool isPopular = false,
    bool isCorporate = false,
  }) {
    final isSelected = _selectedPlanId == id;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget cardContent = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1C2127) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: !isPopular && !isCorporate
            ? Border.all(
                color: isSelected
                    ? AppColors.primary
                    : (isDark ? Colors.grey[800]! : Colors.grey[200]!),
                width: isSelected ? 2 : 1,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: (isCorporate ? AppColors.primary : AppColors.accent)
                        .withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge.toUpperCase(),
                    style: TextStyle(
                      color: isCorporate ? AppColors.primary : AppColors.accent,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              Radio<String>(
                value: id,
                groupValue: _selectedPlanId,
                onChanged: (value) {
                  setState(() => _selectedPlanId = value!);
                },
                activeColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                TextSpan(
                  text: ' $subtitle',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (features != null && features.isNotEmpty) ...[
            const SizedBox(height: 24),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Icon(
                      isCorporate ? Icons.groups : Icons.check_circle,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      feature,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[300] : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );

    if (isPopular || isCorporate) {
      return GestureDetector(
        onTap: () => setState(() => _selectedPlanId = id),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: SweepGradient(
                  colors: isPopular
                      ? [
                          AppColors.primary,
                          AppColors.accent,
                          AppColors.primary,
                          AppColors.accent,
                          AppColors.primary
                        ]
                      : [
                          AppColors.primary,
                          Colors.blue.shade800,
                          AppColors.primary,
                          Colors.blue.shade800,
                          AppColors.primary
                        ],
                  transform: GradientRotation(
                    _animationController.value * 2 * math.pi,
                  ),
                ),
              ),
              child: child,
            );
          },
          child: cardContent,
        ),
      );
    }

    return GestureDetector(
      onTap: () => setState(() => _selectedPlanId = id),
      child: cardContent,
    );
  }

  Widget _buildFooter(bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101922) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [

            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              shadowColor: AppColors.primary.withValues(alpha: 0.4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 20),
                SizedBox(width: 8),
                Text(
                  'Pay with Telebirr / Chapa',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'By subscribing, you agree to our Terms of Service. Secure encrypted payment processing.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentLogo(String url) {
    return Container(
      height: 24,
      width: 64,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.contain,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
        ),
      ),
    );
  }
}
