
import 'package:flutter/material.dart';

import './logic/logic.dart';
import './constants/constants.dart';
import './presentation/presentation.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashatarBloc>(
      bloc: DashatarBloc(),
      child: BlocProvider<FilterBloc>(
        bloc: FilterBloc(),
        child: MaterialApp(
          //TODO:: replace with user selected theme
          theme: CustomTheme.BEIGE.themeData,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
