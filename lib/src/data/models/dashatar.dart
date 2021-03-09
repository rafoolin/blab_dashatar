import 'package:flutter/material.dart';

import '../data.dart';

class Dashatar {
  final Characteristic characteristic;
  final String imageUrl;

  Dashatar({@required this.characteristic, @required this.imageUrl})
      : assert(
          characteristic != null && imageUrl != null && imageUrl.isNotEmpty,
        );

  @override
  String toString() => 'Dashatar(characteristic: $characteristic, '
      'imageUrl: $imageUrl)';
}
