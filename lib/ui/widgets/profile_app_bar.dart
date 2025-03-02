import 'package:flutter/material.dart';

import '../screens/auth/update_profile_screen.dart';
import '../utility/app_colors.dart';

AppBar ProfileAppbar(context,[bool fromUpdateProfile=false]) {
  return AppBar(
    title: GestureDetector(
      onTap: () {
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dummy Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            'email@gmail.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )
        ],
      ),
    ),
    actions: [
      Icon(Icons.logout_outlined),
    ],
    leading: GestureDetector(
      onTap: () {
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
    ),
    backgroundColor: AppColors.primaryColor,
  );
}