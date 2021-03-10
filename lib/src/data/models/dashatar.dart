import 'package:flutter/material.dart';

import '../data.dart';

class Dashatar {
  final Characteristic characteristic;
  final String imageUrl;
  bool isFavored;

  Dashatar({
    @required this.characteristic,
    @required this.imageUrl,
    this.isFavored = false,
  }) : assert(
          characteristic != null && imageUrl != null && imageUrl.isNotEmpty,
        );

  @override
  String toString() => 'Dashatar(characteristic: $characteristic, '
      'isFavored: $isFavored, '
      'imageUrl: $imageUrl)';
}
