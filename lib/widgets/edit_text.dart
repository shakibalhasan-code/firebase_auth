import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType type;
  final TextEditingController textEditingController;
  final bool obscureText;
  const CustomEditText({super.key, required this.icon, required this.hint, required this.type, required this.textEditingController, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: TextField(
          keyboardType: type,
          controller: textEditingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            icon: Icon(icon,color: Colors.blueGrey,),
            border: InputBorder.none


          ),
        ),
      ),
    );
  }
}
