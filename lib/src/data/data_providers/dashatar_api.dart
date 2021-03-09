import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../data.dart';

class DashatarAPI {
  final String _host = "us-central1-dashatar-dev.cloudfunctions.net";

  /// Return raw data for a created dashatar based on its [characteristic].
  Future<Map<String, dynamic>> createDashatar(
    Characteristic characteristic,
  ) async {
    // characteristic can't be null
    assert(characteristic != null);
    // Url to connect to dashatar creation API
    Uri url = Uri.https(_host, "createDashatar", characteristic.toUrlMap());
    http.Response response;

    response = await http.get(url);
    return convert.json.decode(response.body);
  }
}
