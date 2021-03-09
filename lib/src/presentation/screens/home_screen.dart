import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../presentation.dart';
import '../../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  /// Route name
  static const String routeName = "/HomeScreen";
  final List<Characteristic> characteristics;
  const HomeScreen(this.characteristics);

  @override
  Widget build(BuildContext context) {
    DeviceRange deviceRange;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Sidebar(),
      endDrawer: EndSidebar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          deviceRange = deviceRange.getRange(constraints.maxWidth);

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
      ),
    );
  }
}
