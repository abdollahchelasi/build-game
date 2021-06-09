
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:clay_containers/clay_containers.dart';

class CardJava extends StatelessWidget {
  const CardJava({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xff142122),
        appBar: AppBar(
          actions: [
            Container(
                width: size.width*.07,
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: size.height*.1,
                child: Image.asset('assets/iconcard.png',color: Colors.red,)),
            Container(
                width: size.width*.09,
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: size.height*.1,
                child: Image.asset('assets/java.png',color: Colors.grey[600],)),
          ],
          centerTitle: true,
          backgroundColor: Color(0xff16373A),
          title: Text('ساخت بازی کارت مانت',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Katibeh,fontWeight: FontWeight.bold,color: Colors.amber[100],fontSize: size.width*.05),),
        ),

      body: SingleChildScrollView(
          child: Column(
            children: [

              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""بازی Three Card Monte با استفاده از جاوا

من با استفاده از جاوا یک بازی Three Monte Card درست کردم

مسئله:

    این بازی اصلی "توپ و فنجان" است که در آن سعی می کنید بفهمید کدام توپ دارای توپ زیر آن است. شما ممکن است با سه فنجان و یک توپ ، سه کارت (دو جک و آس) ، یا سه در و یک ماشین بازی کنید. در واقع ، به طور تصادفی یک فنجان را انتخاب کنید تا "توپ" را پنهان کنید. به بازیکن اجازه دهید حدس بزند کدام جام توپ را پنهان می کند. اگر بازیکن درست حدس بزند ، برنده می شود.


کد من:
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

                   child:Text("""/*
 * Code by CLint
 */


import java.util.Random;
import java.util.Scanner;

public class ThreeCardMonte {
    public static void main(String[] args) {
        Random random = new Random();
        Scanner input = new Scanner(System.in);
        int userInput;

        int randomN = random.nextInt(3)+1;

        System.out.println("You slide up to Fast Eddie's card table and plop down your cash.\n" +
                "He glances at you out of the corner of his eye and starts shuffling.\n" +
                "He lays down three cards.\n");
        System.out.println("Which one is the ace?\n" +
                "\t##\t##\t##\n" +
                "\t##\t##\t##\n" +
                "\t1\t2\t3");
        System.out.print("\n> ");
        userInput = input.nextInt();

        if (userInput == randomN) {
            if (randomN == 1) {
                System.out.println("\nYou nailed it! Fast Eddie reluctantly hands over your winnings, scowling.\n" +
                        "\tAA\t##\t##\n" +
                        "\tAA\t##\t##\n" +
                        "\t1\t2\t3");
            } else if (randomN == 2) {
                System.out.println("\nYou nailed it! Fast Eddie reluctantly hands over your winnings, scowling.\n" +
                        "\t##\tAA\t##\n" +
                        "\t##\tAA\t##\n" +
                        "\t1\t2\t3");
            } else if (randomN == 3) {
                System.out.println("\nYou nailed it! Fast Eddie reluctantly hands over your winnings, scowling.\n" +
                        "\t##\t##\tAA\n" +
                        "\t##\t##\tAA\n" +
                        "\t1\t2\t3");
            }
        }

        if (userInput != randomN) {
            if (randomN == 1) {
                System.out.println("\nHa! Fast Eddie wins again! The ace was card number 1.\n" +
                        "\tAA\t##\t##\n" +
                        "\tAA\t##\t##\n" +
                        "\t1\t2\t3");
            } else if (randomN == 2) {
                System.out.println("\nHa! Fast Eddie wins again! The ace was card number 2.\n" +
                        "\t##\tAA\t##\n" +
                        "\t##\tAA\t##\n" +
                        "\t1\t2\t3");
            } else if (randomN == 3) {
                System.out.println("\nHa! Fast Eddie wins again! The ace was card number 3.\n" +
                        "\t##\t##\tAA\n" +
                        "\t##\t##\tAA\n" +
                        "\t1\t2\t3");
            }
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
                    child: Text("""خروجی:

PS: من برای اصلاح کد های خود برای کارآیی و تمیز بودن آماده هستم.
از آنجا که این جریان برنامه خطی است ، چیز زیادی برای کارایی باقی نمانده است
مسئولیت منفرد

کلاس شما همه کارها را با هم انجام می دهد
خواندن ورودی کاربر
گفتگوهای چاپ
منطق بازی را کنترل کنید

با این کار شما اصل openClosed را نقض می کنید. اگر می خواهید کد خود را تغییر دهید (مثلاً یکی از چهار بازی را انجام دهید) باید تغییرات زیادی انجام دهید. اگر می خواهید مدیریت را برای InputExcepts اضافه کنید (به Scanner.nextInt (نگاه کنید)) مکان مناسب را پیدا خواهید کرد. برای هر مسئولیت کلاسهایی را بسازید!
مسائل جزئی
اعداد جادویی: (3) +1
رشته های با کد سخت (آنها را در یک فایل زبان قرار دهید) - که به شما کمک می کند تا نگرانی ها بین گفتگوها و منطق از هم جدا شوند
افزونگی (برای قالب متن از فایلهای زبان استفاده کنید)
ثابت ها

چند ثابت باعث می شود کد شما آسان تر شود. بنابراین ، به عنوان مثال یک ثابت برای تعداد کارت ها به شما امکان می دهد تا برنامه را با 2/4 کارت بازی سازگار کنید.
نامگذاری متغیر

برای راحت تر دنبال کردن برنامه ، من نام هایی را نشان می دهم که نشان می دهد یک متغیر چه چیزی را نشان می دهد نه اینکه از کجا آمده است. بنابراین ، به جای تصادفی N ، acePosition را در نظر بگیرید. به جای userInput ، حدس زده شده را در نظر بگیرید.
منطق تکراری

هنگامی که کارهایی را انجام می دهید که یکسان / کاملاً مشابه هستند ، این نشانگر خوبی است که برای استخراج در یک تابع / کلاس وجود دارد. هنگام چاپ هر یک از عبارات برنده / باخت با موقعیت کارت ، دو نسخه اصلی وجود دارد. اینها همچنین چاپ موقعیت های کارت پایان را به اشتراک می گذارند. استخراج روشی را در نظر بگیرید که می تواند موقعیت های کارت را با یک آس در یک موقعیت معین خارج کند.
اگر دیگری

وقتی دو شرط انحصاری دارید ، اگر / user به جای (userInput == randomN) و if (userInput! = randomN) از if / other استفاده کنید
کنار هم قرار دادنش

ممکن است به چیزی شبیه به این شبیه شوید:
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

                    child:Text("""public class ThreeCardMonte {
    final static int UNKNOWN_POSITION = 0;
    final static int NUMBER_OF_CARDS = 3;

    public static String formatCards(int acePosition) {
        var cardValue = IntStream.range(0, NUMBER_OF_CARDS)
                .mapToObj(i -> i + 1 == acePosition ? "\tAA" : "\t##")
                .collect(Collectors.joining()) + "\n";
        var columnLabels = IntStream.range(0, NUMBER_OF_CARDS)
                .mapToObj(i->"\t"+(i+1))
                .collect(Collectors.joining()) + "\n";

        return cardValue + cardValue + columnLabels;
    }

    public static void main(String[] args) {
        Random random = new Random();
        Scanner input = new Scanner(System.in);
        int acePosition = random.nextInt(NUMBER_OF_CARDS) + 1;


        System.out.println("You slide up to Fast Eddie's card table and plop down your cash.\n" +
                "He glances at you out of the corner of his eye and starts shuffling.\n" +
                "He lays down three cards.\n");
        System.out.println("Which one is the ace?\n" + formatCards(UNKNOWN_POSITION));
        System.out.print("> ");
        int guessedPosition = input.nextInt();

        if (guessedPosition == acePosition) {
            System.out.println("\nYou nailed it! Fast Eddie reluctantly hands over your winnings, scowling.\n" +
                    formatCards(acePosition));
        } else {
            System.out.format("\nHa! Fast Eddie wins again! The ace was card number %d.\n" +
                    formatCards(acePosition), acePosition);
        }
    }
}
                    """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                  ),
                ),
              ),

              SizedBox(height: size.height*.06,),

            ],
          ),
        ),



    );
  }
}
