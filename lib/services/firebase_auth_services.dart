import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/services/toast_message_services.dart';

class UserAuthentication {
  static Future<UserCredential?> createAccount(BuildContext context, String email, String pass) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      CustomToastMessage().show(context, 'Account created successfully', true);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomToastMessage().show(context, 'The password provided is too weak.', false);
      } else if (e.code == 'email-already-in-use') {
        CustomToastMessage().show(context, 'The account already exists for that email.', false);
      } else {
        CustomToastMessage().show(context, e.message ?? 'An unknown error occurred', false);
      }
    } catch (e) {
      CustomToastMessage().show(context, 'An error occurred: $e', false);
    }
    return null;
  }

  static Future<UserCredential?> signInAccount (BuildContext context,String email, String pass) async{

    UserCredential? userCredential;
    try{
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCredential;
    } on FirebaseException catch (e){
      CustomToastMessage().show(context, e.toString(), false);
    }
    return null;
  }

  static Future<Void?> forgotPassword(BuildContext context, String email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      CustomToastMessage().show(context, 'Success ! Please check your email and reset', true);
    }on FirebaseException catch(e){
      CustomToastMessage().show(context, e.toString(), false);
    }
    return null;
  }
}
