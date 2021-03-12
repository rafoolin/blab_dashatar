import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';

class UserPreference {
  // --------------------------------- KEYS-------------------------------------
  final String themeKey = 'ThemeKey';

  // --------------------------------- THEME -----------------------------------
  /// Save Theme preference.
  ///
  /// Default is Beige.
  Future<bool> setThemePreference(CustomTheme customTheme) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt(themeKey, customTheme?.index ?? 1);
  }

  /// Return Theme preference.
  ///
  /// Default is Beige.
  Future<int> getThemePreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(themeKey) ?? 1;
  }
}
