import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animation/delay.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;
  final int delayedAmount = 100;
  double _scale;
  bool isUploading = false;

  bool showProgress = true;
  void toggleSubmitState() {
    setState(() {
      showProgress = !showProgress;
    });
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        DelayedAnimation(
          child: TextLiquidFill(
            text:
                'LIQUIDY Id like to know how to center the contents a Text widget vertically and horizontally in Flutter. I only know how to center the widget itself using Center(child: Text("test")) but not the content itself, its by default left aligned.',
            waveColor: Colors.black,
            boxBackgroundColor: Colors.red,
            textStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 150.0,
          ),
          /*Text(
            'This is masrafi anam',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),*/
          delay: delayedAmount + 1000,
        ),
        DelayedAnimation(
          child: Text(
            'You are most welcome from me Hello ',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          delay: delayedAmount + 4000,
        ),
        DelayedAnimation(
          child: Text(
            'You are most welcome from me',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          delay: delayedAmount + 5000,
        ),
        Center(
          child: Container(
            child: Column(
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: Text('This Is Masrafi Anam'),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Text('This Is Masrafi Anam'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
              selected = true;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: selected ? 200.0 : 40.0,
              height: selected ? 100.0 : 70.0,
              color: selected ? Colors.red : Colors.blue,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: ListView(
                children: [
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                  Text('Masrafi'),
                ],
              ),
            ),
          ),
        ),
        /*TextLiquidFill(
          text: 'LIQUIDY',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.redAccent,
          textStyle: TextStyle(
            fontSize: 80.0,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300.0,
        ),*/
        /*SizedBox(
          width: 250.0,
          child: TyperAnimatedTextKit(
              onTap: () {
                print("Tap Event");
              },
              text: [
                "It is not enough to do your best,",
                "you must know what to do,",
                "and then do your best",
                "- W.Edwards Deming",
              ],
              textStyle: TextStyle(fontSize: 30.0, fontFamily: "Bobbers"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
        ),*/
        SizedBox(
          width: 250.0,
          child: TypewriterAnimatedTextKit(
              text: [
                "Do not test bugs out, design them out",
              ],
              textStyle: TextStyle(fontSize: 30.0, fontFamily: "Agne"),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
        ),
        SizedBox(
          width: 250.0,
          child: FadeAnimatedTextKit(
              onTap: () {
                print("Tap Event");
              },
              text: ["do it RIGHT NOW!!!"],
              textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
        ),
        AvatarGlow(
          glowColor: Colors.blue,
          endRadius: 140.0,
          duration: Duration(milliseconds: 4000),
          repeat: true,
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          child: Material(
            elevation: 8.0,
            shape: CircleBorder(),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/sgf.jpg',
                      ),
                      alignment: Alignment.center,
                      fit: BoxFit.cover)),
              //child: image,
            ),
          ),
        ),
        CircularProgressIndicator()
      ],
    );
  }
}
