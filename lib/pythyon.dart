import 'package:build_game/Pcars.dart';
import 'package:build_game/pesp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';



class python extends StatelessWidget {
  const python({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff142122),


      appBar: AppBar(
        actions: [
          Container(
              width: size.width*.09,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/python.png',color: Colors.grey[600],)),
        ],
        centerTitle: true,
        backgroundColor: Color(0xff16373A),
        title: Text('بازی با پایتون',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Lalezar,fontWeight: FontWeight.w100,color: Colors.amber[100],fontSize: size.width*.07),),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>pcars()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 25,horizontal: 23),
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xff284243),
                boxShadow: [BoxShadow(color: Colors.green,blurRadius: 3,offset: Offset(2, 2))],
                borderRadius: BorderRadius.only(topRight: Radius.circular(11),bottomRight: Radius.circular(11)),

              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: size.width,
                      height: size.height*.15,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(image: AssetImage(('assets/car.gif'),),fit: BoxFit.fill)

                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: size.height*.01,
                    color: Color(0xff142122),

                  ),
                  Text('ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.limeAccent[100],fontSize: size.width*.05),),
                  Text('شبیه سازی ماشین',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Changa,fontWeight: FontWeight.bold,color: Colors.purple[200],fontSize: size.width*.04),),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>pesp()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 9,horizontal: 23),
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xff284243),
                boxShadow: [BoxShadow(color: Colors.green,blurRadius: 3,offset: Offset(2, 2))],
                borderRadius: BorderRadius.only(topRight: Radius.circular(11),bottomRight: Radius.circular(11)),

              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: size.width,
                      height: size.height*.15,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(image: AssetImage(('assets/pesp.png'),),fit: BoxFit.fill)

                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: size.height*.01,
                    color: Color(0xff142122),

                  ),
                  Text('ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.limeAccent[100],fontSize: size.width*.05),),
                  Text('فوتبال',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Changa,fontWeight: FontWeight.bold,color: Colors.purple[200],fontSize: size.width*.04),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
