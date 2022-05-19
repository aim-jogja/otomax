import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otomax/model/product.dart';
import 'package:otomax/repository.dart';
import 'package:otomax/model/rec.dart';
import 'package:otomax/widgets/product_by_category.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Rec> _listRec = [];
  List<ProductModel> productList = [];
  Repository repository = Repository();

  getData() async{
    var temp = await repository.getCategory();
    setState(() {
      _listRec = temp;
    });
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
        child: ListView.builder(
          itemCount: _listRec.length,
          itemBuilder: (context, index){
            return Card(
            child: GestureDetector(
              onTap: (() {
                Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  //builder: (context) => ProductList(productList: productList, text: _listRec[index].merek,),
                  builder: (context) => ProductByCategory(id: _listRec[index].id, text: _listRec[index].merek,),
                ));
              }),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(repository.getImageUrl()+_listRec[index].foto_merek),
              ),)
          );
          },
        )
         ,
       
          )
    )
    );
  }
}