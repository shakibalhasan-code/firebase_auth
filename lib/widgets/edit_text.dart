import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  final IconData icon;
  final String hint;
  const CustomEditText({super.key, required this.icon, required this.hint});

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
