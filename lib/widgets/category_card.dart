import 'package:flutter/material.dart';
import 'package:otomax/model/rec.dart';
import 'package:otomax/repository.dart';
import 'package:otomax/theme.dart';

class RecCategory extends StatelessWidget {
  final Rec rec;
  RecCategory(this.rec);
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 15,
                color: Color(0xff616161).withOpacity(0.06),
              )
            ],
          ),
          height: 100,
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Image.network(repository.getBaseUrl("logo.php?name=")+rec.foto_merek, width: 60,),
                SizedBox(
                  width: 25,
                  height: 25,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rec.merek,
                      style: blackTextStyle,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.chevron_right_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}