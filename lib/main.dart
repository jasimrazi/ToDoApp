import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/screens/bottomnavbar.dart';
import 'package:todoapp/provider/database_provider.dart';
import 'package:todoapp/utils/contants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBServiceProvider().openMyDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DBServiceProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: kSecondary),
          home: BottomNavBar()),
    );
  }
}
