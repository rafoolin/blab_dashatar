import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';

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

          return characteristics.isEmpty
              ? const _EmptyScreen()
              : GridView.builder(
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

class _EmptyScreen extends StatelessWidget {
  const _EmptyScreen();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        Flexible(
          child: Container(
            height: 300.0,
            child: FlareActor(
              "assets/animations/empty_state.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "idle",
              snapToEnd: true,
            ),
          ),
        ),
        Center(
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'The ',
              style: theme.primaryTextTheme.bodyText1.copyWith(
                fontSize: 18.0,
              ),
              children: [
                TextSpan(
                  text: 'Dashatars\n',
                  style: theme.primaryTextTheme.bodyText2.copyWith(
                    fontSize: 18.0,
                  ),
                ),
                TextSpan(text: 'can be '),
                TextSpan(
                  text: 'filtered',
                  style: theme.primaryTextTheme.bodyText2
                      .copyWith(fontSize: 18.0, color: theme.accentColor),
                ),
                TextSpan(text: ' using'),
                WidgetSpan(
                  child: Icon(Icons.filter_alt, size: 64.0),
                  baseline: TextBaseline.ideographic,
                  alignment: PlaceholderAlignment.middle
                ),
                TextSpan(text: ' button.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
