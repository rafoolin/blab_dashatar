import 'package:flutter/material.dart';

import '../../logic/logic.dart';
import '../../data/data.dart';
import '../../constants/constants.dart';
import '../../presentation/presentation.dart';

class FavoriteScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/FavoriteScreen";
  const FavoriteScreen();

  @override
  Widget build(BuildContext context) {
    DashatarBloc dashatarBloc = BlocProvider.of<DashatarBloc>(context);
    DeviceRange deviceRange;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Dashatars'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          deviceRange = deviceRange.getRange(constraints.maxWidth);

          return StreamBuilder<List<Characteristic>>(
            stream: dashatarBloc.favoritesStream,
            initialData: [],
            builder: (context, snapshot) {
              List<Characteristic> characteristics = snapshot.data;

              return GridView.builder(
                itemCount: characteristics.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: deviceRange.gridCount,
                  crossAxisSpacing: 0.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return DashatarCard(characteristic: characteristics[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
