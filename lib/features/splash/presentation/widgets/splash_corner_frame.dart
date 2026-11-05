import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashCornerFramePainter extends CustomPainter {
  const SplashCornerFramePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: .6)
      ..strokeWidth = 1.r
      ..style = PaintingStyle.stroke;
    final inset = 24.w;
    final top = 32.h;
    final corner = 64.r;
    final bottom = 48.h;
    final right = size.width - inset;
    final lower = size.height - bottom;

    canvas
      ..drawLine(Offset(inset, top + corner), Offset(inset, top), paint)
      ..drawLine(Offset(inset, top), Offset(inset + corner, top), paint)
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
