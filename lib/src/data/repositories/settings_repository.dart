import '../data.dart';
import '../../constants/constants.dart';

class SettingsRepository {
  // ------------------------------ Objects ------------------------------------
  final UserPreference _preference = UserPreference();

  /// Set user-preference theme[customTheme] to the local database.
  Future<bool> setThemePreference(CustomTheme customTheme) async {
    return await _preference.setThemePreference(customTheme);
  }

  /// Return user-preference theme.
  Future<CustomTheme> getThemePreference() async {
    int index = await _preference.getThemePreference();
    return CustomTheme.values[index];
  }
}
