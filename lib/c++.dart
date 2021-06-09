import 'package:build_game/cplusflappy.dart';
import 'package:build_game/tictactoe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';


class cplus extends StatelessWidget {
  const cplus ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff142122),


      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
              width: size.width*.1,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/cplus.png',color: Colors.grey[600],)),
        ],
        backgroundColor: Color(0xff16373A),
        title: Text('c++ بازی با',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Lalezar,fontWeight: FontWeight.w100,color: Colors.amber[100],fontSize: size.width*.07),),
      ),
      body: Column(
        children: [

          GestureDetector(


            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => tictactoe()));
            },

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xff284243),
                boxShadow: [BoxShadow(color: Colors.blue[300],blurRadius: 3,offset: Offset(2, 2))],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),bottomLeft: Radius.circular(11)),

              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: size.width,
                      height: size.height*.15,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(image: AssetImage(('assets/passtic.png'),),fit: BoxFit.fill)

                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: size.height*.01,
                    color: Color(0xff142122),
                  ),
                  Text('ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.limeAccent[100],fontSize: size.width*.05),),
                  Text('Tic Tac Toe',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Changa,fontWeight: FontWeight.bold,color: Colors.purple[200],fontSize: size.width*.04),),
                ],
              ),
            ),
          ),

          GestureDetector(


            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => cplusflappy()));
            },

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xff284243),
                boxShadow: [BoxShadow(color: Colors.purpleAccent,blurRadius: 3,offset: Offset(2, 2))],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(11),bottomLeft: Radius.circular(11)),

              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: size.width,
                      height: size.height*.15,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(image: AssetImage(('assets/flappy.webp'),),fit: BoxFit.fill)

                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: size.height*.01,
                    color: Color(0xff142122),
                  ),
                  Text('ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.limeAccent[100],fontSize: size.width*.05),),
                  Text('FlappyBird',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Changa,fontWeight: FontWeight.bold,color: Colors.purple[200],fontSize: size.width*.04),),
                ],
              ),
            ),
          ),





            ],
          ),

    );


  }
}
