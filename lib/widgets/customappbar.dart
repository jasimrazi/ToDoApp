import 'package:flutter/material.dart';
import 'package:todoapp/utils/contants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
      backgroundColor: kPrimary,
      iconTheme: IconThemeData(color: kTertiary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
