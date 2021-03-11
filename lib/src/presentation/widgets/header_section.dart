import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;

  const HeaderSection(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 48.0,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title, textScaleFactor: 1.5),
      ),
    );
  }
}
