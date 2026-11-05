import 'package:flutter/material.dart';
import 'package:thawab/core/utils/app_colors.dart';

class GoldIcon extends StatelessWidget {
  const GoldIcon(this.icon, {super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: 22,
    backgroundColor: AppColors.accentGold.withValues(alpha: .12),
    child: Icon(icon, color: AppColors.accentGold),
  );
}
