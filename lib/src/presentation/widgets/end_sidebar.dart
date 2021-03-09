import 'package:flutter/material.dart';

import '../presentation.dart';

class EndSidebar extends StatelessWidget {
  const EndSidebar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          HeaderSection('Class'),
          const RolesCheckboxes(),
          const Divider(),
          HeaderSection('Attributes'),
          const StrengthSlider(),
          const Divider(),
          const AgilitySlider(),
          const Divider(),
          const WisdomSlider(),
          const Divider(),
          const CharismaSlider(),
        ],
      ),
    );
  }
}
