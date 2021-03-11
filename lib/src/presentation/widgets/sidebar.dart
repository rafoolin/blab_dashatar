import 'package:flutter/material.dart';

import '../presentation.dart';
import '../../logic/logic.dart';

class Sidebar extends StatelessWidget {
  const Sidebar();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    'assets/images/default_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: IconButton(
                  icon: const Icon(
                    Icons.color_lens,
                    size: 35.0,
                    color: Color(0xff54accc),
                  ),
                  onPressed: () {
                    // Show a Dialog to switch themes
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => ThemeSelector(),
                    );
                  },
                ),
              )
            ],
          ),
          ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favorite Dashatars"),
              onTap: () {
                BlocProvider.of<DashatarBloc>(context)..getFavorites();
                Navigator.of(context).pushNamed(FavoriteScreen.routeName);
              }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () =>
                Navigator.of(context).pushNamed(SettingScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () => Navigator.of(context).pushNamed(AboutScreen.routeName),
          ),
        ],
      ),
    );
  }
}
