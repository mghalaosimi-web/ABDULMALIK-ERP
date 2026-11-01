import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'session.dart';

final localeProvider = NotifierProvider<LocaleController, Locale>(LocaleController.new);

class LocaleController extends Notifier<Locale> {
  @override
  Locale build() => Locale(ref.read(appConfigProvider).language);

  Future<void> setLanguage(String language) async {
    if (language != 'ar' && language != 'en') {
      throw ArgumentError.value(language, 'language', 'Only ar and en are supported');
    }
    await ref.read(appConfigProvider).setLanguage(language);
    state = Locale(language);
  }
}
