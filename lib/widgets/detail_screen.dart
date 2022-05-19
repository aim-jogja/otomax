import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otomax/model/product.dart';
import 'package:otomax/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Repository repository = Repository();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Color iconColor = Colors.black45;
  String categoryName = "";

  Future<void> isWhislist()async{
    final SharedPreferences prefs = await _prefs;
    if(prefs.getStringList('whislist') != null){
      List<String>? savedList = prefs.getStringList('whislist');

      List<int> savedListInt = savedList!.map((e) => int.parse(e)).toList();
        
        if(savedListInt.contains(widget.productModel.id)){
          setState(() {
            iconColor = Colors.amber;
          });
        }
    }
  }

  Future<void> addWhislist(int id)async{
      final SharedPreferences prefs = await _prefs;
      List<String>? savedList;

      if(prefs.getStringList('whislist') != null){
        savedList = prefs.getStringList('whislist');
        log('not null');

        List<int> savedListInt = savedList!.map((e) => int.parse(e)).toList();
        
        if(!savedListInt.contains(id)){
          savedListInt.add(id);
          log("${savedListInt}");
          List<String> tempList = savedListInt.map((e) => e.toString()).toList();
          prefs.setStringList('whislist', tempList);
          setState(() {
            iconColor = Colors.amber;
          });
        }else{
          savedListInt.remove(id);
          List<String> tempList = savedListInt.map((e) => e.toString()).toList();
          prefs.setStringList('whislist', tempList);
          setState(() {
            iconColor = Colors.black45;
          });
          log("${savedListInt}");
        }
      }else{
        log('pref is null');
        List<String> tempList = [];
        tempList.add(id.toString());
        prefs.setStringList('whislist', tempList);

        setState(() {
          iconColor = Colors.amber;
        });
      }     
  }

  getCategoryName(int id) async{
    var result = await repository.getCategoryName(id);
    setState(() {
      categoryName = result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isWhislist();
    getCategoryName(int.parse(widget.productModel.kategori_produk.toString()));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(widget.productModel.nama_produk.toString()+"-"+widget.productModel.kategori_produk.toString()),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Image.network(repository.getImageUrl()+widget.productModel.gambar_produk,)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                        addWhislist(widget.productModel.id);                    
                    },
                    padding: EdgeInsets.all(0), 
                    icon: new Icon(Icons.favorite, color: iconColor,))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                  widget.productModel.nama_produk.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                  categoryName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45)
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                  "Rp. " + widget.productModel.harga_produk.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    child: Text(
                    widget.productModel.deskripsi_produk.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 100,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
    );
  }
}