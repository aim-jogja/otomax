import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:otomax/model/product.dart';
import 'package:otomax/model/rec.dart';

class Repository{
  final _baseUrl = 'http://192.168.1.20:8000/';

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

  getBaseUrl(String _url){
    return _baseUrl + _url;
  }

  Future getProductByRecomendation() async{
    try {
      final response = await http.get(Uri.parse(_baseUrl+'getProduct.php'));

      if (response.statusCode == 200){
        log(response.body);
        //print(response.body);
        Iterable it = jsonDecode(response.body);
        List<ProductModel> product = it.map((e) => ProductModel.fromJson(e)).toList();
        return product;
        }
      }
       catch(e){
        print(e.toString());
    }
  }

  Future getProductById(String id)async{
    try {
      final response = await http.get(Uri.parse(_baseUrl+'getProductById.php?id='+id));

      if (response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List<ProductModel> product = it.map((e) => ProductModel.fromJson(e)).toList();
        return product;
        }
      }
       catch(e){
        print(e.toString());
    }
  }

  Future getProductByCategory(int id) async{
    try {
      final response = await http.get(Uri.parse(_baseUrl+'getProductByCategory.php?merek='+id.toString()));

      if (response.statusCode == 200){
        log(response.body);
        //print(response.body);
        Iterable it = jsonDecode(response.body);
        List<ProductModel> product = it.map((e) => ProductModel.fromJson(e)).toList();
        return product;
        }
      }
       catch(e){
        print(e.toString());
    }
  }

  Future getProductByPromo(int id) async{
    try {
      final response = await http.get(Uri.parse(_baseUrl+'getProductPromo.php?promo='+id.toString()));

      if (response.statusCode == 200){
        log(response.body);
        //print(response.body);
        Iterable it = jsonDecode(response.body);
        List<ProductModel> product = it.map((e) => ProductModel.fromJson(e)).toList();
        return product;
        }
      }
       catch(e){
        print(e.toString());
    }
  }

  Future getCategory() async{
    try {
      final response = await http.get(Uri.parse(_baseUrl+'getCategory.php'));

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