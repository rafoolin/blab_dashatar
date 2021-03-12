import 'package:flutter/material.dart';

import 'src/my_app.dart';
import 'src/logic/logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SettingsBloc settingsBloc = SettingsBloc();
  await settingsBloc
      .init()
      .then((theme) => runApp(MyApp(settingsBloc: settingsBloc, theme: theme)));
}
