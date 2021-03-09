import 'dart:developer';

import 'package:rxdart/rxdart.dart';

import '../../data/data.dart';
import '../../logic/logic.dart';
import '../../constants/constants.dart';

class FilterBloc implements Bloc {
  FilterBloc() {
    // Combine filters and apply it after 1.5 second
    Rx.combineLatest5<List<Role>, double, double, double, double,
            DashatarFilter>(
      roleStream,
      strengthStream,
      agilityStream,
      wisdomStream,
      charismaStream,
      (
        roles,
        strength,
        agility,
        wisdom,
        charisma,
      ) =>
          DashatarFilter(
        roles: roles,
        attributes: Attributes(
          agility: agility.toInt(),
          charisma: charisma.toInt(),
          wisdom: wisdom.toInt(),
          strength: strength.toInt(),
        ),
      ),
    )
        .debounce((filter) => TimerStream(filter, Duration(milliseconds: 1500)))
        .listen((filter) => _filterDashatar(filter))
        .onError((error, stackTrace) => _filterCtrl.addError(error));
  }
  // ------------------------------ Objects ------------------------------------
  final FilterDashatars _filterService = FilterDashatars(
    targetPoints: 12,
    startValue: 1,
    endValue: 5,
    slots: 4,
  );

  // ------------------------------ Filter CTRL --------------------------------
  var _filterCtrl = BehaviorSubject<List<Characteristic>>();

  /// Stream containing a list of characteristics.
  Stream<List<Characteristic>> get filterStream => _filterCtrl.stream;

  /// There are different characteristics
  /// that can be filtered using different filters.
  void _filterDashatar(DashatarFilter filter) async {
    List<Characteristic> result = _filterService.filter(filter);
    _filterCtrl.add(result);
  }

  // ------------------------------ Role CTRL ----------------------------------
  var _roleCtrl = BehaviorSubject<List<Role>>.seeded([]);

  /// Stream of roles.
  Stream<List<Role>> get roleStream => _roleCtrl.stream;

  /// Add roles to stream.
  void addRoles(List<Role> roles) {
    _roleCtrl.add(roles);
    log('[FilterBloc]: Add Roles: $roles');
  }

  // ------------------------------ Strength CTRL ------------------------------
  var _strengthCtrl = BehaviorSubject<double>.seeded(0.0);

  /// Stream of strength.
  Stream<double> get strengthStream => _strengthCtrl.stream;

  /// Add Strength to stream.
  void addStrength(double strength) {
    _strengthCtrl.add(strength);
    log('[FilterBloc]: Add strength: $strength');
  }

  // ------------------------------ agility CTRL -------------------------------
  var _agilityCtrl = BehaviorSubject<double>.seeded(0.0);

  /// Stream of agility.
  Stream<double> get agilityStream => _agilityCtrl.stream;

  /// Add agility to stream.
  void addAgility(double agility) {
    _agilityCtrl.add(agility);
    log('[FilterBloc]: Add agility: $agility');
  }

  // ------------------------------ wisdom CTRL --------------------------------
  var _wisdomCtrl = BehaviorSubject<double>.seeded(0.0);

  /// Stream of wisdom.
  Stream<double> get wisdomStream => _wisdomCtrl.stream;

  /// Add wisdom to stream.
  void addWisdom(double wisdom) {
    _wisdomCtrl.add(wisdom);
    log('[FilterBloc]: Add wisdom: $wisdom');
  }

  // ------------------------------ charisma CTRL ------------------------------
  var _charismaCtrl = BehaviorSubject<double>.seeded(0.0);

  /// Stream of charisma.
  Stream<double> get charismaStream => _charismaCtrl.stream;

  /// Add charisma to stream.
  void addCharisma(double charisma) {
    _charismaCtrl.add(charisma);
    log('[FilterBloc]: Add charisma: $charisma');
  }

  @override
  void dispose() {
    _roleCtrl.close();
    _strengthCtrl.close();
    _agilityCtrl.close();
    _wisdomCtrl.close();
    _charismaCtrl.close();
  }
}
