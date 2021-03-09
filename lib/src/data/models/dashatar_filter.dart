import '../../constants/constants.dart';
import '../data.dart';

class DashatarFilter {
  final List<Role> roles;
  final Attributes attributes;

  DashatarFilter({this.roles = const [], this.attributes});

  /// Copy from attributes.
  DashatarFilter copyWith({
    List<Role> roles,
    int agility,
    int wisdom,
    int strength,
    int charisma,
  }) {
    return DashatarFilter(
      roles: roles ?? this.roles,
      attributes: Attributes(
        agility: agility ?? this.attributes.agility,
        strength: strength ?? this.attributes.strength,
        wisdom: wisdom ?? this.attributes.wisdom,
        charisma: charisma ?? this.attributes.charisma,
      ),
    );
  }

  /// Deep copy.
  DashatarFilter clone() {
    return DashatarFilter(
      roles: List.from(this.roles),
      attributes: Attributes(
        agility: this.attributes.agility,
        strength: this.attributes.strength,
        wisdom: this.attributes.wisdom,
        charisma: this.attributes.charisma,
      ),
    );
  }

  @override
  String toString() => 'DashatarFilter(roles: $roles, attributes: $attributes)';
}
