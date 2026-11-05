import 'package:flutter/services.dart';
import 'package:thawab/features/quran/data/models/quran_page_model.dart';
import 'package:thawab/features/quran/data/models/quran_verse_model.dart';
import 'package:thawab/features/quran/data/models/surah_model.dart';

abstract class QuranDataSource {
  Future<List<QuranPageModel>> fetchPages();
  Future<List<SurahModel>> fetchSurahs();
}

class LocalQuranDataSource implements QuranDataSource {
  LocalQuranDataSource({AssetBundle? assetBundle})
    : _assetBundle = assetBundle ?? rootBundle;

  static const String _quranTextAsset = 'assets/quran-uthmani.txt';
  static const String _quranMetadataAsset = 'assets/quran-data.xml';

  final AssetBundle _assetBundle;
  late final Future<_QuranDataset> _dataset = _loadDataset();

  @override
  Future<List<QuranPageModel>> fetchPages() async => (await _dataset).pages;

  @override
  Future<List<SurahModel>> fetchSurahs() async => (await _dataset).surahs;

  Future<_QuranDataset> _loadDataset() async {
    final text = await _assetBundle.loadString(_quranTextAsset);
    final metadata = await _assetBundle.loadString(_quranMetadataAsset);
    final surahs = _parseSurahs(metadata);
    final verses = <_QuranVerse>[];
    final verseStartIndices = <String, int>{};

    for (final line in text.split('\n')) {
      final trimmedLine = line.trim();
      if (trimmedLine.isEmpty || trimmedLine.startsWith('#')) continue;

      final fields = trimmedLine.split('|');
      if (fields.length != 3) {
        throw const FormatException('Invalid Tanzil Quran text row.');
      }

      final surahNumber = int.parse(fields[0]);
      final verseNumber = int.parse(fields[1]);
      verseStartIndices['$surahNumber:$verseNumber'] = verses.length;
      verses.add(
        _QuranVerse(
          surahNumber: surahNumber,
          verseNumber: verseNumber,
          text: fields[2],
        ),
      );
    }

    final pageStarts = _parsePageStarts(metadata, verseStartIndices);
    final pages = <QuranPageModel>[];
    for (var index = 0; index < pageStarts.length; index++) {
      final start = pageStarts[index];
      final end = index + 1 < pageStarts.length
          ? pageStarts[index + 1].verseIndex
          : verses.length;
      pages.add(
        QuranPageModel(
          surahName: surahs[start.surahNumber - 1].name,
          pageNumber: start.pageNumber,
          verses: verses
              .sublist(start.verseIndex, end)
              .map(
                (verse) => QuranVerseModel(
                  surahNumber: verse.surahNumber,
                  verseNumber: verse.verseNumber,
                  text: verse.text,
                ),
              )
              .toList(growable: false),
        ),
      );
    }

    return _QuranDataset(
      pages: List<QuranPageModel>.unmodifiable(pages),
      surahs: List<SurahModel>.unmodifiable(surahs),
    );
  }

  List<SurahModel> _parseSurahs(String metadata) {
    final surahPattern = RegExp(
      r'<sura index="(\d+)" ayas="(\d+)"[^>]*name="([^"]+)"[^>]*type="([^"]+)"',
    );
    return surahPattern.allMatches(metadata).map((match) {
      return SurahModel(
        number: int.parse(match.group(1)!),
        verseCount: int.parse(match.group(2)!),
        name: match.group(3)!,
        revelationType: match.group(4)!,
      );
    }).toList(growable: false);
  }

  List<_QuranPageStart> _parsePageStarts(
    String metadata,
    Map<String, int> verseStartIndices,
  ) {
    final pagePattern = RegExp(
      r'<page index="(\d+)" sura="(\d+)" aya="(\d+)"',
    );
    return pagePattern.allMatches(metadata).map((match) {
      final pageNumber = int.parse(match.group(1)!);
      final surahNumber = int.parse(match.group(2)!);
      final verseNumber = int.parse(match.group(3)!);
      final verseIndex = verseStartIndices['$surahNumber:$verseNumber'];
      if (verseIndex == null) {
        throw FormatException(
          'Tanzil page $pageNumber points to a missing verse.',
        );
      }
      return _QuranPageStart(
        pageNumber: pageNumber,
        surahNumber: surahNumber,
        verseIndex: verseIndex,
      );
    }).toList(growable: false);
  }
}

class _QuranDataset {
  const _QuranDataset({required this.pages, required this.surahs});

  final List<QuranPageModel> pages;
  final List<SurahModel> surahs;
}

class _QuranVerse {
  const _QuranVerse({
    required this.surahNumber,
    required this.verseNumber,
    required this.text,
  });

  final int surahNumber;
  final int verseNumber;
  final String text;
}

class _QuranPageStart {
  const _QuranPageStart({
    required this.pageNumber,
    required this.surahNumber,
    required this.verseIndex,
  });

  final int pageNumber;
  final int surahNumber;
  final int verseIndex;
}
