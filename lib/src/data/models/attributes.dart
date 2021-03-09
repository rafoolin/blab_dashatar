class Attributes {
  final int agility;
  final int wisdom;
  final int strength;
  final int charisma;

  Attributes({
    this.agility = 0,
    this.wisdom = 0,
    this.strength = 0,
    this.charisma = 0,
  });

  @override
  String toString() {
    return 'Attributes(agility: $agility, '
        'wisdom: $wisdom, '
        'strength: $strength, '
        'charisma: $charisma)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Attributes &&
        o.agility == agility &&
        o.wisdom == wisdom &&
        o.strength == strength &&
        o.charisma == charisma;
  }

  @override
  int get hashCode {
    return agility.hashCode ^
        wisdom.hashCode ^
        strength.hashCode ^
        charisma.hashCode;
  }
}
