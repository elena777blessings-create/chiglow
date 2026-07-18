import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/room_scan_screen.dart';
import 'screens/room_results_screen.dart';
import 'screens/zodiac_profile_screen.dart';
import 'screens/year_ahead_screen.dart';
import 'screens/compass_screen.dart';
import 'screens/color_coaching_screen.dart';
import 'screens/energy_dashboard_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/upgrade_screen.dart';
import 'screens/scan_guide_screen.dart';
import 'screens/harmony_journal_screen.dart';
import 'screens/journal_detail_screen.dart';
import 'screens/fortune_screen.dart';
import 'providers/app_state_provider.dart';
import 'providers/purchase_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseProvider()..initialize()),
      ],
      child: const ChiGlowApp(),
    ),
  );
}

class ChiGlowApp extends StatelessWidget {
  const ChiGlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChiGlow',
      debugShowCheckedModeBanner: false,
      theme: ChiGlowTheme.lightTheme,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/splash':
            page = const SplashScreen();
            break;
          case '/home':
            page = const HomeScreen();
            break;
          case '/room-scan':
            page = const RoomScanScreen();
            break;
          case '/scan-guide':
            page = const ScanGuideScreen();
            break;
          case '/harmony-journal':
            page = const HarmonyJournalScreen();
            break;
          case '/journal-detail':
            final entry = (settings.arguments as Map?)?['entry'];
            page = JournalDetailScreen(entry: entry);
            break;
          case '/room-results':
            page = RoomResultsScreen(
              roomType: (settings.arguments as Map?)?['roomType'] as String? ?? 'Living Room',
              scanImagePath: (settings.arguments as Map?)?['imagePath'] as String?,
            );
            break;
          case '/zodiac-profile':
            page = const ZodiacProfileScreen();
            break;
          case '/year-ahead':
            page = const YearAheadScreen();
            break;
          case '/compass':
            page = const CompassScreen();
            break;
          case '/color-coaching':
            page = const ColorCoachingScreen();
            break;
          case '/energy-dashboard':
            page = const EnergyDashboardScreen();
            break;
          case '/settings':
            page = const SettingsScreen();
            break;
          case '/upgrade':
            page = const UpgradeScreen();
            break;
          case '/fortune':
            page = const FortuneScreen();
            break;
          default:
            page = const HomeScreen();
        }
        return _buildPageRoute(page, settings.name);
      },
    );
  }

  PageRouteBuilder _buildPageRoute(Widget page, String? routeName) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }
}