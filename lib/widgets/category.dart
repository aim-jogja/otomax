import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otomax/repository.dart';
import 'package:otomax/widgets/category_card.dart';
import 'package:otomax/model/rec.dart';
import 'package:otomax/widgets/detail_product.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Rec> _listRec = [];
  Repository repository = Repository();

  getData() async{
    await repository.getData();
    setState(() {});
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
            return ListTile(
              title: Text(_listRec[index].merek),
            );
          },
        )
         ,
       
          )
    )
    );
  }
}