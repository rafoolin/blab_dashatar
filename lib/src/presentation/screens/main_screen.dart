import 'package:flutter/material.dart';

import '../presentation.dart';
import '../../data/data.dart';
import '../../logic/logic.dart';

class MainScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/MainScreen";
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    FilterBloc filterBloc = BlocProvider.of<FilterBloc>(context);

    return StreamBuilder<List<Characteristic>>(
      stream: filterBloc.filterStream,
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.hasError) return ErrorScreen();
        if (!snapshot.hasData) return LoadingScreen();
        return HomeScreen(snapshot.data);
      },
    );
  }
}
