import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final readingResume = dashboard.readingResume;
    final readingProgress = dashboard.readingProgress;
    if (readingResume == null || readingProgress == null) {
      return FlatCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.readingProgressUnavailable),
            SizedBox(height: 8.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () => _openReader(context),
                child: Text(strings.continueReading),
              ),
            ),
          ],
        ),
      );
    }
    return FlatCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(readingResume),
          SizedBox(height: 12.h),
          LinearProgressIndicator(
            value: readingProgress.clamp(0, 1).toDouble(),
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
              Text('${(readingProgress * 100).round()}%'),
              TextButton(
                onPressed: () =>
                    _openReader(context, dashboard.readingPageNumber),
                child: Text(strings.continueReading),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openReader(BuildContext context, [int? pageNumber]) async {
    await context.push(AppRoutes.kQuranReaderView, extra: pageNumber);
    if (context.mounted) context.read<HomeCubit>().fetch();
  }
}
