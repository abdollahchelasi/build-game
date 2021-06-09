import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';



class pesjava extends StatelessWidget {
  const pesjava({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Color(0xff142122),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
              width: size.width*.2,

              child: Image.asset('assets/iconpes.png')),
          Container(
              width: size.width*.09,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height*.1,
              child: Image.asset('assets/java.png',color: Colors.grey[600],)),
        ],
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
                  child: Text("""بازی فوتبال با استفاده از libgdx و یک Entity System Framework

من در یک بازی به عنوان یک سرگرمی کار می کنم. من از معماری Entity / Component / System با استفاده از Libgdx به عنوان موتور و اشلی به عنوان Entity Framework استفاده می کنم.

من یک GamePlayScreen دارم که در آن سیستم خود را با ایجاد Entities ، Systems و Components مقدار دهی اولیه می کنم. در زیر یک قطعه کد کوچک از سازنده کلاس با فراخوانی چندین روش "ایجاد" و "راه اندازی" آورده شده است. به عنوان مثال من در زیر کد روش های createBall () و createSystems () را نشان می دهم.
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

                  child:Text("""public class GamePlayScreen extends BaseScreen  {

    public GamePlayScreen(SoccerGame game) {
        super(game);
        engine = new Engine();
        setupViewport();
        setupInput();
        createResourceHelperObjects();
        createWorld();
        createField();
        createTeams();
        createBall();
        createGoalLines();
        createMatch();
        createSystems();
    }

    public void createBall() {
        BallFactory.create(atlas, rubeSceneHelper, camera, SCENE_BOUNDS)
                   .createAndAddToEngine(EmptyObjects.EMPTY_CREATE_ARGUMENTS, engine);
    }

    public void createSystems() {
        engine.addSystem(new TeamCreationSystem(rubeSceneHelper));
        engine.addSystem(new TeamResetSystem());
        engine.addSystem(new UnprojectInputSystem());
//        engine.addSystem(new SelectPlayerByTouchSystem());
        engine.addSystem(new InputSystem());
        engine.addSystem(new AISystem());
        engine.addSystem(new MetersToPixelConvertSystem(PIXEL_TO_METER_FACTOR));
        engine.addSystem(new CameraPositionSystem());
        engine.addSystem(new RenderSystem(viewport, DEBUG_PHYSICS));
        engine.addSystem(new WorldStepSystem());
        engine.addSystem(new GameManagmentSystem());
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
                  child: Text("""Entity یک کلاس چارچوب است که نمایانگر یک شی است که توسط اجزا تشکیل شده است. من تعداد زیادی از این موجودات ، توپ ، بازیکن ، تیم ، ورودی ، بازی و غیره را دارم.

در اولین لحظه داشتم این Entities را در کلاس GamePlayScreen ایجاد می کردم. اما شروع به عظیم شدن می کند. بنابراین تصمیم می گیرم کلاسهای کارخانه ای را برای نهادهای خود ایجاد کنم. در زیر مثالی برای کارخانه های موجود در Ball و Player وجود دارد.
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

                  child:Text("""public class PlayerFactory extends CreateAndAddToEngineEntityFactory {
    public static final String PLAYER_NUMBER = "NUMBER";
    public static final String PLAYER_POSITION = "PLAYER_POSITION";
    public static final String PLAYER_NAME = "PLAYER_NAME";
    public static final String UNIFORM = "UNIFORM";
    public static final String TEAM = "TEAM";
    public static final String INITIAL_POSITION = "INITIAL_POSITION";
    private RubeSceneHelper rubeSceneHelper;
    private BodyCloner bodyCloner;

    private PlayerFactory(RubeSceneHelper rubeSceneHelper) {
        this.rubeSceneHelper = rubeSceneHelper;
        bodyCloner = BodyCloner.newInstance();

    }

    public static PlayerFactory newInstance(RubeSceneHelper rubeSceneHelper) {
        return new PlayerFactory(rubeSceneHelper);
    }

    @Override
    public Entity create(CreateArguments arguments) {
        final ScaledSprite uniform = arguments.get(UNIFORM);

        Entity player = new Entity();

        final Body bodyModel = rubeSceneHelper.getBody("player");

        final Fixture bodyFixture = rubeSceneHelper.getFixture(bodyModel, "player_fixture");
        bodyFixture.setUserData(new FixtureUserData(FixtureType.PLAYER, player));

        final Body body = bodyCloner.clone(bodyModel);

        body.setUserData(EntityUserData.newInstance(player));
        Vector2 initialPosition = arguments.get(INITIAL_POSITION);
        body.setTransform(initialPosition.x, initialPosition.y, 0);

        player.add(BodyComponent.newInstance(body));

        final Sprite sprite = new Sprite(uniform.getSprite());
        player.add(SpriteComponent.newInstance(sprite));

        final Entity team = arguments.get(TEAM);
        final PlayerPosition playerPosition = arguments.get(PLAYER_POSITION);
        final int number = arguments.get(PLAYER_NUMBER, 0);
        player.add(PlayerMatchContextComponent.newInstance(team, playerPosition, number, initialPosition));


        player.add(PositionComponent.newInstance());

        String playerName = arguments.get(PLAYER_NAME);
        player.add(PlayerInfoComponent.newInstance(playerName));

        return player;
    }
}


public class BallFactory extends CreateAndAddToEngineEntityFactory {
    private TextureAtlas atlas;
    private RubeSceneHelper rubeSceneHelper;
    private Camera camera;
    private Rectangle SCENE_BOUNDS;

    private BallFactory(TextureAtlas atlas, RubeSceneHelper rubeSceneHelper, Camera camera, Rectangle SCENE_BOUNDS) {
        this.atlas = atlas;
        this.rubeSceneHelper = rubeSceneHelper;
        this.camera = camera;
        this.SCENE_BOUNDS = SCENE_BOUNDS;
    }

    public static BallFactory create(TextureAtlas atlas, RubeSceneHelper rubeSceneHelper, Camera camera, Rectangle SCENE_BOUNDS) {
        return new BallFactory(atlas, rubeSceneHelper, camera, SCENE_BOUNDS);
    }

    @Override
    public Entity create(CreateArguments arguments) {
        final Entity ballEntity = new Entity();
        final Sprite ballSprite = new Sprite(atlas.findRegion("ball"));
        final Body ballBody = rubeSceneHelper.getBody("ball");
        ballBody.setTransform(0, 0, 0);
        final Fixture ball = rubeSceneHelper.getFixture(ballBody, "ball");
        ball.setUserData(new FixtureUserData(FixtureType.BALL, ballEntity));
        ballEntity.add(SpriteComponent.newInstance(ballSprite));
        ballEntity.add(BodyComponent.newInstance(ballBody));
        ballEntity.add(BallContextComponent.newInstance());
        final PositionComponent positionComponent = PositionComponent.newInstance();
        ballEntity.add(positionComponent);
        ballEntity.add(CameraFollowerComponent.newInstance(camera));
        ballSprite.setScale(0.78f / ballSprite.getHeight());
        return ballEntity;
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
                  child: Text(""" من همچنین این روش را انجام می دهم زیرا باید سریع بدانم كه چه م componentsلفه هایی بخشی از موجودیت هستند. زیرا بعداً در سیستم ها موجودیت ها را بازیابی می کنم و انجام مواردی مانند:
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

                  child:Text("""//get entities that have all those components.
    final Entity ballEntity = engine.getEntitiesFor(Family
            .all(BallContextComponent.class, SpriteComponent.class, BodyComponent.class, PositionComponent.class, CameraFollowerComponent.class)
            .get()).first();
                  """,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: ArabicFonts.Mada,package: 'google_fonts_arabic'),),
                ),
              ),
            ),

            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  padding: EdgeInsets.all(15),

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("""فهمیدن اینکه وقتی همه موجودات را در یک مکان ایجاد کردم مشکل بود. بنابراین تصمیم گرفتم کارخانه هایی برای هر نهاد ایجاد کنم.

اما خیلی دوست ندارم. بنابراین من به ایجاد نوعی ارث برای هر نهاد فکر کردم. در نهایت تصمیم گرفتم یک کلاس مانند این ایجاد کنم:
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

                  child:Text("""public abstract class UserEntity {

    private final Entity entity;
    private boolean wasBuilt = false;
    private Array<Class<? extends Component>> componentClasses;

    protected UserEntity() {
        this.entity = new Entity();
    }

    public final Entity getEntity() {
        if (!wasBuilt) {
            final Array<Component> components = getComponents();
            componentClasses = new Array<Class<? extends Component>>();
            for (Component c : components) {
                entity.add(c);
                componentClasses.add(c.getClass());
            }
            init(entity);
        }
        return entity;
    }

    protected abstract Array<Component> getComponents();

    public Class<? extends Component>[] getComponentClasses() {
        if (!wasBuilt) {
            throw new IllegalArgumentException("It needs to build entity before use it.");
        }
        return componentClasses.toArray();
    }

    /* Override when need to init some components */
    public void init(Entity entity) {

    }
}

public class BallEntity extends UserEntity {
    private final RubeSceneHelper rubeSceneHelper;
    private ScaledSprite ballSprite;
    private Body ballBody;
    private Camera camera;

    public BallEntity(ScaledSprite ballSprite, Body ballBody, Camera camera, RubeSceneHelper rubeSceneHelper) {
        this.ballSprite = ballSprite;
        this.ballBody = ballBody;
        this.camera = camera;
        this.rubeSceneHelper = rubeSceneHelper;
    }

    @Override
    public Array<Component> getComponents() {
        Array<Component> components = new Array<Component>();
        components.add(PositionComponent.newInstance());
        components.add(CameraFollowerComponent.newInstance(camera));
        components.add(SpriteComponent.newInstance(ballSprite.getSprite()));
        components.add(BodyComponent.newInstance(ballBody));
        components.add(BallContextComponent.newInstance());
        return components;
    }

    @Override
    public void init(Entity entity) {
        BodyComponent bodyComponent = entity.getComponent(BodyComponent.class);
        bodyComponent.setPosition(Vector2.Zero);

        Fixture ballFixture = rubeSceneHelper.getFixture(bodyComponent.getBody(), "ball");
        ballFixture.setUserData(new FixtureUserData(FixtureType.BALL, entity));
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
                  child: Text("""اما مطمئن نیستم که آیا این کار را به این روش انجام می دهم یا نه. همانطور که مشاهده می شود ، من مجبورم داده های زیادی را به عنوان سازنده برای موجودیت ها منتقل کنم. کلاس GamePlayScreen من دوباره بزرگ می شود. آیا می توانید کد من یا پیشنهادی برای تغییر یا روش بهتری برای سازماندهی همه اینها را ارزیابی کنید؟
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
