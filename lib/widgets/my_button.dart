import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  const MyButton({super.key, required this.text, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            text,textAlign: TextAlign.center,style: TextStyle(
            fontSize: 18,color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
