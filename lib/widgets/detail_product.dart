import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otomax/theme.dart';
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
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
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

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(16)
          ),
        child: Image.asset('assets/promo.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            'Enkei Ring 16', 
            style: blackTextStyle.copyWith(fontSize: 20)
            ),
        ),
        Text(
          "Rp 1.500.000", 
          style: TextStyle(fontWeight: FontWeight.bold)
          ),
      ],
    );
  }
}
