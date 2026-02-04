import 'package:fast_tenders/core/providers/tender_provider.dart';
import 'package:fast_tenders/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import '../core/providers/locale_provider.dart';
import 'package:fast_tenders/core/constants/app_colors.dart';
import 'package:share_plus/share_plus.dart';
import '../core/services/gemini_service.dart';

class TenderDetailScreen extends ConsumerStatefulWidget {
  final List<Tender> tenders;
  final int initialIndex;

  const TenderDetailScreen({
    super.key,
    required this.tenders,
    required this.initialIndex,
  });

  @override
  ConsumerState<TenderDetailScreen> createState() => _TenderDetailScreenState();
}

class _TenderDetailScreenState extends ConsumerState<TenderDetailScreen> {
  late int currentIndex;
  bool isSaving = false;
  // Track alert status per tender ID
  final Map<String, bool> _alertStates = {};
  // Cache for AI summaries
  final Map<String, String> _aiSummaries = {};
  bool _isGeneratingSummary = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) => _generateAiSummary());
  }

  Tender get tender => widget.tenders[currentIndex];
  bool get isAlertSet => _alertStates[tender.id] ?? false;

  Future<void> _generateAiSummary() async {
    if (_aiSummaries.containsKey(tender.id)) return;

    final langCode = ref.read(localeProvider).languageCode;
    setState(() => _isGeneratingSummary = true);
    try {
      final geminiService = ref.read(geminiServiceProvider);
      // We combine all available data for the best summary
      final textToSummarize = '''
Organization: ${tender.getOrganization(langCode)}
Title: ${tender.getTitle(langCode)}
Location: ${tender.getLocation(langCode)}
Category: ${tender.category}
Deadline: ${DateFormat('MMM dd, yyyy').format(tender.deadline)}
Description: ${tender.getDescription(langCode)}
''';
      final summary = await geminiService.summarizeTender(textToSummarize);
      setState(() {
        _aiSummaries[tender.id] = summary;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.aiSummaryError)),
        );
      }
    } finally {
      if (mounted) setState(() => _isGeneratingSummary = false);
    }
  }

  Future<void> _toggleSave() async {
    final user = ref.read(currentUserProvider).value;
    final l10n = AppLocalizations.of(context)!;
    if (user == null) return;

    setState(() => isSaving = true);
    try {
      await ref
          .read(tenderRepositoryProvider)
          .toggleSaveTender(user.id, tender.id);

      // Refresh the saved tenders list
      ref.invalidate(savedTendersProvider);

      // We need a way to refresh the UI state.
      // For simplicity in this demo, we'll just force a rebuild.
      setState(() {});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.tenderBookmarkUpdated)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.errorWithCount(e.toString()))));
      }
    } finally {
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = ref.watch(localeProvider);
    final langCode = locale.languageCode;
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;

    final description = tender.getDescription(langCode);
    // ignore: avoid_print
    print('DEBUG: Tender ID: ${tender.id}');
    // ignore: avoid_print
    print('DEBUG: LangCode: $langCode');
    // ignore: avoid_print
    print('DEBUG: Raw Description field: ${tender.description}');
    // ignore: avoid_print
    print('DEBUG: Calculated Description: $description');

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark
            ? theme.scaffoldBackgroundColor
            : AppColors.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          l10n.tendersTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white),
            onPressed: () {
              final summary = _aiSummaries[tender.id];
              final aiSummaryText =
                  (summary != null && summary.isNotEmpty)
                      ? "\n\nAI Summary:\n$summary"
                      : "";
              final text =
                  "${tender.getOrganization(langCode)}\n${tender.getTitle(langCode)}\nDeadline: ${DateFormat('MMM dd, yyyy').format(tender.deadline)}$aiSummaryText";
              Share.share(text);
            },
          ),
          const SizedBox(width: 8),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Summary Section
            _buildAiSummarySection(context, tender, langCode),

            // Description Section
            _buildDescriptionSection(context, tender, langCode),

            // Historical Winning Prices (PRO)
            _buildHistoricalPrices(context),

            const SizedBox(height: 100), // Space for bottom bar
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActionBar(context, l10n),
    );
  }

  Widget _buildAiSummarySection(
    BuildContext context,
    Tender tender,
    String langCode,
  ) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final summary = _aiSummaries[tender.id];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: AppColors.accent, size: 20),
              const SizedBox(width: 8),
              Text(
                l10n.aiSummaryTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.1),
                  AppColors.accent.withValues(alpha: 0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: AppColors.accent.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (summary != null) ...[
                    Text(
                      summary,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 4),
                    Text(
                      l10n.aiSummaryDisclaimer,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: theme.hintColor,
                        fontSize: 10,
                      ),
                    ),
                  ] else ...[
                    Center(
                      child: _isGeneratingSummary
                          ? Column(
                              children: [
                                const CircularProgressIndicator(strokeWidth: 2),
                                const SizedBox(height: 12),
                                Text(l10n.generatingSummary),
                              ],
                            )
                          : ElevatedButton.icon(
                              onPressed: _generateAiSummary,
                              icon: const Icon(Icons.auto_awesome, size: 18),
                              label: Text(l10n.generateSummary),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(
    BuildContext context,
    Tender tender,
    String langCode,
  ) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final description = tender.getDescription(langCode);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.descriptionTitle,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description.isNotEmpty ? description : l10n.noDescriptionAvailable,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              fontSize: 15,
              color: theme.textTheme.bodyMedium?.color?.withValues(
                alpha: description.isNotEmpty ? 0.9 : 0.5,
              ),
              fontStyle: description.isNotEmpty ? null : FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricalPrices(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.historicalWinningPrices,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  l10n.proLabel,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 180,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: theme.dividerColor.withValues(alpha: 0.1),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildBar(context, 0.4),
                          _buildBar(context, 0.7),
                          _buildBar(context, 0.3),
                          _buildBar(context, 0.9),
                          _buildBar(context, 0.6),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2020",
                          style: TextStyle(
                            fontSize: 10,
                            color: theme.hintColor,
                          ),
                        ),
                        Text(
                          "2021",
                          style: TextStyle(
                            fontSize: 10,
                            color: theme.hintColor,
                          ),
                        ),
                        Text(
                          "2022",
                          style: TextStyle(
                            fontSize: 10,
                            color: theme.hintColor,
                          ),
                        ),
                        Text(
                          "2023",
                          style: TextStyle(
                            fontSize: 10,
                            color: theme.hintColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Blurred Overlay
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.1),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF101922,
                            ).withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                l10n.unlockMarketInsights,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shape: const StadiumBorder(),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.comingSoon,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context, double heightFactor) {
    final theme = Theme.of(context);
    return Container(
      width: 30,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.3),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      ),
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.6),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: currentIndex > 0
                  ? () {
                      setState(() => currentIndex--);
                      _generateAiSummary();
                    }
                  : null,
              icon: Icon(
                Icons.arrow_back_ios,
                color: currentIndex > 0
                    ? theme.colorScheme.onSurface
                    : theme.disabledColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FutureBuilder<bool>(
                future: () async {
                  final user = ref.read(currentUserProvider).value;
                  if (user == null) return false;
                  return ref
                      .read(tenderRepositoryProvider)
                      .isTenderSaved(user.id, tender.id);
                }(),
                builder: (context, snapshot) {
                  final isSaved = snapshot.data ?? false;
                  return OutlinedButton.icon(
                    onPressed: isSaving ? null : _toggleSave,
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_outline,
                    ),
                    label: Text(isSaved ? l10n.saved : l10n.save),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary,
                      side: BorderSide(color: theme.colorScheme.primary),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () {
                setState(() {
                  _alertStates[tender.id] = !isAlertSet;
                });
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isAlertSet
                          ? l10n.alertsSetForTender
                          : l10n.alertsDisabled,
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isAlertSet
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 1,
                  ),
                  boxShadow: isAlertSet
                      ? [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  isAlertSet
                      ? Icons.notifications_active
                      : Icons.notifications_none,
                  color: isAlertSet ? Colors.white : theme.colorScheme.primary,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: currentIndex < widget.tenders.length - 1
                  ? () {
                      setState(() => currentIndex++);
                      _generateAiSummary();
                    }
                  : null,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: currentIndex < widget.tenders.length - 1
                    ? theme.colorScheme.onSurface
                    : theme.disabledColor,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
