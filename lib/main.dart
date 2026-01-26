import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/constants/app_theme.dart';
import 'core/navigation/app_router.dart';
import 'core/providers/locale_provider.dart';
import 'core/providers/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:core/core.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseClientWrapper.initialize(
    url: 'https://sqbqjagpflsynyzbpbtg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxYnFqYWdwZmxzeW55emJwYnRnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg0NTc1OTgsImV4cCI6MjA4NDAzMzU5OH0.Mg6wVqSD0ZHnCeIrL_Wt-URc_mvkj-l0UEximp_HvnY',
  );

  runApp(const ProviderScope(child: TenderWinApp()));
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class TenderWinApp extends ConsumerWidget {
  const TenderWinApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'TenderWin Ethiopia',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('am'), // Amharic
      ],
    );
  }
}
