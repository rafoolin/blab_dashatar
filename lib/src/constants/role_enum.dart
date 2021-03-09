enum Role { DESIGNER, DEVELOPER, MANAGER }

extension RoleExtension on Role {
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
}
