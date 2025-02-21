import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/data/db/database_config.dart';
import 'package:liga_play/presentation/routes.dart';
import 'package:liga_play/presentation/screens/select_team_screen.dart';
import 'package:liga_play/presentation/screens/standings_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
@riverpod
String helloWorld(Ref ref) {
  return 'Hello Pikcahu';
}

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0D1B1E),
        // Fondo principal
        hintColor: Color(0xFF00A896),
        // Color de acento
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF00A896),
            // Texto del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFF0F3BD), fontSize: 18),
          // Texto principal
          bodyMedium: TextStyle(
              color: Color(0xFF99C1B9), fontSize: 16), // Texto secundario
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1A2B2E),
          // Fondo del campo de entrada
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF99C1B9)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF99C1B9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF00A896)),
          ),
          labelStyle: TextStyle(color: Color(0xFF99C1B9)),
          hintStyle: TextStyle(color: Color(0xFF99C1B9)),
        ),
      ),
      initialRoute: getInitialRoute(),
      routes: routes,
    );
  }

  getInitialRoute() {
    final standings = DatabaseConfig.loadStandings();
    return standings.isEmpty ? SelectTeamScreen.route : StandingsScreen.route;
  }
}
