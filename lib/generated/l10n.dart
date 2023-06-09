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

  /// `Click Counter App`
  String get main_title {
    return Intl.message(
      'Click Counter App',
      name: 'main_title',
      desc: '',
      args: [],
    );
  }

  /// `Counters`
  String get appbar_title {
    return Intl.message(
      'Counters',
      name: 'appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get isedit_save {
    return Intl.message(
      'Save',
      name: 'isedit_save',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get isedit_add {
    return Intl.message(
      'Add',
      name: 'isedit_add',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get btn_open_title {
    return Intl.message(
      'Open',
      name: 'btn_open_title',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get btn_edit_title {
    return Intl.message(
      'Edit',
      name: 'btn_edit_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get btn_delete_title {
    return Intl.message(
      'Delete',
      name: 'btn_delete_title',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get alert_dialog_title {
    return Intl.message(
      'Confirm',
      name: 'alert_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this counter?`
  String get alert_dialog_content {
    return Intl.message(
      'Are you sure you want to delete this counter?',
      name: 'alert_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Cansel`
  String get cansel_navigator {
    return Intl.message(
      'Cansel',
      name: 'cansel_navigator',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok_navigator {
    return Intl.message(
      'OK',
      name: 'ok_navigator',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment for this counter`
  String get comment_hinttext {
    return Intl.message(
      'Write a comment for this counter',
      name: 'comment_hinttext',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comment_labeltext {
    return Intl.message(
      'Comments',
      name: 'comment_labeltext',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment for this counter`
  String get comment_validator {
    return Intl.message(
      'Write a comment for this counter',
      name: 'comment_validator',
      desc: '',
      args: [],
    );
  }

  /// `Create a counter, click the button at the right bottom`
  String get create_counter_text {
    return Intl.message(
      'Create a counter, click the button at the right bottom',
      name: 'create_counter_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter number`
  String get count_hintText {
    return Intl.message(
      'Enter number',
      name: 'count_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Counter`
  String get count_labelText {
    return Intl.message(
      'Counter',
      name: 'count_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid number`
  String get count_validator {
    return Intl.message(
      'Enter a valid number',
      name: 'count_validator',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get name_hintText {
    return Intl.message(
      'Enter name',
      name: 'name_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Counter name`
  String get name_labelText {
    return Intl.message(
      'Counter name',
      name: 'name_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Enter a name`
  String get name_validator {
    return Intl.message(
      'Enter a name',
      name: 'name_validator',
      desc: '',
      args: [],
    );
  }

  /// `Enter total count`
  String get totalcount_hintText {
    return Intl.message(
      'Enter total count',
      name: 'totalcount_hintText',
      desc: '',
      args: [],
    );
  }

  /// `Total counter`
  String get totalcount_labelText {
    return Intl.message(
      'Total counter',
      name: 'totalcount_labelText',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid number`
  String get totalcount_validator {
    return Intl.message(
      'Enter a valid number',
      name: 'totalcount_validator',
      desc: '',
      args: [],
    );
  }

  /// `Click Counter`
  String get drawer_header {
    return Intl.message(
      'Click Counter',
      name: 'drawer_header',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get drawer_title_setings {
    return Intl.message(
      'Settings',
      name: 'drawer_title_setings',
      desc: '',
      args: [],
    );
  }

  /// `Rate app`
  String get drawer_title_rate {
    return Intl.message(
      'Rate app',
      name: 'drawer_title_rate',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get drawer_title_privacy {
    return Intl.message(
      'Privacy',
      name: 'drawer_title_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get tablist_items_index0 {
    return Intl.message(
      'Total',
      name: 'tablist_items_index0',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get tablist_items_index1 {
    return Intl.message(
      'Comment',
      name: 'tablist_items_index1',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get tablist_items_index2 {
    return Intl.message(
      'Date',
      name: 'tablist_items_index2',
      desc: '',
      args: [],
    );
  }

  /// `Total Score: `
  String get tablistwidget_itemsbody0 {
    return Intl.message(
      'Total Score: ',
      name: 'tablistwidget_itemsbody0',
      desc: '',
      args: [],
    );
  }

  /// `Creation date:`
  String get tablistwidget_itemsbody2 {
    return Intl.message(
      'Creation date:',
      name: 'tablistwidget_itemsbody2',
      desc: '',
      args: [],
    );
  }

  /// `Counter comment`
  String get commentController {
    return Intl.message(
      'Counter comment',
      name: 'commentController',
      desc: '',
      args: [],
    );
  }

  /// `Edit counter`
  String get isEditing_true {
    return Intl.message(
      'Edit counter',
      name: 'isEditing_true',
      desc: '',
      args: [],
    );
  }

  /// `Add counter`
  String get isEditing_false {
    return Intl.message(
      'Add counter',
      name: 'isEditing_false',
      desc: '',
      args: [],
    );
  }

  /// `Create a new counter`
  String get addbtn_tooltip {
    return Intl.message(
      'Create a new counter',
      name: 'addbtn_tooltip',
      desc: '',
      args: [],
    );
  }

  /// `Total number of clicks`
  String get prefixtxt_countertotal {
    return Intl.message(
      'Total number of clicks',
      name: 'prefixtxt_countertotal',
      desc: '',
      args: [],
    );
  }

  /// `Screen on`
  String get snackbar_screen_on {
    return Intl.message(
      'Screen on',
      name: 'snackbar_screen_on',
      desc: '',
      args: [],
    );
  }

  /// `Screen off`
  String get snackbar_screen_off {
    return Intl.message(
      'Screen off',
      name: 'snackbar_screen_off',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `Keep screen on`
  String get screen_title {
    return Intl.message(
      'Keep screen on',
      name: 'screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Keep screen active`
  String get screen_subtitle {
    return Intl.message(
      'Keep screen active',
      name: 'screen_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingpage_appbar_title {
    return Intl.message(
      'Settings',
      name: 'settingpage_appbar_title',
      desc: '',
      args: [],
    );
  }

  /// `Vibration on`
  String get snackbar_vibration_on {
    return Intl.message(
      'Vibration on',
      name: 'snackbar_vibration_on',
      desc: '',
      args: [],
    );
  }

  /// `Vibration off`
  String get snackbar_vibration_off {
    return Intl.message(
      'Vibration off',
      name: 'snackbar_vibration_off',
      desc: '',
      args: [],
    );
  }

  /// `Turn on vibration`
  String get vibration_title {
    return Intl.message(
      'Turn on vibration',
      name: 'vibration_title',
      desc: '',
      args: [],
    );
  }

  /// `To enable it: Go to settings > sound&vibration > touch vibration`
  String get vibration_subtitle {
    return Intl.message(
      'To enable it: Go to settings > sound&vibration > touch vibration',
      name: 'vibration_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sounds on`
  String get snackbar_volume_on {
    return Intl.message(
      'Sounds on',
      name: 'snackbar_volume_on',
      desc: '',
      args: [],
    );
  }

  /// `Sounds off`
  String get snackbar_volume_off {
    return Intl.message(
      'Sounds off',
      name: 'snackbar_volume_off',
      desc: '',
      args: [],
    );
  }

  /// `Enable sounds`
  String get volume_title {
    return Intl.message(
      'Enable sounds',
      name: 'volume_title',
      desc: '',
      args: [],
    );
  }

  /// `Play sounds when counter values change`
  String get volume_subtitle {
    return Intl.message(
      'Play sounds when counter values change',
      name: 'volume_subtitle',
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
