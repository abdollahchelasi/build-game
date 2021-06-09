import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';


class pcars extends StatelessWidget {
  const pcars({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xff142122),
      appBar: AppBar(
        actions: [
          Container(
              width: size.width*.2,
              margin: EdgeInsets.symmetric(horizontal: 1),
              //height: size.height*.2,
              child: Image.asset('assets/iconcar.png',)),

          Container(
              width: size.width*.06,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/python.png',color: Colors.grey[600],)),
        ],
        centerTitle: true,
        backgroundColor: Color(0xff16373A),
        title: Text('ساخت بازی ماشین',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Katibeh,fontWeight: FontWeight.bold,color: Colors.amber[100],fontSize: size.width*.05),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""شبیه سازی ماشین برای نشان دادن بسته بندی صفحه

من علاقه مند به نوشتن کدی هستم که به شما اجازه می دهد یک شی در صفحه بپیچد. به نظر می رسید که این کار بسیار ساده تر از آنچه من انتظار داشتم بود ، بنابراین من به کار خود ادامه دادم و جعبه سفیدی را که داشتم به اتومبیلی تغییر دادم که می تواند با استفاده از مثلثات اساسی چرخش کرده و در جهتی که رو به رو است حرکت کند. سپس آن را بیشتر گسترش دادم تا تصویری از یک مسیر در زیر آن قرار داده شود ، به طوری که ماشین هنگام پیست سریعتر و هنگام چمن نیز کندتر حرکت می کند.

با این حال ، مطمئن نیستم که روش بررسی مقدار قرمز پیکسلی که ماشین روشن است بهترین راه حل است. بنابراین واقعاً می خواهم بدانم آیا روش های بهتری برای آزمایش برای آن وجود دارد یا خیر ، و همچنین بررسی بقیه کد برای دیدن اینکه آیا اصلاً قابل بهبود است ، وجود دارد.
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

                  child:Text("""import sys, pygame
from pygame.locals import *
from math import *

pygame.init()

WIDTH  = 800
HEIGHT = 600
SCREEN = pygame.display.set_mode((WIDTH,HEIGHT))
FPS    = pygame.time.Clock()

pygame.display.set_caption('Screen Wrapping')

track = pygame.image.load('Track.png').convert()

def on_track(sprite):
    '''Tests to see if car is on the track'''
    if sprite.x > 1 and sprite.x < WIDTH - 1 and sprite.y > 1 and sprite.y < HEIGHT - 1:
        if track.get_at((int(sprite.x), int(sprite.y))).r == 163 or track.get_at((int(sprite.x), int(sprite.y))).r == 0 or track.get_at((int(sprite.x), int(sprite.y))).r == 255:
            return True
    return False

class Car(object):
    def __init__(self, start_pos = (73, 370), start_angle = 90, image = 'Car.png'):
        '''Initialises the Car object'''
        self.x     = start_pos[0]
        self.y     = start_pos[1]
        self.angle = start_angle
        self.speed = 0

        self.image = pygame.transform.scale(pygame.image.load(image).convert_alpha(), (48, 48))

        self.rotcar   = pygame.transform.rotate(self.image, self.angle)

    def move(self, forward_speed = 1, rearward_speed = 0.2):
        '''Moves the car when the arrow keys are pressed'''
        keys = pygame.key.get_pressed()

        #Move the car depending on which keys have been pressed
        if keys[K_a] or keys[K_LEFT]:
            self.angle += self.speed
        if keys[K_d] or keys[K_RIGHT]:
            self.angle -= self.speed
        if keys[K_w] or keys[K_UP]:
            self.speed += forward_speed
        if keys[K_s] or keys[K_DOWN]:
            self.speed -= rearward_speed

        #Keep the angle between 0 and 359 degrees
        self.angle %= 359

        #Apply friction
        if on_track(self): self.speed *= 0.95
        else: self.speed *= 0.75

        #Change the position of the car
        self.x += self.speed * cos(radians(self.angle))
        self.y -= self.speed * sin(radians(self.angle))

    def wrap(self):
        '''Wrap the car around the edges of the screen'''
        self.wrap_around = False

        if self.x <  0 :
            self.x += WIDTH
            self.wrap_around = True

        if self.x  + self.rotcar.get_width() > WIDTH:
            self.x -= WIDTH
            self.wrap_around = True

        if self.y  < 0:
            self.y += HEIGHT
            self.wrap_around = True

        if self.y + self.rotcar.get_height() > HEIGHT:
            self.y -= HEIGHT
            self.wrap_around = True

        if self.wrap_around:
            SCREEN.blit(self.rotcar, self.rotcar.get_rect(center = (self.x, self.y)))

        self.x %= WIDTH
        self.y %= HEIGHT

    def render(self):
        '''Renders the car on the screen'''
        self.rotcar   = pygame.transform.rotate(self.image, self.angle)

        SCREEN.blit(self.rotcar, self.rotcar.get_rect(center = (self.x, self.y)))

def main():
    car   = Car()

    while True:
        #Blit the track to the background
        SCREEN.blit(track, (0, 0))

        #Test if the game has been quit
        for event in pygame.event.get():
            if event.type == QUIT:
                pygame.quit()
                sys.exit()
            if event.type == KEYDOWN:
                if event.key == K_ESCAPE:
                    pygame.quit()
                    sys.exit()

        car.move()
        car.wrap()
        car.render()

        pygame.display.update()
        FPS.tick(30)

if __name__ == '__main__': main()
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""در اینجا تصاویری وجود دارد که در بازی استفاده کرده ام

Car.png:""",style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
                width: size.width,
                height: size.height*.2,
                child: Image.asset('assets/car.png')),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""و این هم مسیر بازی 
Track.png
                  """,style: TextStyle(color: Colors.teal[200],fontWeight: FontWeight.bold,package: 'google_fonts_arabic',fontFamily: ArabicFonts.Markazi_Text,fontSize: size.width*.05),)
              ),
            ),

            Container(
                width: size.width,
                height: size.height*.4,
                child: Image.asset('assets/masir.png')),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""در تابع on_track فقط می توانید مقدار r را در تاپل بررسی کنید (163 ، 0 ، 255). همچنین به نظر می رسد می توانید این خط را حذف کنید اگر sprite.x> 1 و sprite.x <WIDTH - 1 و sprite.y> 1 و sprite.y <HEIGHT - 1: برای بررسی اینکه آیا pos در منطقه بازی است (یا میتونه بیرون باشه؟).
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

                  child:Text("""
                  def on_track(sprite):
    ""See if car is on the track.""
    color = track.get_at((int(sprite.x), int(sprite.y)))
    return color.r in (163, 0, 255)
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""در رندر فقط تصویر را در (self.x ، self.y) ببندید:
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

                  child:Text("""SCREEN.blit(self.rotcar, (self.x, self.y))
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""من توصیه می کنم تصاویر را به صورت جهانی بارگذاری نکنید ، نه به روش __init__ کلاس ها ، در غیر این صورت هنگام ایجاد نمونه جدید ، تصویر باید بارگیری شود.

از واردات ستاره استفاده نکنید ، زیرا خواندن کد آنها دشوارتر است و اگر نام / متغیرهای تکراری را نادیده بگیرند ، می توانند اشکال ایجاد کنند. از pygame.locals import * قابل استفاده است ، اما بهتر است از واردات ستاره دیگر خودداری کنید.
خوب ، ممنون از راهنمایی شما! به نظر من دستور if در funcion on_track لازم است ، در غیر این صورت خطای فهرست خارج از محدوده داده می شود. و با لکه زدن ماشین ، مجبورم از مرکز استفاده کنم تا در آن نقطه بچرخد ، می بینم که آیا می توانم سایر مواردی را که شما پیشنهاد دادید ، به خانه برسانم یا نه.
من یک نظر بسیار مشابه در مورد عملکرد on_track نوشته بودم.
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
