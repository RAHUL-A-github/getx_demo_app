// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> pt_BR = {
  "home-title": "Teste de Localização - %s",
  "welcome": "Olá, Hoje é %s",
  "login-label": "Usuário",
  "password-label": "Senha",
  "change-value": "Change to english",
  "second-screen": "Teste de Localização"
};
static const Map<String,dynamic> en_US = {
  "home-title": "Localization Test - %s",
  "welcome": "Welcome, Today is %s",
  "login-label": "User",
  "password-label": "Password",
  "change-value": "Mudar para português",
  "second-screen": "Second Screen"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"pt_BR": pt_BR, "en_US": en_US};
}
