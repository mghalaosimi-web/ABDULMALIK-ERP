import 'package:abdulmalik_erp/src/features/home/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('about screen presents supervision and development contributors in Arabic', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      locale: Locale('ar'),
      supportedLocales: [Locale('ar')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: AboutScreen(),
    ));

    expect(find.text('عن المشروع والفريق'), findsOneWidget);
    expect(find.text('الإشراف والمراجعة العلمية'), findsOneWidget);

    final names = [
      'الأستاذ الدكتور أحمد الناشري',
      'الأستاذ الدكتور عبد الرزاق الأهدل',
      'الدكتور ضياء القدمي',
      'الأستاذ الدكتور عبده شويه',
      'الأستاذة سمر',
      'محمد غالب العصيمي',
      'رمزي محمد حزام السرابي',
      'عرفات الكاملي',
    ];
    for (final name in names) {
      await tester.scrollUntilVisible(
        find.text(name),
        350,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text(name), findsOneWidget);
    }
  });
}
