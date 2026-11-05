import 'package:thawab/l10n/generated/app_localizations.dart';

String localizePrayerName(S strings, String prayerName) => switch (prayerName) {
  'Fajr' => strings.fajr,
  'Sunrise' => strings.sunrise,
  'Dhuhr' => strings.dhuhr,
  'Asr' => strings.asr,
  'Maghrib' => strings.maghrib,
  'Isha' => strings.isha,
  _ => prayerName,
};
