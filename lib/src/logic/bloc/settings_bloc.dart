import 'package:rxdart/rxdart.dart';

import '../../data/data.dart';
import '../../logic/logic.dart';
import '../../constants/constants.dart';

class SettingsBloc implements Bloc {
  // ------------------------------ Objects ------------------------------------
  final SettingsRepository _repository = SettingsRepository();

  // ------------------------------ Theme CTRL ---------------------------------
  var _themeCtrl = BehaviorSubject<CustomTheme>();

  /// Custom theme stream.
  Stream<CustomTheme> get themeStream => _themeCtrl.stream;

  /// Initialize Theme.
  Future<CustomTheme> init() async {
    return await _repository.getThemePreference().then((theme) {
      _themeCtrl.add(theme);
      return theme;
    }).catchError((onError) {
      _themeCtrl.addError(onError);
    });
  }

  /// Set user-preference theme[customTheme] to the local database.
  Future<void> setThemePreference(CustomTheme customTheme) async {
    await _repository
        .setThemePreference(customTheme)
        .then((_) => _themeCtrl.add(customTheme))
        .catchError((onError) => _themeCtrl.addError(onError));
  }

  @override
  void dispose() {
    _themeCtrl.close();
  }
}
