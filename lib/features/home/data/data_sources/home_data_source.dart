import 'package:thawab/features/home/data/models/home_dashboard_model.dart';
import 'package:thawab/features/prayer/domain/repositories/prayer_repository.dart';
import 'package:thawab/features/quran/domain/repositories/quran_reading_progress_repository.dart';

abstract class HomeDataSource {
  Future<List<HomeDashboardModel>> fetch();
}

class PrayerHomeDataSource implements HomeDataSource {
  const PrayerHomeDataSource({
    required this.prayerRepository,
    required this.readingProgressRepository,
  });

  final PrayerRepository prayerRepository;
  final QuranReadingProgressRepository readingProgressRepository;

  @override
  Future<List<HomeDashboardModel>> fetch() async {
    final result = await prayerRepository.fetch();
    final readingProgress = await readingProgressRepository.fetch();
    return result.fold(
      (_) => throw StateError('Prayer summary is unavailable'),
      (schedules) => schedules
          .map(
            (schedule) => HomeDashboardModel(
              hijriDate: schedule.hijriDate,
              nextPrayer: schedule.nextPrayerLabel,
              prayerTime: schedule.prayers
                  .firstWhere(
                    (prayer) => prayer.name == schedule.nextPrayerLabel,
                  )
                  .time,
              remainingTime: schedule.countdown,
              readingResume: readingProgress?.surahName,
              readingProgress: readingProgress?.progress,
              readingPageNumber: readingProgress?.pageNumber,
            ),
          )
          .toList(),
    );
  }
}
