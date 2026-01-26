import 'package:fast_tenders/core/utils/cpo_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/core.dart';
import '../../core/constants/app_colors.dart';
import '../core/utils/cpo_result_card.dart';
import '../l10n/app_localizations.dart';

class CpoCalculatorScreen extends StatefulWidget {
  const CpoCalculatorScreen({super.key});

  @override
  State<CpoCalculatorScreen> createState() => _CpoCalculatorScreenState();
}

class _CpoCalculatorScreenState extends State<CpoCalculatorScreen> {
  final _bidController = TextEditingController();
  final _valueController = TextEditingController(text: '1'); // Default 1%

  CpoType _selectedType = CpoType.percentage;
  double _calculatedCpo = 0;

  @override
  void initState() {
    super.initState();
    _bidController.addListener(_calculate);
    _valueController.addListener(_calculate);
  }

  @override
  void dispose() {
    _bidController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _calculate() {
    final bid = double.tryParse(_bidController.text.replaceAll(',', '')) ?? 0;
    final value =
        double.tryParse(_valueController.text.replaceAll(',', '')) ?? 0;

    setState(() {
      _calculatedCpo = CpoCalculator.calculate(
        bidAmount: bid,
        type: _selectedType,
        value: value,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.cpoCalcTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.cpoCalcDesc,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),

            // Bid Amount Input
            TextField(
              controller: _bidController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.totalBidAmount,
                prefixText: 'ETB ',
                helperText: AppLocalizations.of(context)!.bidAmountHelper,
              ),
            ),
            const SizedBox(height: 16),

            // Toggle Type
            Row(
              children: [
                Expanded(
                  child: RadioListTile<CpoType>(
                    title: Text(AppLocalizations.of(context)!.percentageLabel),
                    value: CpoType.percentage,
                    groupValue: _selectedType,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                        // Set default percentage if switching back
                        if (_valueController.text.isEmpty ||
                            double.tryParse(_valueController.text)! > 100) {
                          _valueController.text = '1';
                        }
                        _calculate();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<CpoType>(
                    title: Text(AppLocalizations.of(context)!.fixedAmountLabel),
                    value: CpoType.fixed,
                    groupValue: _selectedType,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                        _valueController.text = ''; // Clear for fixed input
                        _calculate();
                      });
                    },
                  ),
                ),
              ],
            ),

            // Value Input (Percentage or Fixed Amount)
            TextField(
              controller: _valueController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              ],
              decoration: InputDecoration(
                labelText: _selectedType == CpoType.percentage
                    ? AppLocalizations.of(context)!.percentage
                    : AppLocalizations.of(context)!.fixedAmountLabel,
                suffixText: _selectedType == CpoType.percentage ? '%' : 'ETB',
                prefixText: _selectedType == CpoType.fixed ? 'ETB ' : null,
              ),
            ),
            const SizedBox(height: 32),

            // Result
            CpoResultCard(amount: _calculatedCpo),

            const SizedBox(height: 24),

            // Action Button
            ElevatedButton.icon(
              onPressed: _calculatedCpo > 0
                  ? () {
                      // TODO: Generate PDF
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!.generatingCpo,
                          ),
                        ),
                      );
                    }
                  : null,
              icon: const Icon(Icons.picture_as_pdf),
              label: Text(AppLocalizations.of(context)!.generateCpoLetter),
            ),
          ],
        ),
      ),
    );
  }
}
