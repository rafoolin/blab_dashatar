import 'dart:developer';
import 'package:flutter/material.dart';

import './logic/logic.dart';
import './constants/constants.dart';
import './presentation/presentation.dart';

class MyApp extends StatelessWidget {
  final SettingsBloc settingsBloc;
  final CustomTheme theme;

  const MyApp({Key key, this.settingsBloc, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Initialized [MyApp]');

    final DashatarBloc dashatarBloc = DashatarBloc();
    final FilterBloc filterBloc = FilterBloc();

    return BlocProvider<SettingsBloc>(
      bloc: settingsBloc,
      child: BlocProvider<DashatarBloc>(
        bloc: dashatarBloc,
        child: BlocProvider<FilterBloc>(
          bloc: filterBloc,
          child: StreamBuilder<CustomTheme>(
            initialData: theme,
            stream: settingsBloc.themeStream,
            builder: (context, snapshot) {
              return MaterialApp(
                theme: snapshot.data?.themeData,
                onGenerateRoute: AppRouter.onGenerateRoute,
              );
            },
          ),
        ),
      ),
    );
  }
}
