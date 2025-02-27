import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
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
            Text('Join With Us', style: Theme.of(context).textTheme.titleLarge),
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
              controller: _firstNameTEController,
              decoration: InputDecoration(
                hintText: 'First Name',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _lastNameTEController,
              decoration: InputDecoration(
                hintText: 'Last Name',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: _mobileTEController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Mobile',
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
                      recognizer: TapGestureRecognizer()..onTap = () {
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
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    super.dispose();
  }
}
