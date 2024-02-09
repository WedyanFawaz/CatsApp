import 'dart:convert';

import 'package:cats/model/cat_model.dart';
import 'package:cats/constant/strings.dart';
import 'package:http/http.dart' as http;

class CatWebSerivces {
  Future<List<Cats>> getCatList() async {
    List<Cats> catList = [];
    try {
      var headers = {'X-Api-Key': apiKey};
      final uri = Uri.parse(baseUrl);
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);

        // Use map to convert each item in jsonData to Cats object
        catList = jsonData.map((cat) => Cats.fromJson(cat)).toList();

        print(catList.length);
        print(catList[0].name);
        return catList;
      } else {
        print(response.reasonPhrase);
        return []; // or throw an exception if you prefer
      }
    } catch (e) {
      print(e);
      return []; // or throw an exception if you prefer
    }
  }
}
