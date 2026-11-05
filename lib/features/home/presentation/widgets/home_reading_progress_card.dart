import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/widgets/app_screen.dart';
import 'package:thawab/features/home/data/models/home_dashboard_model.dart';
import 'package:thawab/features/home/presentation/manager/home_cubit/home_cubit.dart';

class HomeReadingProgressCard extends StatelessWidget {
  const HomeReadingProgressCard({
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
          emptyMessage: 'سيظهر تقدم القراءة بعد تحميله.',
        ),
      );
    }

    final dashboard = summary!;
    return FlatCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dashboard.readingResume),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: dashboard.readingProgress.clamp(0, 1),
            minHeight: 5,
            backgroundColor: Theme.of(context)
                .colorScheme
                .surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${(dashboard.readingProgress * 100).round()}%'),
              TextButton(
                onPressed: () => context.push(AppRoutes.kQuranReaderView),
                child: const Text('أكمل القراءة'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
