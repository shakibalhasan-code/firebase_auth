import 'package:flutter/material.dart';
import 'package:flutter_auth/services/firebase_auth_services.dart';
import 'package:flutter_auth/styles/text_styles.dart';
import 'package:flutter_auth/view/screens/login_screen.dart';
import 'package:flutter_auth/view/screens/signup_screen.dart';
import 'package:flutter_auth/widgets/edit_text.dart';
import 'package:flutter_auth/widgets/my_button.dart';
import 'package:flutter_auth/widgets/outline_button.dart';
import 'package:flutter_auth/widgets/toast_message.dart';
import 'package:flutter_auth/widgets/white_rounded_shape.dart';
import 'package:toastification/toastification.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    final TextEditingController _emailController = TextEditingController();
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Forgot Your Password ?',style: h1Text,),
              const SizedBox(height: 8,),
              const Text('No worry, just type your email address and hit enter',style: h4Text,),
              const SizedBox(height: 15,),
              CustomEditText(obscureText: false,textEditingController: _emailController,type: TextInputType.emailAddress,icon: Icons.email,hint: 'e-mail'),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyButton(onTap:(){
                      String email = _emailController.text.trim();
                      UserAuthentication.forgotPassword(context, email);
                    },text: 'Request Password', color: Colors.blueAccent),
                  ),
                 const  SizedBox(width: 5,),
                  Expanded(
                    child: MyOutLineButton(onTap:(){
                      Navigator.pop(context);
                    },
                        text: 'Login Now',
                        textColor: Colors.blue,
                        color: Colors.blue.withOpacity(0.2)),
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


