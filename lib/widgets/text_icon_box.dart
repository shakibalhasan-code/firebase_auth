import 'package:flutter/material.dart';

class CustomIconBoxText extends StatelessWidget {
  final IconData icon;
  const CustomIconBoxText({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1,color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(icon),
      ),
    );
  }
}
