import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/splash_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: _lightThemeData(),
      // darkTheme:_darkThemeData() ,
      themeMode: ThemeMode.system,
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          )),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
          letterSpacing: .4,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
// ThemeData _darkThemeData(){
//
// }
}
