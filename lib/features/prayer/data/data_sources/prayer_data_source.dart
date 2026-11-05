import 'dart:math' as math;

import 'package:intl/intl.dart';
import 'package:thawab/core/networking/api_consumer.dart';
import 'package:thawab/core/networking/api_end_points.dart';
import 'package:thawab/features/prayer/data/data_sources/device_location_data_source.dart';
import 'package:thawab/features/prayer/data/models/prayer_schedule_model.dart';
import 'package:thawab/features/prayer/data/models/prayer_time_model.dart';

abstract class PrayerDataSource {
  Future<List<PrayerScheduleModel>> fetch();
}

class AlAdhanPrayerDataSource implements PrayerDataSource {
  const AlAdhanPrayerDataSource({
    required this.apiConsumer,
    required this.locationDataSource,
  });

  final ApiConsumer apiConsumer;
  final DeviceLocationDataSource locationDataSource;

  @override
  Future<List<PrayerScheduleModel>> fetch() async {
    final position = await locationDataSource.getCurrentPosition();
    final date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final response = await apiConsumer.get(
      'timings/$date',
      queryParameters: {
        ApiKey.latitude: position.latitude,
        ApiKey.longitude: position.longitude,
      },
    );

    final responseData = response is Map<String, dynamic>
        ? response[ApiKey.data] as Map<String, dynamic>?
        : null;
    if (responseData == null) {
      throw const FormatException('Prayer timings are missing from response');
    }

    final timings = responseData[ApiKey.timings] as Map<String, dynamic>;
    final prayers = [
      _prayerTime(timings, ApiKey.fajr),
      _prayerTime(timings, ApiKey.sunrise),
      _prayerTime(timings, ApiKey.dhuhr),
      _prayerTime(timings, ApiKey.asr),
      _prayerTime(timings, ApiKey.maghrib),
      _prayerTime(timings, ApiKey.isha),
    ];
    final nextPrayer = _findNextPrayer(prayers, DateTime.now());
    final qiblaDirection = _qiblaBearing(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    final dateData = responseData[ApiKey.date] as Map<String, dynamic>;
    final hijriData = dateData[ApiKey.hijri] as Map<String, dynamic>;
    final meta = responseData[ApiKey.meta] as Map<String, dynamic>;

    return [
      PrayerScheduleModel(
        location: meta[ApiKey.timeZone] as String? ?? '',
        hijriDate: hijriData[ApiKey.hijriDate] as String? ?? '',
        nextPrayerLabel: nextPrayer.name,
        countdown: nextPrayer.countdown,
        prayers: prayers,
        qiblaDirection: '${qiblaDirection.toStringAsFixed(1)}°',
      ),
    ];
  }

  PrayerTimeModel _prayerTime(Map<String, dynamic> timings, String key) =>
      PrayerTimeModel(name: key, time: timings[key] as String);

  _UpcomingPrayer _findNextPrayer(List<PrayerTimeModel> prayers, DateTime now) {
    for (final prayer in prayers) {
      if (prayer.name == ApiKey.sunrise) continue;
      final parts = prayer.time.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1].substring(0, 2));
      final time = DateTime(now.year, now.month, now.day, hour, minute);
      if (time.isAfter(now)) {
        return _UpcomingPrayer(
          name: prayer.name,
          countdown: _formatDuration(time.difference(now)),
        );
      }
    }

    final fajr = prayers.firstWhere((prayer) => prayer.name == ApiKey.fajr);
    final parts = fajr.time.split(':');
    final tomorrowFajr = DateTime(
      now.year,
      now.month,
      now.day + 1,
      int.parse(parts[0]),
      int.parse(parts[1].substring(0, 2)),
    );
    return _UpcomingPrayer(
      name: fajr.name,
      countdown: _formatDuration(tomorrowFajr.difference(now)),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  double _qiblaBearing({required double latitude, required double longitude}) {
    const kaabaLatitude = 21.4225;
    const kaabaLongitude = 39.8262;
    final userLat = _toRadians(latitude);
    final kaabaLat = _toRadians(kaabaLatitude);
    final longitudeDelta = _toRadians(kaabaLongitude - longitude);
    final y = math.sin(longitudeDelta);
    final x =
        math.cos(userLat) * math.tan(kaabaLat) -
        math.sin(userLat) * math.cos(longitudeDelta);
    return (math.atan2(y, x) * 180 / math.pi + 360) % 360;
  }

  double _toRadians(double degrees) => degrees * math.pi / 180;
}

class _UpcomingPrayer {
  const _UpcomingPrayer({required this.name, required this.countdown});

  final String name;
  final String countdown;
}
