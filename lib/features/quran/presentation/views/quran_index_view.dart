import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thawab/core/routing/app_routes.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/features/quran/presentation/manager/surah_cubit/surah_cubit.dart';
import 'package:thawab/features/quran/data/models/surah_model.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class QuranIndexView extends StatefulWidget {
  const QuranIndexView({super.key, this.surahs = const []});

  final List<SurahModel> surahs;

  @override
  State<QuranIndexView> createState() => _QuranIndexViewState();
}

class _QuranIndexViewState extends State<QuranIndexView> {
  String _query = '';

  @override
  Widget build(BuildContext context) => BlocBuilder<SurahCubit, SurahState>(
    builder: (context, state) {
      final loadedSurahs = state is SurahSuccess && state.items.isNotEmpty
          ? state.items
          : widget.surahs;
      final surahs = loadedSurahs.where((item) => item.name.contains(_query));
      return AppScreen(
        title: 'فهرس السور',
        bottomNavigationBar: const AppBottomBar(index: 0),
        children: [
          TextField(
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'ابحث عن سورة أو آية...',
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
            onChanged: (value) => setState(() => _query = value),
          ),
          SectionTitle(
            'سور القرآن الكريم',
            trailing: Text('(${surahs.length} سورة)'),
          ),
          if (surahs.isEmpty)
            FlatCard(
              child: ContentStateMessage(
                isLoading: state is SurahLoading || state is SurahInitial,
                errorMessage: state is SurahFailure ? state.message : null,
                emptyMessage: 'ستظهر السور بعد تحميل بيانات المصحف.',
              ),
            )
          else
            ...surahs.map(
              (surah) => Card(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () =>
                      context.push(AppRoutes.kQuranReaderView, extra: surah),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.quranSurface,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            '${surah.number}',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                surah.name,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${surah.revelationType} · ${surah.verseCount} آية',
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
