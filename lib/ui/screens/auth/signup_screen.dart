import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/constant/app_constant.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/network_caller/networ_caller.dart';
import 'package:task_manager/data/utilities/urls.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _registrationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
              ),
              Text('Join With Us',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your email";
                  }
                  if (AppConstant.RegExpEmail.hasMatch(value) == false) {
                    return "Enter a valid email";
                  }
                  return null;
                },
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your first name";
                  }
                  return null;
                },
                controller: _firstNameTEController,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your last name";
                  }
                  return null;
                },
                controller: _lastNameTEController,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter your phone number";
                  }
                  return null;
                },
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
                obscureText: _showPassword == false,
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter a password";
                  }
                  return null;
                },
                controller: _passwordTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _showPassword = !_showPassword;
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    icon: Icon(_showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Visibility(
                visible: _registrationInProgress == false,
                replacement: Center(
                  child: const CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _registerUser();
                    }
                  },
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
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
      ),
    );
  }

  Future<void> _registerUser() async {
    _registrationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    NetworkResponse response =
        await NetWorkCaller.postRequest(Urls.registration, body: requestInput);

    _registrationInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      _clearTextFields();
      if (mounted) {
        showSnackBarMessage(context, 'Registration Success');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Registration failed');
      }
    }
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
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
