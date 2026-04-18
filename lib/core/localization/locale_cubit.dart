import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locale_cache_helper.dart';

abstract class LocaleState {
  final Locale locale;
  LocaleState(this.locale);
}

class ChangeLocaleState extends LocaleState {
  ChangeLocaleState(super.locale);
}

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleCacheHelper localeCacheHelper;

  LocaleCubit(this.localeCacheHelper) : super(ChangeLocaleState(const Locale('ar')));

  Future<void> getCachedLanguage() async {
    final String cachedLanguageCode = await localeCacheHelper.getCachedLanguageCode();
    if (!isClosed) {
      emit(ChangeLocaleState(Locale(cachedLanguageCode)));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    await localeCacheHelper.cacheLanguageCode(languageCode);
    if (!isClosed) {
      emit(ChangeLocaleState(Locale(languageCode)));
    }
  }
}
