import 'package:flutter/material.dart';
import 'package:thawab/core/widgets/app_screen.dart';
import 'package:thawab/features/home/data/models/home_dashboard_model.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';

class HomeDailySummaryCard extends StatelessWidget {
  const HomeDailySummaryCard({
    super.key,
    required this.summary,
    required this.state,
  });

  final HomeDashboardModel? summary;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    if (summary == null) {
      return FlatCard(
        child: ContentStateMessage(
          isLoading: state is HomeLoading || state is HomeInitial,
          errorMessage: state is HomeFailure
              ? (state as HomeFailure).message
              : null,
          emptyMessage: 'ستظهر بيانات اليوم بعد تحميلها.',
        ),
      );
    }

    final dashboard = summary!;
    return FlatCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'الصلاة القادمة',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Icon(
                Icons.circle,
                size: 10,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  dashboard.nextPrayer,
                  textAlign: TextAlign.right,
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
          const SizedBox(height: 6),
          Text(
            dashboard.hijriDate,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 2,
                ),
              ),
              const SizedBox(width: 8),
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
