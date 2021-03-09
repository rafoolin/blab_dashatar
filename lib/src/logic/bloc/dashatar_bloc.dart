import 'dart:collection';

import '../../data/data.dart';
import '../../logic/logic.dart';

class DashatarBloc implements Bloc {
  // ------------------------------ Objects ------------------------------------
  final DashatarRepository _repository = DashatarRepository();

  // ------------------------------ Caches -------------------------------------
  HashMap<String, Dashatar> _cacheDashatars = HashMap<String, Dashatar>();

  // ------------------------------ Dashatar CTRL ------------------------------

  /// Stream containing the created dashatar based on its [characteristic].
  Stream<Dashatar> createDashatar(Characteristic characteristic) async* {
    if (!_cacheDashatars.containsKey(characteristic.id))
      _cacheDashatars[characteristic.id] =
          await _repository.createDashatar(characteristic);
    yield _cacheDashatars[characteristic.id];
  }

  @override
  void dispose() {
    _cacheDashatars.clear();
  }
}
