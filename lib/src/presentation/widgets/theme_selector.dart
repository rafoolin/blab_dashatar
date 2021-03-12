import 'package:flutter/material.dart';

import '../../logic/logic.dart';
import '../../constants/constants.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
      titlePadding: EdgeInsets.zero,
      title: Container(
        color: themeData.primaryColorLight,
        padding: const EdgeInsets.all(16.0),
        child: const Text("Choose a Theme"),
      ),
      content: Container(
        height: 64.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: CustomTheme.values
              .map(
                (theme) => GestureDetector(
                  child: StreamBuilder<CustomTheme>(
                      stream: settingsBloc.themeStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.hasError)
                          return Container();

                        return _ThemeItem(
                          themeData: theme.themeData,
                          selected: theme == snapshot.data,
                        );
                      }),
                  onTap: () async {
                    await settingsBloc
                        .setThemePreference(theme)
                        .then((value) => Navigator.of(context).pop());
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final bool selected;
  final ThemeData themeData;

  const _ThemeItem({Key key, this.selected, this.themeData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(selected ? 0.0 : 7.0),
      width: selected ? 54.0 : 40.0,
      height: selected ? 54.0 : 40.0,
      decoration: BoxDecoration(
        color: themeData.primaryColor,
        border: Border.all(
          color: selected ? theme.accentColor : themeData.primaryColor,
          width: selected ? 2.0 : 1.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(36.0)),
      ),
    );
  }
}
