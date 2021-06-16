import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts_arabic/fonts.dart';


class cplusflappy extends StatelessWidget {
  const cplusflappy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xff142122),
      appBar: AppBar(
        actions: [
          Container(
              width: size.width*.08,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/flapy.png')),
          Container(
              width: size.width*.09,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/cplus.png',color: Colors.grey[600],)),
        ],
        centerTitle: true,
        backgroundColor: Color(0xff16373A),
        title: Text('FlappyBird ساخت بازی',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Katibeh,fontWeight: FontWeight.bold,color: Colors.amber[100],fontSize: size.width*.05),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""یک بازی پرنده Flappy

در اینجا طرحی ارائه شده است که طی چند روز گذشته روی آن کار کرده ام.
من از کتابخانه SFML در C ++ برای ساخت یک بازی پرنده شل و ول استفاده کرده ام. من این را به عنوان گامی به سوی یادگیری رابط کاربری گرافیکی در C ++ ایجاد کردم.

این برنامه شی گرا است زیرا معتقدم این کار نگهداری آن را کمی آسان تر می کند. اگرچه این اولین بار نیست که SFML را یاد می گیرم ، اما از آنجا که هرگز سعی نکردم چیز جدی با آن بسازم بسیار زنگ زده هستم.

Game.h
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

                  child:Text("""#pragma once

#include <SFML/Graphics.hpp>
#include "Bird.h"
#include "Obstacle.h"


class Game
{
    public:
        Game(const char*);
        ~Game();
        
        int score;
        void mainloop();
    

    private:
        sf::RenderWindow window;
        Bird bird;
        Obstacle obstacle; 

        sf::Texture background_texture;
        sf::Sprite background;

        void handle_events(const sf::Event&);

        inline void draw_objects();
        inline void update_object_positions();
        inline bool detect_loss();
};


inline bool Game::detect_loss()
{
    const auto& bird_bounds = bird.body.getGlobalBounds();
    if (bird_bounds.intersects(obstacle.top_obstacle.getGlobalBounds()))
        return true;

    if (bird_bounds.intersects(obstacle.bottom_obstacle.getGlobalBounds()))
        return true;

    return false;
}

inline void Game::update_object_positions()
{
    bird.update_bird();
    obstacle.update_obstacle();

    if (obstacle.bottom_obstacle.getPosition().x < -89)
    {
        ++score;
        obstacle.new_rand_obstacle();
    }
}

inline void Game::draw_objects()
{
    window.draw(background);
    window.draw(bird.body);
    window.draw(obstacle.bottom_obstacle);
    window.draw(obstacle.top_obstacle);
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
                  child: Text("""Game.cpp
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

                  child:Text("""#include "Game.h"
#include <iostream>


Game::~Game()
{
    std::cout << "Well played ! Score : " << score << '\n';
}

Game::Game(const char* title)
    : score{ 0 }
{
    window.create(sf::VideoMode(800, 800), title);
    
    

    if (!background_texture.loadFromFile("images//background.png"))
        std::cout << "Failed to load background image\n";

    background.setTexture(background_texture);
}

void Game::handle_events(const sf::Event& event)
{
    switch (event.type)
    {

        case sf::Event::Closed:
            window.close();
            break;

        case sf::Event::KeyPressed:
            if (event.key.code == sf::Keyboard::Space || event.key.code == sf::Keyboard::Up)
                bird.fly();
            if (event.key.code == sf::Keyboard::N)
                obstacle.new_rand_obstacle();
            break;
        
    }
}


void Game::mainloop()
{
    while (window.isOpen())
    {
        sf::Event event;
        
        while (window.pollEvent(event))
        {
            handle_events(event);
        }

        if (detect_loss())
            break;

        update_object_positions();
        window.clear();
        draw_objects();
        window.display();
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
                  child: Text("""Bird.h
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

                  child:Text("""#pragma once

#include <SFML/Graphics.hpp>


class Bird
{
    public:
        sf::Texture texture_wing_up;
        sf::Texture texture_wing_down;
        sf::Sprite body;
        sf::Vector2f acceleration;
        sf::Vector2f velocity;
    

        Bird();
        void fall();
        void fly();
        void reset();
        void update_bird();

    private:
        int start_fall;
};
                  
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""Bird.cpp
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

                  child:Text("""#include "Bird.h"
#include <iostream>

namespace
{
    const sf::Vector2f fly_acc(0, -0.01f);
    const sf::Vector2f fall_acc(0, 0.001f);
    const float fly_rot{ -30.5f };
    const float fall_rot{ 0.06f }; // offset is applied to current rotation
    const sf::Vector2f middle(35,29);
    const sf::Vector2f initial_bird_pos(320, 300);
    const float max_fall_vel = 0.4f;
    const float max_fly_vel = -0.5f;

}


void Bird::fly()
{
    acceleration = ::fly_acc;
    start_fall = static_cast<int>(body.getPosition().y-7);
    body.setRotation(::fly_rot);
    body.setTexture(texture_wing_down);
}

void Bird::fall()
{
    acceleration = ::fall_acc;
    body.rotate(::fall_rot);
    body.setTexture(texture_wing_up);

}

void Bird::reset()
{
    acceleration = { 0,0 };
    velocity = { 0,0 };
    body.setPosition(320, 300);
    body.setRotation(0);

    start_fall = 0;
}

void Bird::update_bird()
{

    velocity += acceleration;


    if (velocity.y > ::max_fall_vel) velocity.y = ::max_fall_vel;
    if (velocity.y < ::max_fly_vel) velocity.y = ::max_fly_vel;

    body.move(velocity);

    const auto& position = body.getPosition().y;
    if (position < start_fall) fall();
}

Bird::Bird()
{
    if (!texture_wing_up.loadFromFile("images//bird_wing_up.png"))
        throw std::runtime_error("Failed to load images//bird_wing_up.png\n");


    if (!texture_wing_down.loadFromFile("images//bird_wing_down.png"))
        throw std::runtime_error("Failed to load images//bird_wing_down.png");


    body.setTexture(texture_wing_up);
    body.setPosition(initial_bird_pos);

    acceleration = { 0,0 }; 
    velocity = { 0,0 };

    body.setOrigin(middle); // Imporant as it also sets the point where the bird rotates at
    start_fall = 0;

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
                  child: Text("""Obstacle.h
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

                  child:Text("""#pragma once

#include <SFML/Graphics.hpp>



class Obstacle
{
    public:
        sf::Texture texture;
        sf::Sprite bottom_obstacle;
        sf::Sprite top_obstacle;
        sf::Vector2f velocity;

        Obstacle();

        void update_obstacle();
        void new_rand_obstacle();

};


                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),








            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""Obstacle.cpp
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

                  child:Text("""#include "Obstacle.h"
 
#include <stdlib.h>    
#include <iostream>



Obstacle::Obstacle()
{
    velocity = { -0.15f,0 };
    if (!texture.loadFromFile("images//obstacle.png"))
        throw std::runtime_error("Failed to load images//obstacle.png\n");


    bottom_obstacle.setTexture(texture);
    bottom_obstacle.setPosition(720, 300);

    top_obstacle = bottom_obstacle;
    top_obstacle.rotate(180);

    
    const auto&  bottom_position = bottom_obstacle.getPosition();
    top_obstacle.setPosition(bottom_position.x+89, bottom_position.y - 250);

    srand((unsigned)time(0));
}

void Obstacle::update_obstacle()
{
    bottom_obstacle.move(velocity);
    auto bottom_position = bottom_obstacle.getPosition();
    top_obstacle.setPosition(bottom_position.x+89, bottom_position.y - 250);
}

void Obstacle::new_rand_obstacle()
{
    const auto new_pos = rand() % 600 + 200;
    bottom_obstacle.setPosition(800, (float)new_pos);
    const auto& bottom_position = bottom_obstacle.getPosition();
    top_obstacle.setPosition(bottom_position.x+89, bottom_position.y - 250);

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
                  child: Text("""main.cpp
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

                  child:Text("""#include "Game.h"

int main()
{
    Game* game = new Game("Flappy Bird");
    game->mainloop();


    delete game;
    game = nullptr;


    return 0;
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
                  child: Text("""فیزیک برای پرنده

فیزیک پرنده بخشی بود که برای کدگذاری وقت گذاشتم ، نه به دلیل سخت بودن ، اما سعی کردم نحوه سقوط و پرواز پرنده را کامل کنم. من از شتاب استفاده کردم که سرعت را تغییر می دهد. مقادیر داده شده به شتاب بسیار اندک است ، اما هر قاب آن جمع می شود بنابراین حرکت کلی پرنده واقعاً خوب به نظر می رسد. هر زمان که پرواز () فراخوانی می شود ، یک نقطه بالاتر از پرنده قرار می دهد که در آن پرنده شروع به رفع انسداد می کند. از این رو start_fall (). من از نحوه پرواز پرنده خوشحالم ...

دو تصویر وجود دارد ، یکی با بالهای پرنده و دیگری عادی. وقتی fly () نامیده می شود ، من به بال های پرتوی سوئیچ می کنم و هنگامی که شروع به افتادن می کند ، دوباره به بالهای عادی برمی گردم ، این نیز به اثر می افزاید و جلوه بهتری می دهد.

پرنده نیز با توجه به سرعت خود می چرخد.

موانع کاملاً رو به جلو است.

یک مانع در پایین دارای سرعت ثابت است و به طور تصادفی در هر نسل جدید بر روی محور y قرار می گیرد.

مانع بالا 180 درجه چرخانده شده و با مانع پایانی همسو می شود.
آنچه از بررسی انتظار دارم

جنبه های عمومی کدگذاری
مواردی مانند شتاب ، مبدا ، موقعیت ها همه ثابت هستند و bird.cpp بسیاری از آنها را دارد. در ابتدا ، من تصمیم گرفتم فقط از ثابت ثابت شناور استفاده کنم ، اما سپس اعداد جادویی خیلی خوب به نظر نمی رسند. از این رو ، من تصمیم گرفتم که آنها را در یک فضای نامی ناشناس نگه دارم ، زیرا فقط در bird.cpp استفاده می شود. آیا این روش بهتری برای انجام این کار است؟ همچنین ، شما به چه روشی معمولاً ذخیره چنین چیزهایی را ترجیح می دهید؟
                 """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
                width: size.width*.1,
                margin: EdgeInsets.symmetric(vertical: 5),
                //height: size.height*.4,
                child: Image.asset('assets/flap1.png')),
            Container(
                width: size.width*.1,
               // height: size.height*.4,
                child: Image.asset('assets/flapy.png')),
            Container(
                width: size.width,
                 height: size.height*.4,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Image.asset('assets/passflap.png')),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""ترجیح دهید متغیرهای عضو در صورت امکان خصوصی باشند

متغیرهای عضو زیادی عمومی هستند که در خارج از کلاس استفاده نمی شوند. به عنوان مثال ، Game :: score ، Bird :: texture_wing_up و موارد دیگر. اینها باید خصوصی باشند ، زیرا این امر از دسترسی تصادفی سایر کلاسها به این متغیرهای عضو جلوگیری می کند.
از خط کشی زودرس توابع خودداری کنید

چرا detect_loss () ، update_object_positions () و draw_objects () به عنوان توابع درون خطی در Game.h اعلام می شوند؟ من دلیلی نمی بینم که چرا این عملکرد حیاتی است. آنها را به عنوان عملکردهای عضو عادی اعلام کرده و در Game.cpp تعریف کنید. توجه داشته باشید که خود کامپایلر وقتی از توابع mainloop فراخوانی می شود ، هنوز می تواند تصمیم بگیرد که این توابع را درون خطی کند.
چه کسی مسئول چه چیزی است

بازی شما کاملاً ساده است و Game :: draw_objects () کاملاً منطقی به نظر می رسد. اما آنچه که در واقع انجام می دهد این است که دسترسی به کلاس Class به کلاس Bird و class Obstacle ، و دسترسی به متغیرهای عضو آن در بدنه و پایین / top_obstacle. این بدان معنی است که اکنون یک اتصال کاملاً تنگ بین آن طبقات وجود دارد. اما اکنون در نظر بگیرید که ترسیم پرنده بسیار پیچیده تر از طراحی تنها یک sf :: Sprite است. شاید تعداد زیادی روح جداگانه داشته باشید ، به عنوان مثال یکی برای بال ها ، دیگری برای بدن ، دیگری برای سر و غیره ، که همه به طور مستقل متحرک می شوند. آیا می خواهید در این صورت Game class مسئولیت طراحی یک پرنده را داشته باشد؟

روش های مختلفی برای پرداختن به این موضوع وجود دارد. شما می توانید به سادگی یک تابع عضو اضافه کنید که تمام نقاشی ها را در کلاس Bird انجام می دهد:
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

                  child:Text("""void Game::draw_objects() {
    ...
    bird.draw(window);
    ...
}

void Bird::draw(sf::RenderTarget &target) {
    target.draw(body);
}  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""من از این واقعیت استفاده کردم که sf :: Window از sf :: RenderTarget ناشی می شود ، بنابراین Bird :: draw () اکنون عمومی تر از این است که اگر شما به یک sf :: Window مراجعه کنید. متناوباً ، با SFML ، می توانید Bird را به یک sf تبدیل کنید: Drawable ، مانند این موارد:
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

                  child:Text("""void Game::draw_objects() {
    ...
    window.draw(bird);
    ...
}

class Bird: public sf::Drawable {
    ...
    Bird::draw(sf::RenderTarget &target, sf::RenderStates states) final;
    ...
};

void Bird::draw(sf::RenderTarget &target, sf::RenderStates states) {
    target.draw(body);
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
                  child: Text("""با استفاده از هر دو روش ، می توانید متغیرهای sf :: Sprite را خصوصی کنید و گرچه به نظر نمی رسد پیشرفت زیادی برای Bird داشته باشد ، اما در حال حاضر برای Obstacle جالبتر است ، جایی که در Game :: draw_objects () فقط باید داشته باشید فراخوانی window.draw (مانع) برای اینکه مانع خودش قسمتهای پایین و بالا را بکشد.

(برای بازی هایی که اشیا much بسیار بیشتری دارند ، ممکن است بخواهید با استفاده از یک سیستم اجزای Entity مانند EnTT ، که در آن یکی از اجزای سازنده قسمت قابل ترسیم موجوداتی مانند پرنده و مانع است ، اما این بدرستی است که ضرر کامل برای این بازی است. )
Have Game :: handle_events () حلقه while را پیاده سازی کند

علیرغم نام ، Game :: handle_events () فقط یک رویداد را کنترل می کند ، حلقه while که اطمینان از رسیدگی به همه رویدادهای صف را دارد در Game :: mainloop () است. در نظر بگیرید حلقه while را به handle_events منتقل کنید ().
برای ساده سازی بیشتر mainloop () render () تابع ایجاد کنید

برای انجام رندر ، یک عملکرد سطح بالا ایجاد کنید. با این کار mainloop () خوب و تمیز است:
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

                  child:Text("""void Game::render() {
    window.clear();
    draw_objects();
    window.display();
}

void Game::mainloop() {
    while (running)
    {
        handle_events();
        update_object_positions();
        render();
    }
}    """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""در صورت بسته بودن پنجره ، یک متغیر عضو در حال اجرا ایجاد کنید که می تواند در handle_events () نادرست تنظیم شود ، یا اگر برخورد بین پرنده و مانع تشخیص داده شود ، با استفاده از update_object_positions ().
ثابت های جهانی را به صورت مصنوعی در آورید

بسیار خوب است که از ثابتهای جادویی در کد خود اجتناب کرده و نامهای واضحی به آنها داده اید. فضای نام ناشناس همان استاتیک را انجام می دهد و اطمینان حاصل می کند که ارتباط خارجی ندارند. اما حتی بهتر این است که آنها را به جای ساختار ، مصنوعی کنیم. این امر برای کامپایلر روشن می کند که منظور این نیست که به عنوان یک متغیر (که می توان آدرس آن را به عنوان مثال در نظر گرفت) ، بلکه فقط به عنوان یک ثابت تحت اللفظی استفاده می شود.
هنوز ثابت های جادویی باقی مانده است

هنوز مقدار ثابت جادویی در کد شما وجود دارد. به عنوان مثال ، اندازه پنجره ، موقعیت اولیه مانع و غیره.
تنظیم مجدد تماس () از سازنده

شما چند تکرار کد غیر ضروری دارید ، زیرا متغیرهای عضو را به صورت دستی در سازنده Bird و Obstacle تنظیم می کنید ، همچنین از Bird :: reset () و Obstacle :: new_rand_obstacle () تنظیم کرده اید. در نظر بگیرید که دو تابع اخیر را از سازندگان آن کلاس ها فراخوانی کنید.
از توابع مولد اعداد تصادفی C ++ استفاده کنید

C ++ از امکانات تولید کننده تعداد تصادفی بسیار بهتر از C برخوردار است. سپس از آن به جای rand () استفاده کنید. به عنوان مثال می توانید از std :: uniform_int_distribution در Obstacle استفاده کنید.
از std :: min و std :: max استفاده کنید

مثلا:
                  
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

                  child:Text("""void Bird::update_bird()
{

    velocity += acceleration;
    velocity.y = std::min(std::max(velocity.y, max_fly_vel), max_fall_vel);
    ...
}""",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""یا حتی بهتر ، با C ++ 17 می توانید بنویسید:
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

                  child:Text("""velocity.y = std::clamp(velocity.y, max_fly_vel, max_fall_vel);""",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""از تخصیص اشیا on روی پشته بدون دلیل مهم خودداری کنید

نیازی به استفاده از new () نیست ، فقط می توانید بنویسید:
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

                  child:Text("""int main()
{
    Game game("Flappy Bird");
    game.mainloop();
}""",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""اگر می خواهید یا از تخصیص شی روی پشته خودداری کنید ، باید همچنان از استفاده جدید و حذف مستقیم خودداری کنید ، اما در عوض از چیزی مانند std :: unique_ptr برای مدیریت خودکار عمر خود استفاده کنید. مانند این:
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

                  child:Text("""int main()
{
    auto game = std::make_unique<Game>("Flappy Bird");
    game->mainloop();
}""",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""من متخصص SFML نیستم ، بنابراین واقعاً نمی توانم در این باره توصیه ای کنم. اگرچه ، بگذارید کد را همانطور که هست نگاه کنم.

بیایید با Game.h شروع کنیم:
بازی شما به عنوان یک استدلال سازگار است ، اگر شما با C ++ 17 کامپایل می کنید ، من std :: string_view را توصیه می کنم. این دارای بسیاری از ویژگی های رشته std :: است و مانند ساختار رفتار می کند *
من دوست دارم که چگونه چندین عضو خود را در پشت توابع مربوطه محصور کنید ، اما چرا نمره عمومی است؟
می توانم نیاز درون خطی چند عملکرد را درک کنم. با این حال ، اگر این توابع فقط از روشهای دیگر شما قابل فراخوانی هستند (که همه در cpp پیاده سازی شده اند) ، چرا آنها را در همان سرصفحه پیاده سازی می کنید. این باعث افزایش زمان کامپایل (به ویژه در پروژه های بزرگ) و قرار دادن جزئیات خصوصی در پرونده عمومی می شود.
در یکی از توابع x را با -89 مقایسه می کنید ، این برای من به عنوان خواننده کمی عجیب است ، این عدد چقدر است؟ نمایندگی آن چیست قرار دادن آن در یک ثابت به درک بسیار زیادی از دلیل پذیرفتن هر مقدار از -inf تا (و از جمله) -90 کمک زیادی می کند.

Game.cpp:
در این حالت بازهم برخی ثابتهای جادویی دارید: background.png در اینجا منطقی است که این را به صورت ثابت قرار دهید ، به این ترتیب ، بعداً می توانید از یک مولد کد برای ایجاد این ثابت ها بر اساس تصاویر واقعی استفاده کنید (یا حتی آنها را تعبیه کنید) و در صورت از بین رفتن ، در تنظیمات با شکست مواجه می شوید.
بارگیری نشد ... به نظر می رسد خطا است ، اما شما این را به جای std :: cerr به std :: cout پخش می کنید. در نتیجه ، کنسول نمی تواند به این شکل متفاوت باشد.
با مشاهده همان پیام ، کاربر شما متحیر خواهد شد ، چگونه باید این مسئله را حل کند؟ اگر به آنها جایی که انتظار داشتید تصویر قرار داشته باشد اشاره کنید می تواند به شما کمک کند تا بتوانند تصویر جدیدی در آنجا قرار دهند.

Bird.h:

    start_fall با نوشتن int start_fall شروع نمی شود {0}؛ می توانید بگویید این باید صفر باشد. به این ترتیب ، شما نمی توانید آن را در cpp فراموش کنید.

Bird.cpp:
بیایید به layout نگاهی بیندازیم ، در update_bird کد و اگر را روی 1 خط قرار می دهید ، در Ctor ، آن را روی 2 قرار می دهید.
در همان عملکرد update_bird ، به نظر می رسد که شما در حال اصلاح سرعت هستید. من چیزی شبیه این می نویسم: velocity.y = std :: clamp (velocity.y، :: max_fly_vel، :: max_fall_vel)؛ بسیار آسان تر برای خواندن آنچه اتفاق می افتد ، شانس کمتری برای نوشتن چیزی اشتباه است.
در Ctor ، شما استثناهایی را پرتاب می کنید ، اما من هیچ اشاره ای به noexcept یا در این مورد noexcept (false) نمی بینم که کاربران خود را در مورد انتظار استثناها مطلع سازم.
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
