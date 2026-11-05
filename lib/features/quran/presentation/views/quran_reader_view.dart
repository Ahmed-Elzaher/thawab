import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:thawab/core/utils/app_navigation_index.dart';
import 'package:thawab/core/widgets/app_screen.dart';
import 'package:thawab/features/quran/domain/entities/quran_page_entity.dart';
import 'package:thawab/features/quran/domain/entities/quran_reading_progress_entity.dart';
import 'package:thawab/features/quran/domain/entities/surah_entity.dart';
import 'package:thawab/features/quran/presentation/manager/quran_page_cubit/quran_page_cubit.dart';
import 'package:thawab/l10n/generated/app_localizations.dart';

class QuranReaderView extends StatefulWidget {
  const QuranReaderView({
    super.key,
    required this.onOpenIndex,
    this.page,
    this.surah,
    this.initialPageNumber,
  });

  final VoidCallback onOpenIndex;
  final QuranPageEntity? page;
  final SurahEntity? surah;
  final int? initialPageNumber;

  @override
  State<QuranReaderView> createState() => _QuranReaderViewState();
}

class _QuranReaderViewState extends State<QuranReaderView> {
  int _pageIndex = 0;

  @override
  void didUpdateWidget(covariant QuranReaderView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.surah?.number != widget.surah?.number) {
      _pageIndex = 0;
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) => BlocBuilder<QuranPageCubit, QuranPageState>(
    builder: (context, state) {
      final strings = S.of(context);
      final pages = state is QuranPageSuccess
          ? state.items
          : const <QuranPageEntity>[];
      final matchingPages = widget.surah == null
          ? pages
          : pages
                .where(
                  (item) => item.verses.any(
                    (verse) => verse.surahNumber == widget.surah!.number,
                  ),
                )
                .toList();
      final savedPageIndex = matchingPages.indexWhere(
        (item) => item.pageNumber == widget.initialPageNumber,
      );
      final selectedPageIndex = matchingPages.isEmpty
          ? 0
          : _pageIndex == 0 && savedPageIndex >= 0
          ? savedPageIndex
          : _pageIndex.clamp(0, matchingPages.length - 1).toInt();
      final loadedPage =
          widget.page ??
          (matchingPages.isEmpty ? null : matchingPages[selectedPageIndex]);

      return AppScreen(
        title: widget.surah?.name ?? strings.quranReaderTitle,
        bottomNavigationBar: const AppBottomBar(
          index: AppNavigationIndex.quran,
        ),
        action: IconButton(
          tooltip: strings.surahIndexTooltip,
          onPressed: widget.onOpenIndex,
          icon: const Icon(Icons.format_list_bulleted),
        ),
        children: [
          FlatCard(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(loadedPage?.surahName ?? widget.surah?.name ?? '—'),
                    Text(loadedPage?.pageNumber.toString() ?? '—'),
                  ],
                ),
                Divider(height: 32.h),
                if (loadedPage == null || loadedPage.verses.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.h),
                    child: ContentStateMessage(
                      isLoading:
                          state is QuranPageLoading ||
                          state is QuranPageInitial,
                      errorMessage: state is QuranPageFailure
                          ? state.message
                          : null,
                      emptyMessage: strings.versesUnavailable,
                    ),
                  )
                else
                  Text.rich(
                    TextSpan(
                      children: [
                        for (final verse in loadedPage.verses) ...[
                          TextSpan(text: verse.text),
                          TextSpan(
                            text:
                                ' ﴿${intl.NumberFormat.decimalPattern(Localizations.localeOf(context).languageCode).format(verse.verseNumber)}﴾ ',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 19.sp,
                            ),
                          ),
                        ],
                      ],
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 25.sp, height: 2.1),
                  ),
              ],
            ),
          ),
          if (widget.page == null && matchingPages.length > 1)
            FlatCard(
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    tooltip: strings.previousPage,
                    onPressed: selectedPageIndex == 0
                        ? null
                        : () => _openPage(
                            context,
                            selectedPageIndex - 1,
                            matchingPages,
                          ),
                    icon: const Icon(Icons.chevron_right),
                  ),
                  Text(
                    strings.quranPageIndicator(
                      selectedPageIndex + 1,
                      matchingPages.length,
                    ),
                  ),
                  IconButton(
                    tooltip: strings.nextPage,
                    onPressed: selectedPageIndex == matchingPages.length - 1
                        ? null
                        : () => _openPage(
                            context,
                            selectedPageIndex + 1,
                            matchingPages,
                          ),
                    icon: const Icon(Icons.chevron_left),
                  ),
                ],
              ),
            ),
          SectionTitle(strings.readingTools),
          FlatCard(child: Text(strings.readingToolsUnavailable)),
          SizedBox(height: 16.h),
          OutlinedButton.icon(
            onPressed: widget.onOpenIndex,
            icon: const Icon(Icons.menu_book),
            label: Text(strings.browseSurahs),
          ),
        ],
      );
    },
  );

  void _openPage(BuildContext context, int index, List<QuranPageEntity> pages) {
    final page = pages[index];
    setState(() => _pageIndex = index);
    unawaited(
      context.read<QuranPageCubit>().saveReadingProgress(
        QuranReadingProgressEntity(
          pageNumber: page.pageNumber,
          surahName: page.surahName,
        ),
      ),
    );
  }
}
