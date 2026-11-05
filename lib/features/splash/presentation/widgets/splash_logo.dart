import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/thawab_app_icon.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
