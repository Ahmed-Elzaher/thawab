import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/features/prayer/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:thawab/features/prayer/data/models/prayer_schedule_model.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key, this.schedule});

  final PrayerScheduleModel? schedule;

  @override
  Widget build(BuildContext context) => BlocBuilder<PrayerCubit, PrayerState>(
    builder: (context, state) {
      final loadedSchedule = state is PrayerSuccess && state.items.isNotEmpty
          ? state.items.first
          : schedule;
      return AppScreen(
        title: 'مواقيت الصلاة',
        bottomNavigationBar: const AppBottomBar(index: 1),
        backgroundColor: AppColors.prayerBackground,
        action: IconButton(
          tooltip: 'الإعدادات',
          onPressed: () => context.push(AppRoutes.kSettingsView),
          icon: const Icon(Icons.tune),
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
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              loadedSchedule?.location ?? 'الموقع غير متاح',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        loadedSchedule?.nextPrayerLabel ?? 'الصلاة القادمة',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        loadedSchedule?.countdown ??
                            'ستظهر المدة بعد تحميل المواقيت.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.access_time,
                  size: 42,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
          const SectionTitle('مواقيت اليوم'),
          if (loadedSchedule == null || loadedSchedule.prayers.isEmpty)
            FlatCard(
              child: ContentStateMessage(
                isLoading: state is PrayerLoading || state is PrayerInitial,
                errorMessage: state is PrayerFailure ? state.message : null,
                emptyMessage: 'ستظهر مواقيت الصلاة بعد ربط مصدرها.',
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
                    if (index > 0) const Divider(height: 1),
                    Builder(
                      builder: (context) {
                        final prayer = loadedSchedule.prayers[index];
                        final isUpcoming =
                            prayer.name == loadedSchedule.nextPrayerLabel;
                        return ListTile(
                          title: Text(
                            prayer.name,
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
          const SectionTitle('اتجاه القبلة'),
          FlatCard(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'اتجاه القبلة',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: 220,
                  height: 220,
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
                        width: 140,
                        height: 140,
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
                            const SizedBox(height: 8),
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
