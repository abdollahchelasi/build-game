
import 'package:build_game/Home.dart';
import 'package:build_game/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts_arabic/fonts.dart';


void main() {
  runApp(BuildGame());
}

class BuildGame extends StatelessWidget {
  const BuildGame({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl,
          child: MyHome()),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  int selected = 0;
  List page = [
    Home(),
    about(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: page[selected],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff096771),
        fixedColor: Colors.white,
        iconSize: 25,
        unselectedItemColor: Colors.grey[900],
        selectedFontSize: 18,
        selectedLabelStyle: TextStyle(package: 'google_fonts_arabic',fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'صفحه اصلی',),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined,),label: 'درباره ما'),
        ],
        currentIndex: selected,
        onTap: (index){
          setState(() {
            selected = index;
          });
        },
      ),
    );
  }
}





