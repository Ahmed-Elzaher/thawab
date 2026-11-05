import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/functions/localize_prayer_name.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/core/utils/app_spacing.dart';
import 'package:thawab/features/prayer/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:thawab/features/prayer/domain/entities/prayer_schedule_entity.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key, this.schedule});

  final PrayerScheduleEntity? schedule;

  @override
  Widget build(BuildContext context) => BlocBuilder<PrayerCubit, PrayerState>(
    builder: (context, state) {
      final strings = S.of(context);
      final loadedSchedule = state is PrayerSuccess && state.items.isNotEmpty
          ? state.items.first
          : schedule;
      final localizedNextPrayer = loadedSchedule == null
          ? strings.nextPrayer
          : localizePrayerName(strings, loadedSchedule.nextPrayerLabel);
      return AppScreen(
        title: strings.prayerTitle,
        bottomNavigationBar: const AppBottomBar(
          index: AppNavigationIndex.prayer,
        ),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        action: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: strings.refreshPrayerTimes,
              onPressed: () => context.read<PrayerCubit>().fetch(),
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              tooltip: strings.settings,
              onPressed: () => context.push(AppRoutes.kSettingsView),
              icon: const Icon(Icons.tune),
            ),
          ],
        ),
        children: [
          FlatCard(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              loadedSchedule?.location ??
                                  strings.locationUnavailable,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        localizedNextPrayer,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        loadedSchedule?.countdown ??
                            strings.prayerDurationUnavailable,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.access_time,
                  size: 42.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
          SectionTitle(strings.todayPrayers),
          if (loadedSchedule == null || loadedSchedule.prayers.isEmpty)
            FlatCard(
              child: ContentStateMessage(
                isLoading: state is PrayerLoading || state is PrayerInitial,
                errorMessage: state is PrayerFailure ? state.message : null,
                emptyMessage: strings.prayerTimesUnavailable,
              ),
            )
          else
            FlatCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (
                    var index = 0;
                    index < loadedSchedule.prayers.length;
                    index++
                  ) ...[
                    if (index > 0) Divider(height: 1.h),
                    Builder(
                      builder: (context) {
                        final prayer = loadedSchedule.prayers[index];
                        final isUpcoming =
                            prayer.name == loadedSchedule.nextPrayerLabel;
                        return ListTile(
                          title: Text(
                            localizePrayerName(strings, prayer.name),
                            style: TextStyle(
                              fontWeight: isUpcoming
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isUpcoming
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
                          ),
                          leading: Icon(
                            isUpcoming
                                ? Icons.notifications_active_outlined
                                : Icons.notifications_none_outlined,
                            color: isUpcoming
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                          ),
                          trailing: Text(
                            prayer.time,
                            textDirection: TextDirection.ltr,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          SectionTitle(strings.qiblaDirection),
          FlatCard(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    strings.qiblaDirection,
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 22.h),
                SizedBox(
                  width: math.min(220.w, AppSpacing.featureArtworkMaxSize),
                  height: math.min(220.w, AppSpacing.featureArtworkMaxSize),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                      Container(
                        width: math.min(
                          140.w,
                          AppSpacing.featureArtworkMaxSize * .64,
                        ),
                        height: math.min(
                          140.w,
                          AppSpacing.featureArtworkMaxSize * .64,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.explore_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              loadedSchedule?.qiblaDirection ?? '—',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
