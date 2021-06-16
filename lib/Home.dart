import 'package:build_game/pythyon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

import 'Java.dart';
import 'c++.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff284243),
      body:  SafeArea(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff16393A),
                Color(0xff16393A),
                Color(0xff142122),
              ],begin: Alignment.bottomRight,end: Alignment.centerLeft)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: myCliper(),
                  child: Container(
                    width: size.width,
                    height: size.height * .35,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff0E3B3F),
                          Color(0xff096771),
                        ])
                    ),
                    child: SingleChildScrollView(

                        child: Column( mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            Container(
                              margin: EdgeInsets.only(top: size.height*.04),
                              width: size.width*.13,
                              height: size.height*.08,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/icon.png'),fit: BoxFit.fill)
                              ),
                            ),

                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('آموزش',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontWeight: FontWeight.bold,color: Colors.purple[100],fontSize: size.width*.07),),
                                SizedBox(width: size.width*.02,),
                                Text('ساخت',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Lalezar,fontWeight: FontWeight.bold,color: Colors.amber[100],fontSize: size.width*.07),),
                                SizedBox(width: size.width*.02,),
                                Text('بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Scheherazade,fontWeight: FontWeight.bold,color: Colors.white,fontSize: size.width*.09),),
                              ],
                            ),



                          ],)),
                  ),),


                SizedBox(height: 30,),



                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Java()));
                  },
                  child: ClipPath(
                    clipper: myClip(),
                    child: Container(
                      width: size.width,
                      //height: size.height*.25,
                      margin: EdgeInsets.symmetric(vertical: 9,horizontal: 9),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Color(0xff61EACD),blurRadius: 4,offset: Offset(1, 1))],
                          gradient: LinearGradient(colors: [
                            Color(0xff3D5A5D),
                            Color(0xff3D5A5D),
                            Color(0xff073235),



                          ],begin: Alignment.topRight,end: Alignment.bottomLeft)
                      ),

                      child: SingleChildScrollView(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width,
                              height: size.height*.03,
                              decoration: BoxDecoration(
                                  color: Color(0xff142122),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: size.width*.2,
                                  height: size.height*.13,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(

                                      image: DecorationImage(image: AssetImage('assets/java.png'),fit: BoxFit.fill)
                                  ),
                                ),
                                Container(

                                    child: Column(
                                      children: [
                                        Text('ساخت بازی با',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Mirza,fontWeight: FontWeight.bold,color: Colors.amber[900],fontSize: size.width*.06),),
                                        Text('جاوا',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Cairo,fontWeight: FontWeight.bold,color: Colors.white,fontSize: size.width*.07),),
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: size.height*.03,
                              color: Color(0xff142122),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> cplus()));
                  },
                  child: ClipPath(
                    clipper: myClip(),
                    child: Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(vertical: 9,horizontal: 9),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Color(0xff61EACD),blurRadius: 4,offset: Offset(1, 1))],
                          gradient: LinearGradient(colors: [
                            Color(0xff3D5A5D),
                            Color(0xff3D5A5D),
                            Color(0xff073235),



                          ],begin: Alignment.topRight,end: Alignment.bottomLeft)
                      ),

                      child: SingleChildScrollView(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width,
                              height: size.height*.03,
                              decoration: BoxDecoration(
                                  color: Color(0xff142122),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: size.width*.2,
                                  height: size.height*.13,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(

                                      image: DecorationImage(image: AssetImage('assets/cplus.png'),fit: BoxFit.fill)
                                  ),
                                ),
                                Container(

                                    child: Column(
                                      children: [
                                        Text('ساخت بازی با',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Mirza,fontWeight: FontWeight.bold,color: Colors.amber[900],fontSize: size.width*.06),),
                                        Text('++c',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Cairo,fontWeight: FontWeight.bold,color: Colors.white,fontSize: size.width*.07),),
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: size.height*.03,
                              color: Color(0xff142122),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> python()));
                  },
                  child: ClipPath(
                    clipper: myClip(),
                    child: Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(vertical: 9,horizontal: 9),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Color(0xff61EACD),blurRadius: 4,offset: Offset(1, 1))],
                          gradient: LinearGradient(colors: [
                            Color(0xff3D5A5D),
                            Color(0xff3D5A5D),
                            Color(0xff073235),



                          ],begin: Alignment.topRight,end: Alignment.bottomLeft)
                      ),

                      child: SingleChildScrollView(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width,
                              height: size.height*.03,
                              decoration: BoxDecoration(
                                  color: Color(0xff142122),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5))
                              ),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: size.width*.2,
                                  height: size.height*.13,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(

                                      image: DecorationImage(image: AssetImage('assets/python.png'),fit: BoxFit.fill)
                                  ),
                                ),
                                Container(

                                    child: Column(
                                      children: [
                                        Text('ساخت بازی با',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Mirza,fontWeight: FontWeight.bold,color: Colors.amber[900],fontSize: size.width*.06),),
                                        Text('پایتون',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Cairo,fontWeight: FontWeight.bold,color: Colors.white,fontSize: size.width*.07),),
                                      ],
                                    )),
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: size.height*.03,
                              color: Color(0xff142122),
                              //margin: EdgeInsets.symmetric(horizontal: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),





    );

  }
}

class myCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path=Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;

}

class myClip extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path=Path();
    path.lineTo(size.height-30, size.width);
    path.lineTo(size.height-30, size.width);
    path.lineTo(size.width*2, 0);



    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;

}
