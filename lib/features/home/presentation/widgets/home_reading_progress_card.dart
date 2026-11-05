import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/widgets/app_screen.dart';
import 'package:thawab/features/home/domain/entities/home_dashboard_entity.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';

class HomeReadingProgressCard extends StatelessWidget {
  const HomeReadingProgressCard({
    super.key,
    required this.summary,
    required this.state,
  });

  final HomeDashboardEntity? summary;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);
    if (summary == null) {
      return FlatCard(
        child: ContentStateMessage(
          isLoading: state is HomeLoading || state is HomeInitial,
          errorMessage: state is HomeFailure
              ? (state as HomeFailure).message
              : null,
          emptyMessage: strings.readingProgressUnavailable,
        ),
      );
    }

    final dashboard = summary!;
    return FlatCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dashboard.readingResume),
          SizedBox(height: 12.h),
          LinearProgressIndicator(
            value: dashboard.readingProgress.clamp(0, 1),
            minHeight: 5.h,
            backgroundColor: Theme.of(context)
                .colorScheme
                .surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${(dashboard.readingProgress * 100).round()}%'),
              TextButton(
                onPressed: () => context.push(AppRoutes.kQuranReaderView),
                child: Text(strings.continueReading),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
