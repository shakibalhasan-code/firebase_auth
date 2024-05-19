import 'package:flutter/material.dart';

class RoundedShapeChild extends StatelessWidget {
  final Widget child;
  const RoundedShapeChild({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
          child: child),
    );
  }
}
