import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';


class about extends StatelessWidget {
  const about({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff0E3B3F),

      body: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width*.2,
                height: size.height*.15,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/abdol.jpeg'),fit: BoxFit.cover),
                    shape: BoxShape.circle
                ),),
              Container(child: Text('طراح و برنامه نویس :',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Scheherazade,fontWeight: FontWeight.bold,color: Colors.grey[600],fontSize: size.width*.07)),),
              Container(child: Text('عبدالله چلاسی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.white,fontSize: size.width*.09)),),

            ],
          ),
        ],
      )

    );
  }
}
