import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/widgets/app_screen.dart';
import 'package:thawab/features/home/domain/entities/home_dashboard_entity.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';

class HomeDailySummaryCard extends StatelessWidget {
  const HomeDailySummaryCard({
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
          emptyMessage: strings.homeDailyUnavailable,
        ),
      );
    }

    final dashboard = summary!;
    return FlatCard(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Theme.of(context).colorScheme.secondary,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  strings.homePrayerLabel,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Icon(
                Icons.circle,
                size: 10.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  dashboard.nextPrayer,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                dashboard.prayerTime,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            dashboard.hijriDate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 2,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                dashboard.remainingTime,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
