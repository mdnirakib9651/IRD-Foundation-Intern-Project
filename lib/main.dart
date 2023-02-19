import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'data/provider/reminder_provider.dart';
import 'view/screen/dashboard/navigation_bar_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ReminderProvider>(create: (change) => ReminderProvider()),
    ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigationBarScreen(),
    );
  }
}
