import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:thawab/features/azkar/data/models/azkar_category_model.dart';
import 'package:thawab/features/azkar/data/models/zikr_session_model.dart';

abstract class AzkarDataSource {
  Future<List<AzkarCategoryModel>> fetchCategories();
  Future<List<ZikrSessionModel>> fetchSession();
}

class LocalAzkarDataSource implements AzkarDataSource {
  LocalAzkarDataSource({AssetBundle? assetBundle})
    : _assetBundle = assetBundle ?? rootBundle;

  static const String _assetPath = 'assets/hisn-al-muslim.json';

  final AssetBundle _assetBundle;
  late final Future<_AzkarDataset> _dataset = _loadDataset();

  @override
  Future<List<AzkarCategoryModel>> fetchCategories() async =>
      (await _dataset).categories;

  @override
  Future<List<ZikrSessionModel>> fetchSession() async =>
      (await _dataset).sessions;

  Future<_AzkarDataset> _loadDataset() async {
    final source = await _assetBundle.loadString(_assetPath);
    final data = jsonDecode(source) as Map<String, dynamic>;
    final categories = <AzkarCategoryModel>[];
    final sessions = <ZikrSessionModel>[];

    for (final entry in data.entries) {
      final category = entry.value as Map<String, dynamic>;
      final adhkar = category[HisnAlMuslimKey.adhkar] as List<dynamic>;
      categories.add(
        AzkarCategoryModel(
          id: entry.key,
          name: entry.key,
          entryCount: adhkar.length,
        ),
      );
      for (final item in adhkar) {
        final zikr = item as Map<String, dynamic>;
        sessions.add(
          ZikrSessionModel(
            categoryId: entry.key,
            text: zikr[HisnAlMuslimKey.text] as String,
            target: (zikr[HisnAlMuslimKey.count] as num).toInt(),
          ),
        );
      }
    }

    return _AzkarDataset(
      categories: List<AzkarCategoryModel>.unmodifiable(categories),
      sessions: List<ZikrSessionModel>.unmodifiable(sessions),
    );
  }
}

abstract class HisnAlMuslimKey {
  static const String adhkar = 'Adhkar';
  static const String text = 'Text';
  static const String count = 'Count';
}

class _AzkarDataset {
  const _AzkarDataset({required this.categories, required this.sessions});

  final List<AzkarCategoryModel> categories;
  final List<ZikrSessionModel> sessions;
}
