import 'package:flutter/material.dart';

import '../presentation.dart';
import '../../logic/logic.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/empty_dashatar.png',
              fit: BoxFit.contain,
            ),
          ),
          ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorite Dashatars"),
              onTap: () {
                BlocProvider.of<DashatarBloc>(context)..getFavorites();
                Navigator.of(context).pushNamed(FavoriteScreen.routeName);
              }),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () =>
                Navigator.of(context).pushNamed(SettingScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () => Navigator.of(context).pushNamed(AboutScreen.routeName),
          ),
        ],
      ),
    );
  }
}
