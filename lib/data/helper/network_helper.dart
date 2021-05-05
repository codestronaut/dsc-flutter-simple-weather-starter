import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  Future<dynamic> getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

// HTTP example
/*
http.Response response = await http.get(
  url,
  headers: headers,
);

if (response.statusCode == 200) {
  String data = response.body;
  var decodedData = jsonDecode(data);

  return decodedData;
} else {
  print(response.statusCode);
}
*/