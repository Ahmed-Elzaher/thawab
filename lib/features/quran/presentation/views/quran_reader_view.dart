import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thawab/core/utils/app_colors.dart';
import 'package:thawab/features/quran/presentation/manager/quran_page_cubit/quran_page_cubit.dart';
import 'package:thawab/features/quran/data/models/quran_page_model.dart';
import 'package:thawab/features/quran/data/models/surah_model.dart';
import 'package:thawab/core/widgets/app_screen.dart';

class QuranReaderView extends StatelessWidget {
  const QuranReaderView({
    super.key,
    required this.onOpenIndex,
    this.page,
    this.surah,
  });

  final VoidCallback onOpenIndex;
  final QuranPageModel? page;
  final SurahModel? surah;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<QuranPageCubit, QuranPageState>(
        builder: (context, state) {
          final pages = state is QuranPageSuccess
              ? state.items
              : const <QuranPageModel>[];
          final matchingPages = surah == null
              ? pages
              : pages.where((item) => item.surahName == surah!.name);
          final loadedPage =
              page ?? (matchingPages.isEmpty ? null : matchingPages.first);
          return AppScreen(
            title: surah?.name ?? 'المصحف الشريف',
            bottomNavigationBar: const AppBottomBar(index: 0),
            backgroundColor: AppColors.prayerBackground,
            action: IconButton(
              tooltip: 'فهرس السور',
              onPressed: onOpenIndex,
              icon: const Icon(Icons.format_list_bulleted),
            ),
            children: [
              FlatCard(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(loadedPage?.surahName ?? surah?.name ?? '—'),
                        Text(loadedPage?.pageNumber.toString() ?? '—'),
                      ],
                    ),
                    const Divider(height: 32),
                    if (loadedPage == null || loadedPage.verses.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48),
                        child: ContentStateMessage(
                          isLoading:
                              state is QuranPageLoading ||
                              state is QuranPageInitial,
                          errorMessage: state is QuranPageFailure
                              ? state.message
                              : null,
                          emptyMessage:
                              'ستظهر الآيات هنا بعد تحميل بيانات المصحف.',
                        ),
                      )
                    else
                      Text(
                        loadedPage.verses.join(' ۞ '),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 25, height: 2.1),
                      ),
                  ],
                ),
              ),
              const SectionTitle('أدوات القراءة'),
              const FlatCard(
                child: Text('تتوفر أدوات القراءة بعد تحميل بيانات الصفحة.'),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: onOpenIndex,
                icon: const Icon(Icons.menu_book),
                label: const Text('تصفح فهرس السور'),
              ),
            ],
          );
        },
      );
}
