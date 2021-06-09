import 'package:build_game/cardjava.dart';
import 'package:build_game/mario.dart';
import 'package:build_game/pesjava.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts_arabic/fonts.dart';



class Java extends StatefulWidget {
  const Java({Key key}) : super(key: key);

  @override
  _JavaState createState() => _JavaState();
}

class _JavaState extends State<Java> {
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
              child: Image.asset('assets/java.png',color: Colors.grey[600],)),
        ],
        backgroundColor: Color(0xff16373A),
        title: Text('بازی با جاوا',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Lalezar,fontWeight: FontWeight.w100,color: Colors.amber[100],fontSize: size.width*.07),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
                 GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CardJava()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 25,left: size.width*.02,right: size.width/2-53),
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
                                 image: DecorationImage(image: AssetImage(('assets/card.png'),),fit: BoxFit.fill)
                                     
                               )),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: size.height*.01,
                            color: Color(0xff142122),
                          ),
                          Text('ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.limeAccent[100],fontSize: size.width*.05),),
                          Text(' کارت مانت',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Changa,fontWeight: FontWeight.bold,color: Colors.purple[200],fontSize: size.width*.04),),
                        ],
                      ),
                    ),
                  ),

                 GestureDetector(

                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => pesjava()));
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 25,right: size.width*.02,left: size.width/2-83,bottom: 25),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color(0xff284243),
                        boxShadow: [BoxShadow(color: Colors.limeAccent,blurRadius: 3,offset: Offset(2, 2))],
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
                                  image: DecorationImage(image: AssetImage(('assets/pes.gif'),),fit: BoxFit.fill)

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






            GestureDetector(

              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => mario()));
              },

              child: Container(
                margin: EdgeInsets.only(right: size.width*.02,left: size.width/2,bottom: size.height*.05),
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xff284243),
                  boxShadow: [BoxShadow(color: Colors.white,blurRadius: 3,offset: Offset(2, 2))],
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
                            image: DecorationImage(image: AssetImage(('assets/passmario.png'),),fit: BoxFit.fill)

                        )),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: size.height*.01,
                      color: Color(0xff142122),
                    ),
                    Text('ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.limeAccent[100],fontSize: size.width*.05),),
                    Text('ماریو کوچک',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Changa,fontWeight: FontWeight.bold,color: Colors.purple[200],fontSize: size.width*.04),),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
