import 'package:flutter/material.dart';

enum Role { DESIGNER, DEVELOPER, MANAGER }

extension RoleExtension on Role {
  // Name of the role.
  String get name {
    switch (this) {
      case Role.DESIGNER:
        return "Designer";
        break;
      case Role.DEVELOPER:
        return "Developer";
        break;
      case Role.MANAGER:
        return "Manager";
        break;
      default:
        return null;
    }
  }

  // Color representing the role.
  Color get color {
    switch (this) {
      case Role.DESIGNER:
        return const Color(0xff04acf8);
        break;
      case Role.DEVELOPER:
        return const Color(0xff54b735);
        break;
      case Role.MANAGER:
        return const Color(0xfff6c446);
        break;
      default:
        return Colors.transparent;
    }
  }
}
