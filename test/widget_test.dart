import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thawab/core/services/services_locator.dart';
import 'package:thawab/thawab_app.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    await setupServiceLocator();
  });

  testWidgets('shows the splash screen', (tester) async {
    await tester.pumpWidget(const ThawabApp());
    await tester.pump();

    expect(find.text('ثواب'), findsOneWidget);
    expect(find.text('جاري تجهيز المصحف...'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('السلام عليكم ورحمة الله'), findsOneWidget);

    await tester.tap(find.text('المصحف الشريف'));
    await tester.pumpAndSettle();
    expect(find.text('أدوات القراءة'), findsOneWidget);

    await tester.tap(find.text('الصلاة'));
    await tester.pumpAndSettle();
    expect(find.text('مواقيت الصلاة'), findsOneWidget);

    await tester.tap(find.text('الأذكار'));
    await tester.pumpAndSettle();
    expect(find.text('الأذكار والمسبحة'), findsOneWidget);

    await tester.tap(find.text('الرئيسية'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.text('الإعدادات'), findsOneWidget);
  });
}
