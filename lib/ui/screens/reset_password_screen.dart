import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/signin_screen.dart';
import 'package:task_manager/ui/screens/signup_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

import 'pin_verification_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _confirmpasswordTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            Text('Set Password',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 8,
            ),
            Text('Minimum length of password should be more than 6 letter and'
                'combination of letter and numbers',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: _passwordTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _confirmpasswordTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                _onTapConfirmButton();
              },
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w600,
                    letterSpacing: .4,
                  ),
                  text: 'Have account?',
                  children: [
                    TextSpan(
                      text: ' Sign In',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _onTapSignInButton();
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }
  void _onTapConfirmButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false);
  }
  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmpasswordTEController.dispose();
    super.dispose();
  }
}
