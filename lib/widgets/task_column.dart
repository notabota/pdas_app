import 'package:flutter/material.dart';

class TaskColumn extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  TaskColumn({
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 60.0,
          backgroundColor: iconBackgroundColor,
          child: Icon(
            icon,
            size: 70.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins-Bold',
                color: Colors.white70,
              ),
            ),
          ],
        )
      ],
    );
  }
}
