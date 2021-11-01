// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Luobo Houseware`
  String get app_name {
    return Intl.message(
      'Luobo Houseware',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get storage {
    return Intl.message(
      'Storage',
      name: 'storage',
      desc: '',
      args: [],
    );
  }

  /// `Mall`
  String get mall {
    return Intl.message(
      'Mall',
      name: 'mall',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get mine {
    return Intl.message(
      'Mine',
      name: 'mine',
      desc: '',
      args: [],
    );
  }

  /// `go to check`
  String get check {
    return Intl.message(
      'go to check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrder {
    return Intl.message(
      'My Orders',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalOrder {
    return Intl.message(
      'Total',
      name: 'totalOrder',
      desc: '',
      args: [],
    );
  }

  /// `Waitdeliver`
  String get waitdeliver {
    return Intl.message(
      'Waitdeliver',
      name: 'waitdeliver',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Signed`
  String get signed {
    return Intl.message(
      'Signed',
      name: 'signed',
      desc: '',
      args: [],
    );
  }

  /// `My Services`
  String get myService {
    return Intl.message(
      'My Services',
      name: 'myService',
      desc: '',
      args: [],
    );
  }

  /// `My Assets`
  String get myAssets {
    return Intl.message(
      'My Assets',
      name: 'myAssets',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Storage Data`
  String get storageData {
    return Intl.message(
      'Storage Data',
      name: 'storageData',
      desc: '',
      args: [],
    );
  }

  /// `InStorage`
  String get inStorage {
    return Intl.message(
      'InStorage',
      name: 'inStorage',
      desc: '',
      args: [],
    );
  }

  /// `OutStorage`
  String get outStorage {
    return Intl.message(
      'OutStorage',
      name: 'outStorage',
      desc: '',
      args: [],
    );
  }

  /// `Inventory`
  String get inventory {
    return Intl.message(
      'Inventory',
      name: 'inventory',
      desc: '',
      args: [],
    );
  }

  /// `Loginstics Data`
  String get logistisData {
    return Intl.message(
      'Loginstics Data',
      name: 'logistisData',
      desc: '',
      args: [],
    );
  }

  /// `Doing`
  String get doing {
    return Intl.message(
      'Doing',
      name: 'doing',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `InStorageApply`
  String get inStorageApply {
    return Intl.message(
      'InStorageApply',
      name: 'inStorageApply',
      desc: '',
      args: [],
    );
  }

  /// `OutStorageApply`
  String get outStorageApply {
    return Intl.message(
      'OutStorageApply',
      name: 'outStorageApply',
      desc: '',
      args: [],
    );
  }

  /// `Apply Transport`
  String get applyTransport {
    return Intl.message(
      'Apply Transport',
      name: 'applyTransport',
      desc: '',
      args: [],
    );
  }

  /// `Monitor`
  String get monitor {
    return Intl.message(
      'Monitor',
      name: 'monitor',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
