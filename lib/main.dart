import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'screens/player_list_screen.dart';
import 'package:hive_flutter/hive_flutter.dart'; // ✅ this defines initFlutter


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Hive for local storage
  await Hive.initFlutter();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coach Desk',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
