import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/signup_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

import 'email_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
            Text('Get started with',
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: _emailTEController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _passwordTEController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
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
              child: TextButton(
                onPressed: () {
                  _onTapForgetPassword();
                },
                child: Text('Forget Password?'),
              ),
            ),
            _buildSignInSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInSection() {
    return Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black.withOpacity(.8),
                  fontWeight: FontWeight.w600,
                  letterSpacing: .4,
                ),
                text: 'Don\'t you have account?',
                children: [
                  TextSpan(
                    text: ' SignUp',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                       _onTapSignUpButton();


                      },
                  ),
                ],
              ),
            ),
          );
  }
  void _onTapSignUpButton(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupScreen(),
      ),
    );
  }
  void _onTapForgetPassword(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerificationScreen(),
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
