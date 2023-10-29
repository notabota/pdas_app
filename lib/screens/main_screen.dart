import 'package:khkt2223/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:khkt2223/theme/colors/light_colors.dart';

import '../constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Fluttter show the back button automatically
        title: const Text("Kết quả kiểm tra"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
