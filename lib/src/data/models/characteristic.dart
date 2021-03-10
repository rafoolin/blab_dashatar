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

  // TODO:: Let's put everything into one table and
  // separate it in two table and use foreign keys
  // if needed :D
  Map<String, dynamic> toDBMap() {
    return {
      'id': id,
      'role': role?.index,
      'agility': attributes.agility,
      'wisdom': attributes.wisdom,
      'strength': attributes.strength,
      'charisma': attributes.charisma,
    };
  }

  factory Characteristic.fromDBMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Characteristic(
      role: Role.values[map['role']],
      attributes: Attributes(
        agility: map['agility'],
        wisdom: map['wisdom'],
        strength: map['strength'],
        charisma: map['charisma'],
      ),
    );
  }
}
