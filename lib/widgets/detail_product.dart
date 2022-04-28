import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otomax/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otomax/widgets/category.dart';
import 'package:otomax/widgets/collections.dart';
import 'package:otomax/widgets/detail_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:otomax/model/rec.dart';

class DetailProduct extends StatelessWidget {
  final String text;
  DetailProduct({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(text,
        style: blackTextStyle.copyWith(fontSize: 25)
       ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: 8, //banyaknya produk kategori
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75), 
                itemBuilder: (context, index) => DetailCard(),
                ),
            ),
          ),
        ],
      )
    );
  }
}

class DetailCard extends StatefulWidget {

  const DetailCard({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  Color _iconColor = Colors.black;

  setWhislist(int c) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', 0);
    var i = prefs.getInt('count');
    int temp = i!.toInt();
    temp += c;
    prefs.setInt('count', temp);
  }

  getWhislist() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? count = prefs.getInt('count');
    return count;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16)
          ),
        child: Image.asset('assets/promo.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            'Enkei Ring 16', 
            style: blackTextStyle.copyWith(fontSize: 20)
            ),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Row(
                children: [
                  Text(
                    "Rp 1.500.000", 
                    style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  IconButton(
                    onPressed: (){
                      if(this._iconColor == Colors.red){
                        setState(() {
                            this._iconColor = Colors.black;
                        });
                      }else{
                        setState(() {
                            this._iconColor = Colors.red;
                        });
                      }
                      
                      print('this.getWhislist()');
                    },
                    padding: EdgeInsets.all(0), 
                    icon: new Icon(Icons.favorite, color: this._iconColor))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
