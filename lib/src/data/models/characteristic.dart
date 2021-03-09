import '../../constants/constants.dart';
import '../../data/data.dart';

class Characteristic {
  final Role role;
  final Attributes attributes;

  Characteristic({this.attributes, this.role});

  /// Characteristic id
  String get id => "${role.name}"
      "-S:${attributes.strength}"
      "-A:${attributes.agility}"
      "-W:${attributes.wisdom}"
      "-C:${attributes.charisma}";

  Map<String, dynamic> toUrlMap() {
    return {
      'role': role?.name?.toLowerCase(),
      'agility': attributes.agility.toString(),
      'wisdom': attributes.wisdom.toString(),
      'strength': attributes.strength.toString(),
      'charisma': attributes.charisma.toString(),
    };
  }

  @override
  String toString() => 'Characteristic(role: $role, attributes: $attributes)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Characteristic && o.role == role && o.attributes == attributes;
  }

  @override
  int get hashCode => role.hashCode ^ attributes.hashCode;
}
