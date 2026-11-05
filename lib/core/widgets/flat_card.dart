import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thawab/core/utils/app_spacing.dart';

class FlatCard extends StatelessWidget {
  const FlatCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: padding ?? EdgeInsets.all(AppSpacing.cardPadding.r),
      child: child,
    ),
  );
}
