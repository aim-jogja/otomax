import 'package:flutter/material.dart';
import 'package:otomax/home/home.dart';


//void main() => runApp(Otomax());
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Otomax());
}
class Otomax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}