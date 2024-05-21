import 'package:flutter/material.dart';

class MyOutLineButton extends StatelessWidget {
  final String text;
  final Color color,textColor;
  final VoidCallback onTap;
  const MyOutLineButton({super.key, required this.text, required this.color, required this.onTap, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5,color: color),
          borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            text,textAlign: TextAlign.center,style: TextStyle(
              fontSize: 18,color: textColor,
              fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
