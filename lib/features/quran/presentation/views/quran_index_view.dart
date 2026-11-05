import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/features/quran/presentation/manager/surah_cubit/surah_cubit.dart';
import 'package:thawab/features/quran/domain/entities/surah_entity.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class QuranIndexView extends StatefulWidget {
  const QuranIndexView({super.key, this.surahs = const []});

  final List<SurahEntity> surahs;

  @override
  State<QuranIndexView> createState() => _QuranIndexViewState();
}

class _QuranIndexViewState extends State<QuranIndexView> {
  String _query = '';

  @override
  Widget build(BuildContext context) => BlocBuilder<SurahCubit, SurahState>(
    builder: (context, state) {
      final strings = S.of(context);
      final loadedSurahs = state is SurahSuccess && state.items.isNotEmpty
          ? state.items
          : widget.surahs;
      final surahs = loadedSurahs.where((item) => item.name.contains(_query));
      return AppScreen(
        title: strings.quranIndexTitle,
        bottomNavigationBar: const AppBottomBar(
          index: AppNavigationIndex.quran,
        ),
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: strings.surahSearchHint,
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            onChanged: (value) => setState(() => _query = value),
          ),
          SectionTitle(
            strings.quranSurahs,
            trailing: Text('(${strings.surahCount(surahs.length)})'),
          ),
          if (surahs.isEmpty)
            FlatCard(
              child: ContentStateMessage(
                isLoading: state is SurahLoading || state is SurahInitial,
                errorMessage: state is SurahFailure ? state.message : null,
                emptyMessage: strings.quranSurahsUnavailable,
              ),
            )
          else
            ...surahs.map(
              (surah) => Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () =>
                      context.push(AppRoutes.kQuranReaderView, extra: surah),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 18.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: Text(
                            '${surah.number}',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                surah.name,
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${switch (surah.revelationType) {
                                  'Meccan' => strings.meccan,
                                  'Medinan' => strings.medinan,
                                  _ => surah.revelationType,
                                }} · ${strings.verseCount(surah.verseCount)}',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_left,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
