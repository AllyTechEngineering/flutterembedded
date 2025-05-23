import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterembedded/features/crew_mode/crew_mode_screen.dart';
import 'package:flutterembedded/features/crew_mode/product_select_screen.dart';
import 'package:flutterembedded/features/crew_mode/select_shelf_screen.dart';
import 'package:flutterembedded/features/help/help_screen.dart';
import 'package:flutterembedded/features/home/home_screen';
import 'package:flutterembedded/features/startup/control_on_screen.dart';
import 'package:flutterembedded/features/startup/preheat_screen.dart';
import 'package:flutterembedded/features/startup/startup_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterembedded/utils/custom_app_theme.dart';

void main() {
  runApp(const FlutterEmbeddedApp());
}

class FlutterEmbeddedApp extends StatelessWidget {
  const FlutterEmbeddedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Embedded UI',
      theme: CustomAppTheme.appTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      locale: const Locale('en'), // or use device locale
      initialRoute: '/home',
      routes: {
        '/startup': (context) => const StartupScreen(),
        '/product-select': (context) => const ProductSelectScreen(),
        '/crew': (context) => const CrewModeScreen(),
        '/home': (context) => const HomeScreen(),
        '/help': (context) => const HelpScreen(),
        '/control-on': (context) => const ControlOnScreen(),
        '/preheat': (context) => const PreheatScreen(),
        '/select-shelf': (context) => const SelectShelfScreen(),
      },
    );
  }
}
