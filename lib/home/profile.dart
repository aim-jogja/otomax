import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otomax/model/product.dart';
import 'package:otomax/repository.dart';
import 'package:otomax/theme.dart';
import 'package:otomax/widgets/detail_screen.dart';
import 'package:otomax/widgets/product_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int whislistCount = 0;
  Repository repository = Repository();
  List<ProductModel> _listProduct = [];

  Future<void> getDataWhislist()async{
      final SharedPreferences prefs = await _prefs;
      List<String>? savedList;
      _listProduct.clear();
      if(prefs.getStringList('whislist') != null){
        savedList = prefs.getStringList('whislist');
        List<int> savedListInt = savedList!.map((e) => int.parse(e)).toList();
        //log(savedList.toString());
        
        for(int i=0; i<savedList.length; i++){
          List <ProductModel> listProduct = await repository.getProductById(savedList[i].toString());
          setState(() {
            _listProduct.add((listProduct[0]));
          });
        }
        return;
      }
  }

  Future<void> getCount()async{
      final SharedPreferences prefs = await _prefs;
      List<String>? savedList;

      if(prefs.getStringList('whislist') != null){
        savedList = prefs.getStringList('whislist');
        List<int> savedListInt = savedList!.map((e) => int.parse(e)).toList();

        setState(() {
          whislistCount = savedListInt.length;
        });
      }
  }

  FutureOr onGoBack(){
    setState(() {
      getDataWhislist();
      getCount();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataWhislist();
    getCount();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
            child: Text('Profile',
            style: blackTextStyle.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: GestureDetector(
                onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductList(productList: _listProduct, text: 'My Whislist',))).then((value) => onGoBack());
                }),
                child: Text('Whislist (${whislistCount})',
                          style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ListView.builder(
                  itemCount: _listProduct.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                  return Container(
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      child: Center(
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(productModel: _listProduct[index]),
                              )).then((value) => onGoBack());
                            }),
                            child: Image.network(repository.getBaseUrl("imageproduct.php?name=")+_listProduct[index].gambar_produk))),
                        ),
                    ),
                );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text('Feedback',
            style: greyTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text('Email us!',
            style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            )
          ],
        )
        ),
      ),
    );
  }
}