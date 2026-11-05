import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thawab/core/utils/app_spacing.dart';

export 'package:thawab/core/widgets/app_bottom_bar.dart';
export 'package:thawab/core/widgets/content_state_message.dart';
export 'package:thawab/core/widgets/flat_card.dart';
export 'package:thawab/core/widgets/gold_icon.dart';
export 'package:thawab/core/widgets/section_title.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.title,
    required this.children,
    this.action,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  final String title;
  final List<Widget> children;
  final Widget? action;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: backgroundColor,
    appBar: AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      actions: action == null ? null : [action!],
    ),
    body: SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.contentMaxWidth,
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.screenHorizontal.w,
              AppSpacing.screenTop.h,
              AppSpacing.screenHorizontal.w,
              AppSpacing.screenBottom.h,
            ),
            children: children,
          ),
        ),
      ),
    ),
    bottomNavigationBar: bottomNavigationBar,
  );
}
