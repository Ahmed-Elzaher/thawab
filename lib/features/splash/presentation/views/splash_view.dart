import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/utils/app_constants.dart';
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
                    left: (width - _logoSize) / 2,
                    child: const SplashLogo(size: _logoSize),
                  ),
                  Positioned(
                    top: height * .415,
                    left: 24,
                    right: 24,
                    child: SplashBrand(
                      name: AppConstants.appNameArabic,
                      tagline: AppConstants.appTagline,
                    ),
                  ),
                  Positioned(
                    top: height * .51,
                    left: 0,
                    right: 0,
                    child: const SplashOrnamentalDivider(),
                  ),
                  Positioned(
                    left: 40,
                    right: 40,
                    bottom: 60,
                    child: SplashFooter(
                      loadingMessage: AppConstants.splashLoadingMessage,
                      verse: AppConstants.splashVerse,
                      version: AppConstants.appVersion,
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
