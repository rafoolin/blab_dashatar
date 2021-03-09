import '../data.dart';

class DashatarRepository {
  final DashatarAPI _dashatarAPI = DashatarAPI();

  /// Return raw data for a created dashatar based on its [characteristic].
  Future<Dashatar> createDashatar(
    Characteristic characteristic,
  ) async {
    var rawData = await _dashatarAPI.createDashatar(characteristic);
    return Dashatar(characteristic: characteristic, imageUrl: rawData["url"]);
  }
}
