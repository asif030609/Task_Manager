
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/auth/signin_screen.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

import '../../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _MoveToNextScreen();
    super.initState();

  }

  Future<void> _MoveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: SvgPicture.asset(
            Assets.images.logo,
            width: 140,
          ),
        ),
      ),
    );
  }
}
