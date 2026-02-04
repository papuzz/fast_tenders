import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:core/core.dart';
import 'package:fast_tenders/l10n/app_localizations.dart';

class CorporateTeamManagementScreen extends ConsumerStatefulWidget {
  const CorporateTeamManagementScreen({super.key});

  @override
  ConsumerState<CorporateTeamManagementScreen> createState() =>
      _CorporateTeamManagementScreenState();
}

class _CorporateTeamManagementScreenState
    extends ConsumerState<CorporateTeamManagementScreen> {
  // Colors from the HTML
  static const Color _primaryColor = Color(0xFF137FEC);
  static const Color _bgLight = Color(0xFFF6F7F8);
  static const Color _bgDark = Color(0xFF101922);
  static const Color _cardDark = Color(0xFF1C2127);

  final TextEditingController _inviteController = TextEditingController();

  @override
  void dispose() {
    _inviteController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date, String locale) {
    return DateFormat.yMMMd(locale).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? _bgDark : _bgLight;
    final textColor = isDark ? Colors.white : Colors.grey[900];
    final subTextColor = isDark ? const Color(0xFF9DABB9) : Colors.grey[500];
    final cardColor = isDark ? _cardDark : Colors.white;
    final borderColor = isDark ? Colors.grey[800]! : Colors.grey[200]!;

    final planAsync = ref.watch(corporatePlanProvider);
    final membersAsync = ref.watch(teamMembersProvider);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: planAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('${l10n.errorWithCount(err.toString())}')),
              data: (plan) {
                return membersAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('${l10n.errorWithCount(err.toString())}')),
                  data: (members) {
                    final activeMembers = members
                        .where((m) => m.status == 'active')
                        .toList();
                    final pendingMembers = members
                        .where((m) => m.status == 'pending')
                        .toList();
                    final usedSlots = members.length;
                    final availableSlots = plan.maxSeats - usedSlots;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header
                        _buildHeader(context, isDark, l10n),

                        // Active Plan Card
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: borderColor),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                // Gradient Banner
                                Container(
                                  height: 96,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        _primaryColor,
                                        Color(0xFF0E5DB3)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withValues(alpha: 0.2),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Icon(
                                                Icons.corporate_fare,
                                                color: Colors.white,
                                                size: 32,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Card Content
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            l10n.activePlan,
                                            style: const TextStyle(
                                              color: _primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green
                                                  .withValues(alpha: 0.1),
                                              border: Border.all(
                                                color: Colors.green
                                                    .withValues(alpha: 0.2),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                            ),
                                            child: Text(
                                              l10n.active,
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        plan.name,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      // Progress Bar
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            l10n.seatAllocation,
                                            style: TextStyle(
                                              color: subTextColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '$usedSlots / ${plan.maxSeats} ${l10n.used}',
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(999),
                                        child: LinearProgressIndicator(
                                          value: usedSlots / plan.maxSeats,
                                          backgroundColor: isDark
                                              ? const Color(0xFF3B4754)
                                              : Colors.grey[200],
                                          color: _primaryColor,
                                          minHeight: 8,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        l10n.renewsOn(_formatDate(plan.renewalDate, Localizations.localeOf(context).toString())),
                                        style: TextStyle(
                                          color: isDark
                                              ? const Color(0xFF6A7A8A)
                                              : Colors.grey[400],
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () =>
                                            context.push('/membership'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _primaryColor,
                                          foregroundColor: Colors.white,
                                          minimumSize:
                                              const Size(double.infinity, 48),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.refresh, size: 18),
                                            const SizedBox(width: 8),
                                            Text(
                                              l10n.upgradeOrRenew,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Team Members Header
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.teamMembers,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                l10n.manageAccessSlots(plan.maxSeats),
                                style: TextStyle(
                                    color: subTextColor, fontSize: 12),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Team Members List
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              // Active Members
                              ...activeMembers.map((member) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: _buildMemberCard(
                                      context,
                                      isDark,
                                      name: member.name,
                                      email: member.email,
                                      role: member.role,
                                      imageUrl: member.avatarUrl ??
                                          'https://via.placeholder.com/150',
                                      isOnline: member.isOnline,
                                      cardColor: cardColor,
                                      borderColor: borderColor,
                                      textColor: textColor!,
                                      subTextColor: subTextColor!,
                                    ),
                                  )),

                              // Invite Slot (First Empty Slot)
                              if (availableSlots > 0)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: _buildInviteSlot(
                                    context,
                                    isDark,
                                    l10n,
                                    controller: _inviteController,
                                    slotName:
                                        l10n.slotAvailable(usedSlots + 1),
                                    cardColor: cardColor,
                                    borderColor: borderColor,
                                    textColor: textColor!,
                                    subTextColor: subTextColor!,
                                  ),
                                ),

                              // Locked Slots (Remaining Empty Slots)
                              if (availableSlots > 1)
                                ...List.generate(
                                  availableSlots - 1,
                                  (index) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: _buildLockedSlot(
                                      context,
                                      isDark,
                                      l10n,
                                      slotName:
                                          l10n.slotAvailable(usedSlots + 2 + index),
                                      cardColor: cardColor,
                                      borderColor: borderColor,
                                      textColor: textColor!,
                                      subTextColor: subTextColor!,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Recent Activity / Pending Invites
                        if (pendingMembers.isNotEmpty) ...[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      l10n.pendingStatus,
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    Icon(Icons.info_outline,
                                        color: subTextColor, size: 20),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                ...pendingMembers.map((member) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: cardColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border:
                                              Border.all(color: borderColor),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                color: Colors.amber
                                                    .withValues(alpha: 0.1),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.pending_outlined,
                                                color: Colors.amber,
                                                size: 16,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    member.email,
                                                    style: TextStyle(
                                                      color: textColor,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    l10n.invitePending,
                                                    style: TextStyle(
                                                      color: subTextColor,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(
                                                            corporateRepositoryProvider)
                                                        .resendInvitation(
                                                            member.email);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            l10n.invitationResent),
                                                        duration: const Duration(
                                                            seconds: 2),
                                                      ),
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        _primaryColor
                                                            .withValues(
                                                                alpha: 0.1),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    minimumSize: Size.zero,
                                                    tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    l10n.resend,
                                                    style: const TextStyle(
                                                      color: _primaryColor,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                TextButton(
                                                  onPressed: () {
                                                    ref
                                                        .read(
                                                            corporateRepositoryProvider)
                                                        .cancelInvitation(
                                                            member.email);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            l10n.invitationCancelled),
                                                        duration: const Duration(
                                                            seconds: 2),
                                                      ),
                                                    );
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4,
                                                    ),
                                                    minimumSize: Size.zero,
                                                    tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                  ),
                                                  child: Text(
                                                    l10n.cancel,
                                                    style: TextStyle(
                                                      color: Colors.red
                                                          .withValues(
                                                              alpha: 0.8),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ],

                        // Info Section
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _primaryColor.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: _primaryColor.withValues(alpha: 0.1),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.groups,
                                  color: _primaryColor,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10n.collaborativeTendering,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        l10n.collaborativeTenderingDesc,
                                        style: TextStyle(
                                          color: subTextColor,
                                          fontSize: 12,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Footer
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            l10n.ethiopianMarketEnterprise,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark, AppLocalizations l10n) {
    return Container(
      color: isDark
          ? _bgDark.withValues(alpha: 0.8)
          : _bgLight.withValues(alpha: 0.8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: _primaryColor,
                  size: 20,
                ),
                Text(
                  l10n.back,
                  style: const TextStyle(
                    color: _primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            l10n.teamManagementTitle,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.grey[900],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 40), // Spacer
        ],
      ),
    );
  }

  Widget _buildMemberCard(
    BuildContext context,
    bool isDark, {
    required String name,
    required String email,
    required String role,
    required String imageUrl,
    required bool isOnline,
    required Color cardColor,
    required Color borderColor,
    required Color textColor,
    required Color subTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _primaryColor, width: 2),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (role == 'ADMIN')
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.verified,
                      color: _primaryColor,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        role,
                        style: const TextStyle(
                          color: _primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  email,
                  style: TextStyle(color: subTextColor, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (isOnline)
            Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInviteSlot(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n, {
    required String slotName,
    required Color cardColor,
    required Color borderColor,
    required Color textColor,
    required Color subTextColor,
    TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _primaryColor.withValues(alpha: 0.4),
          style:
              BorderStyle.solid, // Dashed not directly supported by Border.all
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF111418) : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_add,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slotName,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      l10n.inviteViaEmailPhone,
                      style: TextStyle(color: subTextColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF111418) : Colors.grey[50],
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: l10n.emailPhoneHint,
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(bottom: 8),
                    ),
                    style: TextStyle(color: textColor, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (controller != null && controller.text.isNotEmpty) {
                    // Call the repository to invite
                    // For now, just show snackbar as implementation is mock
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.inviteSentTo(controller.text)),
                        backgroundColor: Colors.green,
                      ),
                    );
                    controller.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.enterEmailPhoneError),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  elevation: 2,
                ),
                child: Text(
                  l10n.invite,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail_outline, size: 14, color: Colors.grey[400]),
              const SizedBox(width: 4),
              Text(
                l10n.email,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(height: 12, width: 1, color: Colors.grey[700]),
              ),
              Icon(Icons.phone_iphone, size: 14, color: Colors.grey[400]),
              const SizedBox(width: 4),
              Text(
                l10n.phoneWithPrefix,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLockedSlot(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n, {
    required String slotName,
    required Color cardColor,
    required Color borderColor,
    required Color textColor,
    required Color subTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Opacity(
        opacity: 0.75,
        child: Row(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF111418) : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person_add, color: Colors.grey, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slotName,
                    style: TextStyle(
                      color: subTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    l10n.inviteThirdMember,
                    style: TextStyle(
                      color: isDark
                          ? const Color(0xFF6A7A8A)
                          : Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.slot3Config),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Text(
                l10n.add,
                style: const TextStyle(
                  color: _primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}