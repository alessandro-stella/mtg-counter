import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  const CenterButton({super.key, required this.icon, required this.f});

  final IconData icon;
  final f;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: const CircleBorder()),
        onPressed: f,
        child: Icon(
          icon,
          color: Colors.black,
          size: 40,
        ));
  }
}
