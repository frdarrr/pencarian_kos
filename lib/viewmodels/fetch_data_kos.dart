import 'dart:convert'; //melakukan decode atau encode
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pencarian_kos/models/datakos.dart';

class Repository {
  final String apiUrl = "https://restapikost-default-rtdb.firebaseio.com/.json";

  Future<List<Datakos>> fetchDataPlaces() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Datakos> dataPlaces;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body)["kost"];

      dataPlaces = jsonData.values.map((value) {
        return Datakos.fromJson(value);
      }).toList();

      return dataPlaces;
    } else {
      throw Exception('Failed to load data places');
    }
  }
}
