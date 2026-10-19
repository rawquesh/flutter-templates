import 'package:flutter/foundation.dart';

/// App-wide theme state shared by [MaterialApp] and [AppShell].
///
/// Screens style themselves with a manual `isDark` flag, so the [ThemeData]
/// brightness must stay in sync — otherwise widgets reading
/// `Theme.of(context).brightness` (text fields, buttons, cards) render the
/// wrong variant for the visible background.
class ThemeController extends ChangeNotifier {
  ThemeController._();

  static final ThemeController instance = ThemeController._();

  bool _isDark = true;
  bool get isDark => _isDark;

  void setDark(bool value) {
    if (_isDark == value) return;
    _isDark = value;
    notifyListeners();
  }

  void toggle() => setDark(!_isDark);
}
