import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/features/splash/presentation/widgets/splash_corner_frame.dart';
import 'package:thawab/features/splash/presentation/widgets/splash_brand.dart';
import 'package:thawab/features/splash/presentation/widgets/splash_footer.dart';
import 'package:thawab/features/splash/presentation/widgets/splash_logo.dart';
import 'package:thawab/features/splash/presentation/widgets/splash_ornamental_divider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  static const double _logoSize = 112;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(AppRoutes.kHomeView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final strings = S.of(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: SplashCornerFramePainter(
                          color: colors.outline,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * .245,
                    left: (width - _logoSize.w) / 2,
                    child: SplashLogo(size: _logoSize.w),
                  ),
                  Positioned(
                    top: height * .415,
                    left: 24.w,
                    right: 24.w,
                    child: SplashBrand(
                      name: strings.appName,
                      tagline: strings.appTagline,
                    ),
                  ),
                  Positioned(
                    top: height * .51,
                    left: 0,
                    right: 0,
                    child: const SplashOrnamentalDivider(),
                  ),
                  Positioned(
                    left: 40.w,
                    right: 40.w,
                    bottom: 60.h,
                    child: SplashFooter(
                      loadingMessage: strings.splashLoading,
                      verse: strings.splashVerse,
                      version: strings.appVersion,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
