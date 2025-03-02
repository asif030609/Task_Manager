import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';

import '../../../constant/app_constant.dart';
import '../../utility/app_colors.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppbar(context, true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Update Profile',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 24,
              ),
              _photoPickerWidget(),
              SizedBox(
                height: 8,
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
                    icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _photoPickerWidget() {
    return Container(
            height: 48,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4)),
                color: Colors.black38,
              ),
              alignment: Alignment.center,
              child: Text(
                'Photo',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
              ),
            ),
          );
  }
}
