import 'package:flutter/material.dart';

class SplashCornerFramePainter extends CustomPainter {
  const SplashCornerFramePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: .6)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const inset = 24.0;
    const top = 32.0;
    const corner = 64.0;
    const bottom = 48.0;
    final right = size.width - inset;
    final lower = size.height - bottom;

    canvas
      ..drawLine(
        const Offset(inset, top + corner),
        const Offset(inset, top),
        paint,
      )
      ..drawLine(
        const Offset(inset, top),
        const Offset(inset + corner, top),
        paint,
      )
      ..drawLine(Offset(right - corner, top), Offset(right, top), paint)
      ..drawLine(Offset(right, top), Offset(right, top + corner), paint)
      ..drawLine(Offset(inset, lower - corner), Offset(inset, lower), paint)
      ..drawLine(Offset(inset, lower), Offset(inset + corner, lower), paint)
      ..drawLine(Offset(right - corner, lower), Offset(right, lower), paint)
      ..drawLine(Offset(right, lower - corner), Offset(right, lower), paint);
  }

  @override
  bool shouldRepaint(covariant SplashCornerFramePainter oldDelegate) =>
      oldDelegate.color != color;
}
