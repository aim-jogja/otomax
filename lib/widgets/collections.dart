import 'package:flutter/material.dart';
import 'package:otomax/model/product.dart';
import 'package:otomax/repository.dart';
import 'package:otomax/widgets/product_list.dart';

class Collections extends StatefulWidget {
  Collections({Key? key}) : super(key: key);

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  Repository repository = Repository();
  List<ProductModel> recomendList = [];
  List<ProductModel> promoList = [];

  getProductByRecomendation() async{
    var result = await repository.getProductByRecomendation();
    setState(() {
      recomendList = result;
    });
  }

  getProductByPromo() async{
    var result = await repository.getProductByPromo(1);
    setState(() {
      promoList = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  getProductByPromo();
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductList(productList: promoList, text: "Promo")));
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.asset('assets/promo.png', fit: BoxFit.cover)),
            )),
        Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    getProductByRecomendation();
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductList(productList: recomendList, text: "Recomendation")));
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child:
                        Image.asset('assets/enkei16.jpg', fit: BoxFit.cover))))
      ],
    )
    )
      ),
    );
  }
}
