import 'package:flutter/material.dart';
import 'package:flutter_auth/services/firebase_auth_services.dart';
import 'package:flutter_auth/services/toast_message_services.dart';
import 'package:flutter_auth/styles/text_styles.dart';
import 'package:flutter_auth/widgets/edit_text.dart';
import 'package:flutter_auth/widgets/my_button.dart';
import 'package:flutter_auth/widgets/text_icon_box.dart';
import 'package:flutter_auth/widgets/toast_message.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: devicePadding.top, bottom: devicePadding.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height - devicePadding.top - devicePadding.bottom,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Column(
                  children: [
                    Text('Create a Free Account', style: h1Text),
                    SizedBox(height: 8,),
                    Text('Fill up this form and continue', style: h4Text),
                    SizedBox(height: 15),
                    CustomEditText(obscureText: false,textEditingController: _nameController,
                        type: TextInputType.text,icon: Icons.person, hint: 'Full Name'),
                    SizedBox(height: 8),
                    CustomEditText(obscureText: false,textEditingController: _emailController,type: TextInputType.emailAddress,icon: Icons.email, hint: 'E-mail'),
                    SizedBox(height: 8),
                    CustomEditText(obscureText: false,textEditingController: _userController,type: TextInputType.text,icon: Icons.person, hint: 'Username'),
                    SizedBox(height: 8),
                    CustomEditText(obscureText: true,textEditingController: _passController,type: TextInputType.text,icon: Icons.lock, hint: 'Password'),
                    SizedBox(height: 15),
                  ],
                ),
                MyButton(
                  onTap: () {
                    String email = _emailController.text.trim();
                    String password = _passController.text.trim();
                    if(email.isNotEmpty && password.isNotEmpty){
                      UserAuthentication.createAccount(context, email, password);
                    }else{
                      CustomToastMessage().show(context, 'Please enter valid email and pass', false);
                    }
                  },
                  text: 'Sign Up',
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                   const  SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.end,
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconBoxText(icon: FontAwesomeIcons.facebook),
                    SizedBox(width: 8),
                    CustomIconBoxText(icon: FontAwesomeIcons.google),
                    SizedBox(width: 8),
                    CustomIconBoxText(icon: FontAwesomeIcons.apple),
                  ],
                ),
                SizedBox(height: 15), // Extra space to prevent overflow
              ],
            ),
          ),
        ),
      ),
    );
  }
}
