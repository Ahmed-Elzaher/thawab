import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashOrnamentalDivider extends StatelessWidget {
  const SplashOrnamentalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 44.w,
          child: Divider(color: colors.outline),
        ),
        SizedBox(width: 8.w),
        Transform.rotate(
          angle: .785398,
          child: SizedBox(
            width: 6.w,
            height: 6.h,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.surface,
                border: Border.all(color: colors.secondary),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        SizedBox(
          width: 44.w,
          child: Divider(color: colors.outline),
        ),
      ],
    );
  }
}
