import 'package:flutter/material.dart';
import 'package:otomax/theme.dart';
import 'package:otomax/widgets/category.dart';
import 'package:otomax/widgets/collections.dart';

class Judul {
  final String title;
  const Judul(this.title);
}

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorWeight: 0.5,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                text: 'Our Collections',
              ),
              Tab(
                text: 'Category',
              ),
            ],
          ),
          title: Text('Discover',
              style: blackTextStyle.copyWith(
                fontSize: 30,
              )),
        ),
        body: TabBarView(
          children: <Widget>[
            Collections(),
            Category(),
          ],
        ),
      ),
    );
  }
}
