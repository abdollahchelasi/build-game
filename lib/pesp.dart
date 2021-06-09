import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';


class pesp extends StatelessWidget {
  const pesp({Key key}) : super(key: key);

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
              child: Image.asset('assets/pp.png',)),

          Container(
              width: size.width*.06,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/python.png',color: Colors.grey[600],)),
        ],
        centerTitle: true,
        backgroundColor: Color(0xff16373A),
        title: Text('ساخت بازی فوتبال',style: TextStyle(package: 'google_fonts_arabic',fontFamily: ArabicFonts.Katibeh,fontWeight: FontWeight.bold,color: Colors.amber[100],fontSize: size.width*.05),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(""" شبیه سازی بازی فوتبال

من در حال کار بر روی یک بازی شبیه سازی فوتبال مبتنی بر متن در امتداد Football Simulator هستم. در زیر یک زیر مجموعه از کل کد من ، به ویژه توابع استفاده شده برای ایجاد یک پخش کننده جدید وجود دارد. من همچنین برای ایجاد مربی جدید ، ایجاد تیم ها ، ایجاد برنامه های هفتگی و غیره توابع (نشان داده نشده) دارم. امیدوارم بتوانم از بازخوردی که اینجا می گیرم برای بهبود بخشها نیز استفاده کنم.

قبل از اینکه کسی پیشنهاد کند داده ها را در یک پایگاه داده ذخیره کند ، من این راه را شروع کردم ، اما در عوض به چند دلیل در آخر انتخاب فرهنگ لغت ها / لیست ها شدم ، بنابراین سعی کنید گذشته را مرور کنید.

به هر حال ، اینجا می رود. بزرگترین چیزی که من با آن دست و پنجه نرم می کنم این است که مجبورم لیستی (person_data) از تمام پارامترهای مورد نیاز create_new_player را منتقل کنم. من احساس نمی کنم که لازم است قبل از فراخوانی تابع لیستی تهیه کنید ، آنرا منتقل کنید و سپس مجبور شوید آن را در داخل تابع تجزیه کنید. من می دانم که استفاده از متغیرهای جهانی توصیه نمی شود ، بنابراین مطمئن نیستم گزینه های دیگری وجود دارد. برای کارهای دیگرم باید کارهای مشابهی انجام دهم (البته با استفاده از لیستی از پارامترهای مختلف). من از همه بازخورد شما ممکن است قدردانی کنم.

ویرایش: من در پست اصلی خود اشتباه کردم ، من از player_id_index برای ردیابی تعداد بازیکنانی که ایجاد شده اند استفاده می کنم ، بنابراین دفعه بعدی که با create_new_player تماس می گیرم از همان قسمت قبلی که شروع شده است شروع می شود ، حتی اگر در زیر نشان داده نشده باشد.
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

                  child:Text("""# python3
import csv
from random import choice, randint, gauss

def create_names_first_data():
    '''
    create a list of all possible first names using text file as source data
    '''
    first_names = []
    filename_first = 'resources/names_first.txt'
    with open(filename_first, 'r') as file_to_open:
        for line in file_to_open:
            data = line.split()
            new_name = data[0]
            first_names.append(new_name)
    return first_names

def create_names_last_data():
    '''
    create a list of all possible last names using text file as source data
    '''
    last_names = []
    filename_last = 'resources/names_last.txt'
    with open(filename_last, 'r') as file_to_open:
        for line in file_to_open:
            data = line.split()
            new_name = data[0]
            last_names.append(new_name)
    return last_names

def create_states_data():
    '''
    create a list of all possible towns/state with their population 
    using text file as source data
    '''
    states = {}
    filename_states = 'resources/state_populations.csv'
    with open(filename_states, 'r') as file_to_open:
        reader = csv.DictReader(file_to_open)
        for i in reader:
            state_name = i['state']
            states[state_name] = {}
            states[state_name]['abbreviation'] = i['abbreviation']
            states[state_name]['population'] = i['population']
            states[state_name]['towns'] = {}

    towns = {}
    filename_towns = 'resources/city_populations_locations.csv'
    with open(filename_towns, 'r') as file_to_open:
        reader = csv.DictReader(file_to_open)
        for i in reader:
            town_name = i['city']
            state = i['state']
            towns[town_name] = {}
            towns[town_name]['population'] = i['population']
            towns[town_name]['latitude'] = i['latitude']
            towns[town_name]['longitude'] = i['longitude']

            for j in states:
                if state == states[j]['abbreviation']:
                    states[j]['towns'][town_name] = towns[town_name]
    return states

def get_home_town_state(states_dict):
    '''
    randomly pick a town/state
    '''
    states_list = [_ for _ in states_dict]
    state = choice(states_list)
    towns_dict = states_dict[state]['towns']
    towns_list = [_ for _ in towns_dict]
    town = choice(towns_list)
    return town, state

def generate_gauss_dist(mean, std_dev, minimum, maximum):
    '''
    utility function
    randomly generate a number based on a gauss distribution
    '''
    number = gauss(mean, std_dev)
    while (minimum <= number <= maximum) == False:
        number = gauss(mean, std_dev)
    number = int(round(number))
    return number

def create_new_player(param_list, seed=0, position=None):
    '''
    create a new player

    seed numbers are used to generate better/worse players as necessary

    if a position parameter is passed, that position will be used, otherwise
    it will be chosen based upon certain probabilities, i.e. - don't need
    many Ps/Ks

    player_interest is a dictionary of what the player cares about most when
    deciding which team to play for
    '''
    first_names_list = param_list[0]
    last_names_list = param_list[1]
    states_dict = param_list[2]
    positions_list = param_list[3]

    firstname = choice(first_names_list)
    lastname = choice(last_names_list)
    name = '{0} {1}'.format(firstname, lastname)

    town, state = get_home_town_state(states_dict)

    seeds = {
        0: {'mean': 50, 'min': 1,  'max': 100},
        1: {'mean': 92, 'min': 85, 'max': 99},
        2: {'mean': 82, 'min': 75, 'max': 89},
        3: {'mean': 69, 'min': 59, 'max': 79},
        4: {'mean': 54, 'min': 44, 'max': 64}
    }
    rating_seed = seeds[seed]
    mean = rating_seed['mean']
    std_dev = mean / 3.25
    minimum = rating_seed['min']
    maximum = rating_seed['max']
    rating = generate_gauss_dist(mean, std_dev, minimum, maximum)

    probability_list = [5, 6, 10, 5, 15, 15, 12, 13, 2, 2]
    position_probabilities = []
    for i in zip(positions_list, probability_list):
        position_probabilities.extend([i[0]] * i[1])

    if position is None:
        position = choice(position_probabilities)

    player_interests = {}
    player_interests['money'] = randint(1, 10)
    player_interests['play for a winner'] = randint(1, 10)
    player_interests['team facilities'] = randint(1, 10)
    player_interests['team location'] = randint(1, 10)
    player_interests['coach prestige'] = randint(1, 10)

    new_player = {
        'name': name,
        'position': position,
        'rating': rating,
        'player interests': player_interests,
        'home state': state,
        'home town': town
    }
    return new_player


if __name__ == '__main__':
    '''
    it isn't implemented using __name__==__main__ in the real thing,
    but you get the idea
    '''
    first_names_list = create_names_first_data()
    last_names_list = create_names_last_data()
    states_dict = create_states_data()
    positions_list = [
        'QB', 'RB', 'WR', 'TE', 'OL', 'DL', 'LB', 'DB', 'P', 'K'
    ]

    person_data = [
        first_names_list,
        last_names_list,
        states_dict,
        positions_list
    ]

    player_id_index = 0
    player_dict = {}

    for _ in range(5000):
        player_id_index += 1
        new_player = create_new_player(person_data)
        player_dict[player_id_index] = new_player
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""نیازی به تعریف و افزایش متغیر player_id_index خارج از حلقه for نیست:
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

                  child:Text("""player_id_index = 0
player_dict = {}

for _ in range(5000):
    player_id_index += 1
    new_player = create_new_player(person_data)
    player_dict[player_id_index] = new_player
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""فقط انجام دهید:
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

                  child:Text("""for player_id_index in range(1, 5000):
    player_dict[player_id_index] = create_new_player(person_data)
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""یا همه چیز را به این درک منطقی کاهش دهید:
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

                  child:Text("""player_dict = {id_: create_new_player(id_) for id_ in range(1, 5000)}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""برای خواندن بیشتر ، حلقه تاپ را در سر این حلقه باز کنید:
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

                  child:Text("""for i in zip(positions_list, probability_list):
    position_probabilities.extend([i[0]] * i[1])

for position, probability in zip(positions_list, probability_list):
    position_probabilities.extend([position] * probability )
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""Python 3.6 عملکرد جدید random.choices را به شما ارائه می دهد:
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

                  child:Text("""positions_list = ['QB', 'RB', 'WR', 'TE', 'OL', 'DL', 'LB', 'DB', 'P', 'K']
probability_list = [5, 6, 10, 5, 15, 15, 12, 13, 2, 2]
position = random.choices(positions_list, probability_list, k=1)[0]
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""در create_states_data به نظر من این کمی خواناتر به نظر می رسد (شما همچنین می توانید از یک درک منطقی در اینجا استفاده کنید ، اما کمی متراکم به نظر می رسد):
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

                  child:Text("""for i in reader:
    states[i['state']] = {'abbreviation': i['abbreviation'],
                          'population': i['population'],
                          'towns': {}}
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),


            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""در مورد متغیرهای جهانی first_names_list ، last_names_list و غیره ، از آنجا که بعداً آنها را تغییر ندهید ، ثابت های جهانی هستند. فقط می توانید در تابع create_character به آنها دسترسی پیدا کنید و نیازی به عبور از آنها نیست. این قرارداد استفاده از نامهای بزرگ برای ثابتها است تا به سایر برنامه نویسان سیگنال بدهد که نباید تغییر کنند ، به عنوان مثال FIRST_NAMES_LIST.
از نظر شما متشکریم. در واقع من در کپی کردن کد اشتباه کردم. من به player_id_index احتیاج دارم (مگر اینکه شما راه حل بهتری را پیشنهاد دهید) زیرا به من اجازه می دهد بعداً بازیکنان دیگری ایجاد کنم و تعداد افرادی را که تاکنون ساخته ام ثبت کنم. من می دانم که متغیرهای جهانی هیچ منفی هستند. آیا ثابت های جهانی قابل قبول هستند؟
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
