import 'dart:collection';

import 'package:rxdart/rxdart.dart';

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
      _cacheDashatars[characteristic.id] = await _repository
          .createDashatar(characteristic)
          .catchError((onError) {});
    yield _cacheDashatars[characteristic.id];
  }

  // ------------------------------ Dashatar Fav -------------------------------
  /// Set/Unset a [characteristic] as favorite characteristic
  /// based on the [isFavored].
  Future<int> setAsFav(Characteristic characteristic, bool isFavored) async {
    // Update cached dashatar
    if (_cacheDashatars.containsKey(characteristic.id))
      _cacheDashatars[characteristic.id].isFavored = isFavored;

    int result = await _repository
        .setAsFav(characteristic, isFavored)
        .whenComplete(() async => // Update favorites
            await getFavorites())
        .catchError((onError) {});

    return result;
  }

  // ------------------------------ Dashatar All Faves -------------------------
  var _favesCtrl = BehaviorSubject<List<Characteristic>>();

  /// Favorite dashatars stream.
  Stream<List<Characteristic>> get favoritesStream => _favesCtrl.stream;

  /// Return a list of all Characteristics in the favorite database.
  Future<void> getFavorites() async {
    await _repository
        .getFavorites()
        .then((faves) => _favesCtrl.add(faves))
        .catchError((onError) => _favesCtrl.addError(onError));
  }

  @override
  void dispose() {
    _cacheDashatars.clear();
    _favesCtrl.close();
  }
}
