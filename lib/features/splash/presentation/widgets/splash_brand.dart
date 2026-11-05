import 'package:flutter/material.dart';

class SplashBrand extends StatelessWidget {
  const SplashBrand({required this.name, required this.tagline, super.key});

  final String name;
  final String tagline;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            height: 36 / 30,
            letterSpacing: -.75,
            color: colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          tagline,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            height: 16 / 12,
            letterSpacing: .3,
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
