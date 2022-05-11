import 'package:flutter/material.dart';
import 'package:otomax/model/product.dart';
import 'package:otomax/repository.dart';
import 'package:otomax/theme.dart';
import 'package:otomax/widgets/detail_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({ Key? key, required this.productList, required this.text }) : super(key: key);
  final List<ProductModel> productList;
  final String text;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Repository repository = Repository();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.text,
        style: blackTextStyle.copyWith(fontSize: 25)
       ),
      ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
            child: GridView.builder(
                  itemCount: widget.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75), 
                  itemBuilder: (context, index){
                    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5)
            ),
        child: GestureDetector(
            onTap: (() {
              Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(productModel: widget.productList[index]),
                  ));
            }),
            child: Image.network(repository.getBaseUrl("imageproduct.php?name=")+widget.productList[index].gambar_produk)),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
            child: Text(
              widget.productList[index].nama_produk.toString(), 
              style: blackTextStyle.copyWith(fontSize: 20)
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              Text(
                "Rp "+widget.productList[index].harga_produk.toString(), 
                style: TextStyle(color: Colors.black87)
                ),
            ],
          ),
        ),
      ],
    );
                  },
                  ),
          ),
        ),
      ),
    );
  }
}