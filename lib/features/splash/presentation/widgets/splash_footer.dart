import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({
    required this.loadingMessage,
    required this.verse,
    required this.version,
    super.key,
  });

  final String loadingMessage;
  final String verse;
  final String version;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 192.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999.r),
            child: LinearProgressIndicator(
              value: null,
              minHeight: 3.h,
              backgroundColor: colors.outline,
              valueColor: AlwaysStoppedAnimation<Color>(colors.secondary),
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          loadingMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            height: 16 / 12,
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 31.h),
        Divider(color: colors.outline, height: 1.h),
        SizedBox(height: 17.h),
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Text(
              version,
              style: TextStyle(
                fontSize: 10.sp,
                height: 1.5,
                color: colors.onSurfaceVariant,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                verse,
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12.sp,
                  height: 1.5,
                  color: colors.onSurface,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
