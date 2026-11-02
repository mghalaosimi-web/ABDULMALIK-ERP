import 'package:abdulmalik_erp/src/features/home/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('about screen presents supervision and development contributors in Arabic', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      locale: Locale('ar'),
      supportedLocales: [Locale('ar')],
      home: AboutScreen(),
    ));

    expect(find.text('عن المشروع والفريق'), findsOneWidget);
    expect(find.text('الإشراف والمراجعة العلمية'), findsOneWidget);
    expect(find.text('الأستاذ الدكتور أحمد الناشري'), findsOneWidget);
    expect(find.text('الأستاذ الدكتور عبد الرزاق الأهدل'), findsOneWidget);
    expect(find.text('الدكتور ضياء القدمي'), findsOneWidget);
    expect(find.text('الأستاذ الدكتور عبده شويه'), findsOneWidget);
    expect(find.text('الأستاذة سمر'), findsOneWidget);
    expect(find.text('محمد غالب العصيمي'), findsOneWidget);
    expect(find.text('رمزي محمد حزام السرابي'), findsOneWidget);
    expect(find.text('عرفات الكاملي'), findsOneWidget);
  });
}
