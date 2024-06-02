import 'package:flutter/material.dart';
import 'package:gratitude_journal/models/journal_entry.dart';
import 'package:gratitude_journal/pages/splash_screen/start_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('mybox');

  runApp(
    ChangeNotifierProvider(
        create: (context) => JournalEntry(), child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
