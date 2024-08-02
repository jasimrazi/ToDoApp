import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/task_provider.dart';
import 'package:todoapp/screens/bottomnavbar.dart';
import 'package:todoapp/utils/contants.dart';

void main() {
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
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: kSecondary),
          home: BottomNavBar()),
    );
  }
}
