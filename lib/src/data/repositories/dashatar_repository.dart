import '../data.dart';

class DashatarRepository {
  final DashatarAPI _dashatarAPI = DashatarAPI();
  final CharacteristicDoa _characteristicDoa = CharacteristicDoa();

  /// Return raw data for a created dashatar based on its [characteristic].
  Future<Dashatar> createDashatar(
    Characteristic characteristic,
  ) async {
    var rawData = await _dashatarAPI.createDashatar(characteristic);
    bool isFav = await isFavored(characteristic.id);

    return Dashatar(
      isFavored: isFav,
      characteristic: characteristic,
      imageUrl: rawData["url"],
    );
  }

  /// Return true if [id] exists in the favorite database.
  Future<bool> isFavored(String id) async {
    return await _characteristicDoa.isFavored(id);
  }

  /// Set/Unset a [characteristic] as favorite characteristic
  /// based on the [isFavored].
  Future<int> setAsFav(Characteristic characteristic, bool isFavored) async {
    if (isFavored)
      return await _characteristicDoa.insert(characteristic);
    else
      return await _characteristicDoa.delete(characteristic.id);
  }

  /// Return a list of all Characteristics in the favorite database.
  Future<List<Characteristic>> getFavorites() async {
    var result = await _characteristicDoa.getFavorites();

    return result.map((map) => Characteristic.fromDBMap(map)).toList();
  }
}
