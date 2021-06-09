import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';


class mario extends StatelessWidget {
  const mario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xff142122),
      appBar: AppBar(
        actions: [
          Container(
              width: size.width*.06,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/m1.png',)),

          Container(
              width: size.width*.09,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,

              child: Image.asset('assets/java.png',color: Colors.grey[600],)),
        ],
        centerTitle: true,
        backgroundColor: Color(0xff16373A),
        title: Text('ساخت بازی ماریو',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Katibeh,fontWeight: FontWeight.bold,color: Colors.amber[100],fontSize: size.width*.05),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(""" بازی کوچک ماریو

من یک بازی ماریو کوچک دارم که شروع به کار کردم و فهمیدم که قالب آن بسیار کثیف است. آیا کسی می تواند کد من را در مورد چگونگی دستیابی به آن بهتر ، سریع تر ، آراسته تر و آسان تر نقد کند؟

frame.java
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ClayContainer(
                width: size.width,
                borderRadius: 12,
                curveType: CurveType.concave,
                depth: 10,
                surfaceColor: Color(0xff142122),
                // height: size.height,
                color: Color(0xff16373A),

                child: Padding(

                  padding: EdgeInsets.all(10),

                  child:Text("""package EvilMario;                                                                           //Include this class in the EvilMario game package

import javax.swing.JFrame;                                                                   //Import the JFrame

public class frame {                                                                         //Run this class to run the game
        public static void main(String[] args) {                                                 //The first method called by java
                JFrame frame = new JFrame("EvilMario v.1.0.2 by Max Mastalerz");                     //Create JFrame called frame

                frame.getContentPane().add(new board());                       //Go to board class
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);                                //Make frame close on X click
                frame.setSize(600,413);                                                              //Set the frame size to the size of the background
                frame.setResizable(false);                                                           //Make sure the user can't resize the frame
                frame.setLocation(20, 50);                                                           //Place the frame in a nicer position
                frame.setVisible(true);                                                              //Make the frame visible

                int frameWidth  = frame.getContentPane().getWidth();
                int frameHeight  = frame.getContentPane().getHeight();
        }
}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""board.java
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ClayContainer(
                width: size.width,
                borderRadius: 12,
                curveType: CurveType.concave,
                depth: 10,
                surfaceColor: Color(0xff142122),
                // height: size.height,
                color: Color(0xff16373A),

                child: Padding(

                  padding: EdgeInsets.all(10),

                  child:Text("""package EvilMario;                                                                           //Include this class in the EvilMario game package

import java.awt.*;                                                                           //Imported to allow use of Image
import java.awt.event.*;                                                                     //Imported to allow use of ActionListener

import javax.swing.*;

public class board extends JPanel implements ActionListener {
        player p;                                                                                //Instance of player class
        Image background, menuBg;                                                                //The background images
        Timer time;                                                                              //A timer
        private menu Menu;
        private frame Frame;

        public static enum STATE {MENU,GAME};

        public static STATE State = STATE.MENU;

        public board() {
                this.addMouseListener(new mouseInput());
                p = new player();                                                                    //Start running player class
                Menu = new menu();

                addKeyListener(new AL());                                                            //Listen for keys
                setFocusable(true);                                                                                                                  //Allows movement         
                ImageIcon i = new ImageIcon("D:/ICS3U1/EvilMario/images/Menu.jpg");                  //Image for menu
                menuBg = i.getImage();
                i = new ImageIcon("D:/ICS3U1/EvilMario/images/EvilMario_Background.png");  //Image for background
                background = i.getImage();                                                           //Give the background the image
                time = new Timer(20,this);                                                           //Timer set to update "this" class every 20 milliseconds(Approximately 50fps)
                time.start();                                                                        //Actually start the timer
        }

        public void actionPerformed(ActionEvent e) {
                p.move();                                                                            //Call the move method from the player class
                repaint();                                                                           //Repaint
        }

        public void paintComponent(Graphics g) {                                                 //Graphics method
                if(State==STATE.GAME) {
                        super.paintComponent(g);
                                Graphics2D g2d = (Graphics2D) g;                                             //casts 2d graphics(or however you would explain it)

                                g2d.drawImage(background, -p.nx, 0, null);                                   //Draw the background image
                                g2d.drawImage(background, -p.nx2, 0, null);                                  //Draw the background image

                                if(-p.nx<-575)                                                              //If going forwards
                                        p.nx=-575;                                                              //Start placing forwards every 575px in front on the last one
                                else if(-p.nx>575)                                                          //If going backwards
                                        p.nx=575;                                                               //Start placing backwards every 575px behind the last one

                                if(-p.nx2<-575)                                                             //If going forwards
                                        p.nx2=-575;                                                             //Start placing forwards every 575px in front on the last one
                                else if(-p.nx2>575)                                                         //If going backwards
                                        p.nx2=575;                                                              //Start placing backgrounds every 575px behind the last one

                                g2d.drawImage(p.getImage(), p.getX(), p.getY(), null);                      //Draw the player at the position he is currently(Coordinate values taken from player class)
                } else {
                        g.drawImage(menuBg, 0, 0, null);
                        menu.render(g);
                }
        }

        private class AL extends KeyAdapter {                                                    //Action Listener extends key adapter
                public void keyPressed(KeyEvent e) {                                                 //On key press
                        p.keyPressed(e);                                                                 //Send whatever key was pressed  TO the keyPressed  method in the player class
                }
                public void keyReleased(KeyEvent e) {                                                //On key release
                        p.keyReleased(e);                                                                //Send whatever key was released TO the keyReleased method in the player class
                }
        }
}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""player.java
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ClayContainer(
                width: size.width,
                borderRadius: 12,
                curveType: CurveType.concave,
                depth: 10,
                surfaceColor: Color(0xff142122),
                // height: size.height,
                color: Color(0xff16373A),

                child: Padding(

                  padding: EdgeInsets.all(10),

                  child:Text("""package EvilMario;                                                                               //Include this class in the EvilMario game package

import java.awt.Image;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;

public class player {
    int x, dx, y, nx, nx2, distanceTraveled;                                                     //x coordinate,change in x coordinate,y coordinate,1st rep bg,2nd rep bg,dist traveled
    Image player;                                                                                //The player variable
    ImageIcon playerFacingLeft = new     ImageIcon("D:/ICS3U1/EvilMario/images/MarioLeft.png");  //Image for player while he is     turning left
    ImageIcon playerFacingRight = new     ImageIcon("D:/ICS3U1/EvilMario/images/MarioRight.png");//Image for player while he is turning right

        public player() {
            player = playerFacingRight.getImage();                                               //Give the player the image
            x = 75;                                                                              //The original x position of the player
            y = 285;                                                                             //The original y position of the player
            nx = -0;                                                                             //Repeating background 1
            nx2 = -575;                                                                          //Repeating background 2
            distanceTraveled = 24;
        }

        public void move() {
            if(x>0 && x<300) {                                                                   //If the player is within the moving area
                x = x+dx;                                                                        //The x position is updated to become itself+the amount you moved
                nx = nx+dx;                                                                      //Place the repeating background at regular speed
                nx2 = nx2+dx;                                                                    //Place the repeating background at regular speed
            }
            if(x<=0) {                                                                           //If the player has reached he very left side of the screen(0px)
                x=1;                                                                             //Move him up a pixel so he can move again
                nx = nx+(dx*(int)0.5);                                                           //Place the background at a slower speed since Mario stops moving
                nx2 = nx2+(dx*(int)0.5);                                                         //Place the background at a slower speed since Mario stops moving
            }
            if(x>=300) {                                                                         //If the player has reached the center of the screen(300px)
                x=299;                                                                           //Move him down a pixel so he can move again
                nx = nx+(dx*(int)0.5);                                                           //Place the background at a slower speed since Mario stops moving
                nx2 = nx2+(dx*(int)0.5);                                                         //Place the background at a slower speed since Mario stops moving
            }
            if(dx>0)distanceTraveled++;else if(dx<0)distanceTraveled--;
            if(distanceTraveled>104)x=299;
            if(x==1 && dx<0)
                distanceTraveled++;
            if(distanceTraveled<104){
                nx=0;
                nx2=-575;
            }
        }

        public int   getX()     { return x;      }                                               //This method will return the x.      Is used by other classes
        public int   getY()     { return y;      }                                               //This method will return the y.      Is used by other classes
        public Image getImage() { return player; }                                               //This method will return the player. Is used by other classes

        public void keyPressed(KeyEvent e) {                                                     //Called from the board class, the argument is whatever key was pressed
            int key = e.getKeyCode();                                                            //The key originally sent from the board class

            if(key == KeyEvent.VK_LEFT) {                                                        //If the key sent was LEFT
                player = playerFacingLeft.getImage();                                            //Make the player face leftwards
                if(distanceTraveled<104)dx=-3;else dx=-2;
            }

            if(key == KeyEvent.VK_RIGHT) {                                                       //If the key sent was RIGHT
                player = playerFacingRight.getImage();                                           //Make the player face rightwards
                if(distanceTraveled<104)dx=3;else dx=2;
            }
        }

        public void keyReleased(KeyEvent e) {                                                    //Called from the board class, the argument is whatever key was released
             int key = e.getKeyCode();                                                           //The key originally sent from the board class

            if(key == KeyEvent.VK_LEFT || key == KeyEvent.VK_RIGHT)                              //If the left or right key was released
                dx = 0;                                                                          //Stop moving
        }
}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""menu.java
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ClayContainer(
                width: size.width,
                borderRadius: 12,
                curveType: CurveType.concave,
                depth: 10,
                surfaceColor: Color(0xff142122),
                // height: size.height,
                color: Color(0xff16373A),

                child: Padding(

                  padding: EdgeInsets.all(10),

                  child:Text("""package EvilMario;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;

public class menu {
    public static Rectangle playButton = new Rectangle(10, 50, 100, 37);
    public static Rectangle helpButton = new Rectangle(10, 102, 100, 37);
    public static Rectangle quitButton = new Rectangle(10, 154, 100, 37);

    public static void render(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;

        Font fnt0 = new Font("arial", Font.BOLD, 45);
        Font fnt1 = new Font("arial", Font.BOLD, 30);
        Font fnt2 = new Font("arial", Font.BOLD, 15);
        g.setFont(fnt0);
        g.setColor(Color.white);
        g.drawString("EvilMario", 10, 40);

        g.setFont(fnt1);
        g.drawString("Play", playButton.x + 19, playButton.y + 29);
            g2d.draw(playButton);
        g.drawString("Help", helpButton.x + 19, helpButton.y + 29);
            g2d.draw(helpButton);
        g.drawString("Quit", quitButton.x + 19, quitButton.y + 29);
            g2d.draw(quitButton);

        g.setFont(fnt2);
        g.drawString("Version 0.0.2",500,380);
    }
}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""mouseInput.java
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: ClayContainer(
                width: size.width,
                borderRadius: 12,
                curveType: CurveType.concave,
                depth: 10,
                surfaceColor: Color(0xff142122),
                // height: size.height,
                color: Color(0xff16373A),

                child: Padding(

                  padding: EdgeInsets.all(10),

                  child:Text("""package EvilMario;

import java.awt.Rectangle;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class mouseInput implements MouseListener{
    public void mousePressed(MouseEvent e) {
        int mx = e.getX();
        int my = e.getY();

        if(mx>=10 && mx<=110) {
            if(my>=50 && my<=87) {
                board.State = board.STATE.GAME;
            }
            if(my>=102 && my<=139) {
                //HELP
            }
            if(my>=154 && my<=191) {
                System.exit(1);
            }
        }
    }
    public void mouseClicked(MouseEvent e) {}
    public void mouseReleased(MouseEvent e) {}
    public void mouseEntered(MouseEvent e) {}
    public void mouseExited(MouseEvent e) {}
}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""اگر می خواهید بازی را امتحان کنید ، در اینجا فایلهای تصویری وجود دارد:
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
                width: size.width,
                height: size.height*.4,
                margin: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/m0.jpg'))
                ),
            ),
            Container(
              width: size.width,
              height: size.height*.4,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/passm.png'))
              ),
            ),

                Container(
                  width: size.width,
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/m1.png'))
                  ),
                ),
                Container(
                  width: size.width,
                  height: 40,

                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/m2.png'))
                  ),
                ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""من در مورد خطوط زیادی توضیح دادم تا بتوانید منطق بازی را درک کنید.
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            SizedBox(height: size.height*.06,),

          ],
        ),
      ),



    );
  }
}
