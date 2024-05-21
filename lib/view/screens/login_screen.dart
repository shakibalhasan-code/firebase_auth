import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/firebase_auth_services.dart';
import 'package:flutter_auth/styles/text_styles.dart';
import 'package:flutter_auth/view/screens/forgot_screen.dart';
import 'package:flutter_auth/view/screens/signup_screen.dart';
import 'package:flutter_auth/widgets/edit_text.dart';
import 'package:flutter_auth/widgets/my_button.dart';
import 'package:flutter_auth/widgets/toast_message.dart';

import '../../services/toast_message_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();

  }
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back', style: h1Text),
              const SizedBox(height: 8),
              Text('Sign in to continue', style: h4Text),
              const SizedBox(height: 15),
              CustomEditText(
                obscureText: false,
                textEditingController: _emailController,
                type: TextInputType.emailAddress,
                icon: Icons.person,
                hint: 'E-mail',
              ),
              const SizedBox(height: 8),
              CustomEditText(
                textEditingController: _passController,
                type: TextInputType.text,
                obscureText: true,
                icon: Icons.key,
                hint: 'Password',
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotScreen()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              MyButton(
                onTap: () {
                  String email = _emailController.text.trim();
                  String pass = _passController.text.trim();
                  if (email.isNotEmpty && pass.isNotEmpty) {
                    UserAuthentication.signInAccount(context, email, pass);
                  } else {
                    CustomToastMessage().show(context, 'Please enter email and password', false);
                  }
                },
                text: 'LOGIN',
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      'Create an account',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
