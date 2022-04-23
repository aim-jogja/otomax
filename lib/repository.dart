import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:otomax/model/rec.dart';

class Repository{
  final _baseUrl = 'http://192.168.100.12/otomax/getCategory.php';

  Future getData() async{
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200){
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Rec> rec = it.map((e) => Rec.fromJson(e)).toList();
        return rec;
        }
      }
       catch(e){
        print(e.toString());
    }
  }
}