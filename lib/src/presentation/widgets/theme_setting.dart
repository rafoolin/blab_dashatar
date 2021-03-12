import 'package:flutter/material.dart';

import '../../logic/logic.dart';
import '../../constants/constants.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting();

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return StreamBuilder<CustomTheme>(
      stream: settingsBloc.themeStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) return Container();

        return ListTile(
          leading: const Icon(Icons.color_lens),
          title: const Text('Theme'),
          subtitle: Text(snapshot.data.name),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const _ThemeOptions(),
            ),
          ),
        );
      },
    );
  }
}

class _ThemeOptions extends StatelessWidget {
  const _ThemeOptions();

  @override
  Widget build(BuildContext context) {
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);
    final List<CustomTheme> customThemes = CustomTheme.values;
    CustomTheme theme;

    return Scaffold(
      appBar: AppBar(title: Text('Choose a Theme')),
      body: StreamBuilder<CustomTheme>(
        stream: settingsBloc.themeStream,
        builder: (context, snapshot) {
          theme = snapshot.data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: customThemes.length,
            itemBuilder: (BuildContext context, int index) {
              return (!snapshot.hasData || snapshot.hasError)
                  ? Container()
                  : ListTile(
                      title: Text(customThemes[index].name),
                      trailing: customThemes[index] == theme
                          ? Icon(Icons.check)
                          : null,
                      onTap: () async => await settingsBloc
                          .setThemePreference(customThemes[index]),
                    );
            },
          );
        },
      ),
    );
  }
}
