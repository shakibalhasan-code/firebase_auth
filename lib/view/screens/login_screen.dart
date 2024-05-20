import 'package:flutter/material.dart';
import 'package:flutter_auth/styles/text_styles.dart';
import 'package:flutter_auth/view/screens/signup_screen.dart';
import 'package:flutter_auth/widgets/edit_text.dart';
import 'package:flutter_auth/widgets/my_button.dart';
import 'package:flutter_auth/widgets/toast_message.dart';
import 'package:flutter_auth/widgets/white_rounded_shape.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back',style: h1Text,),
              Text('Sign in to continue',style: h4Text,),
              SizedBox(height: 15,),
              CustomEditText(icon: Icons.person,hint: 'Username'),
              SizedBox(height: 8,),
              CustomEditText(icon: Icons.key,hint: 'Password'),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password?',textAlign: TextAlign.end,style: TextStyle(
                    color: Colors.blue,fontWeight: FontWeight.w300
                  ),),

                ],
              ),
              SizedBox(height: 15,),
              MyButton(onTap:(){
                CustomToastMessage.show(context, 'Logged In Successfully');
              },text: 'LOGIN', color: Colors.blueAccent),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.w300
                  ),),
                  SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                    child: Text('Create an account',textAlign: TextAlign.end,style: TextStyle(color:Colors.blue,fontWeight: FontWeight.w300
                    ),),
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


