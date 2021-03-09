import 'dart:developer';
import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../constants/constants.dart';

class FilterDashatars {
  /// Target points.
  final int targetPoints;

  /// Minimum possible value for a slot.
  final int startValue;

  /// Maximum possible value for a slot.
  final int endValue;

  /// The number of available slots.
  final int slots;

  FilterDashatars({
    @required this.targetPoints,
    @required this.startValue,
    @required this.endValue,
    @required this.slots,
  });

  /// Return a list of Characteristics under the user-defined filters.
  List<Characteristic> filter(DashatarFilter filter) {
    int strength = filter.attributes.strength;
    int agility = filter.attributes.agility;
    int wisdom = filter.attributes.wisdom;
    int charisma = filter.attributes.charisma;

    // Sum of the attributes.
    int attributesSum = strength + agility + wisdom + charisma;

    // The default status is ignored
    // so that no full query is conducted
    if (filter.roles.isEmpty && attributesSum == 0) return [];

    // The attributes have the wrong points.
    assert(attributesSum < targetPoints);

    List<Role> allRoles = filter.roles.isEmpty ? Role.values : filter.roles;

    // characteristics
    List<Characteristic> characteristics = [];
    // Generates all filtered Characteristics
    for (Attributes attribute in _generateAllCombinations(startValue, 0, [])) {
      // Consider only user-specified filters
      if ((strength == 0 || strength == attribute.strength) &&
          (agility == 0 || agility == attribute.agility) &&
          (wisdom == 0 || wisdom == attribute.wisdom) &&
          (charisma == 0 || charisma == attribute.charisma)) {
        for (Role role in allRoles) {
          characteristics.add(
            Characteristic(
              role: role,
              attributes: attribute,
            ),
          );
        }
      }
    }

    return characteristics;
  }

  /// Generate all combinations in a recursive fashion.
  Iterable<Attributes> _generateAllCombinations(
    int start,
    int currentSum,
    List<int> combination,
  ) sync* {
    // Number of slots in each combination must not exceed [slots].
    if (combination.length > slots) return;
    // When target is met and the number of digits in the combination
    // equals [slot], add it as an answer.
    if (currentSum == targetPoints && combination.length == slots) {
      // Log combination
      log(combination.join(','));
      // Attributes order is: [strength, agility, wisdom, charisma].
      yield Attributes(
        strength: combination[0],
        agility: combination[1],
        wisdom: combination[2],
        charisma: combination[3],
      );
    }

    // Find combinations.
    for (int i = 1; i <= endValue; i++) {
      int tempSum = currentSum + i;
      if (tempSum <= targetPoints) {
        combination.add(i);
        yield* _generateAllCombinations(i, tempSum, combination);
        combination.removeLast();
      } else
        return;
    }
  }
}
