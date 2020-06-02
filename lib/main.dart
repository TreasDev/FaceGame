import 'package:flutter/material.dart';
import 'dart:math' show Random;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Game',
      home: HomePage(title: 'Face Game'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Game',
            style: TextStyle(
              color: Color(0xff5cc2f2),
            )),
        backgroundColor: Color(0xff191BA9),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
//            Text('Select mode: '),
//            RaisedButton(
//                child: Text('Single Player'),
//                onPressed: null,
//                ),
//                    //() {Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePlayer()));}),
            RaisedButton(
              child: Text('Start'),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => TwoPlayer()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Single player
class SinglePlayer extends StatefulWidget {
  SinglePlayer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SinglePlayerState createState() => _SinglePlayerState();
}
class _SinglePlayerState extends State<SinglePlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
            Expanded(
              child: Image(image: AssetImage('assets/imgs/annoyed.png'),),
              flex: 5,
            ),
            Container(
              width: 150,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                      value: '-',
                      items: [],
                      onChanged: null,
                    ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){},
              child: Text('asdf'),
            ),
            Text('Score = ')
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
            color: Color(0xff191BA9),
            child: Text('Alex Healey, TreasDev, V1.1, 2020', textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff5cc2f2),
                )
            )
        )
    );
  }
}
class TwoPlayer extends StatefulWidget {
  TwoPlayer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TwoPlayerState createState() => _TwoPlayerState();
}
class _TwoPlayerState extends State<TwoPlayer>{
  int x;
  int temp;
  int score = 0;
  int total = 0;
  String feel = 'asdf';
  var feelings = {0: 'Happy',
                  1: 'Sad',
                  2: 'Confused',
                  3: 'Angry',
                  4: 'Bored',
                  5: 'Scared',
                  6: 'Confident',
                  7: 'Flirty',
                  8: 'Excited',
                  9: 'Really Pissed',
                  10: 'Relieved',
                  11: 'Lonely',};
  @override
  void initState() {
    setState(() {
      Random random = new Random();
      x = random.nextInt(12);
      feel = feelings[x];
    });
  }
  void _getq(){
    setState(() {
      Random random = new Random();
      temp = x;
      while (x == temp) {
      x = random.nextInt(12);
      }
      feel = feelings[x];
      print(feel);
    });
  }
  void _showDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text('Final Score'),
          content: new Text(score.toString() + '/' + total.toString()),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                //pushNamedAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(), (_) => false));
              },
            )
          ],
        );
    }
    );
  }
//  showDialog(
//  context: context,
//  child: AlertDialog(
//  title: Text('Final Score'),
//  content: Text(score.toString() + '/' + total.toString()),
////                  actions: <Widget>[
////                    FlatButton(
////                      child: Text('Ok'),
////                      onPressed: () {
////                        Navigator.push(context,
////                            MaterialPageRoute(
////                                builder: (context) => HomePage()));
////                      },
////                    )
////                  ],
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Game',
            style: TextStyle(
              color: Color(0xff5cc2f2),
            )),
        backgroundColor: Color(0xff191BA9),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
//            Text('Make this facial expression: ',
//                textAlign: TextAlign.center,),
//            Expanded(
//                  child: Image(image: AssetImage('assets/imgs/annoyed.png'),),
//                  flex: 3,
//                ),
            Text('Make this Facial Expression: '),
            Text(feel),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.clear),
                  onPressed: (){
                    _getq();
                    ++total;
                  },
                  color: Colors.red,
                ),
                RaisedButton(
                  child: Icon(Icons.done),
                  onPressed: (){
                    _getq();
                    ++score;
                    ++total;
                  },
                  color: Colors.green,
                )
              ],
            ),
            Text('Score = ' + score.toString() + '/' + total.toString(),
            textAlign: TextAlign.center,),
            RaisedButton(
              child: Text('End Game'),
              onPressed: () {
                _showDialog();
              }
              ),
          ]
        ),
        bottomNavigationBar: BottomAppBar(
            color: Color(0xff191BA9),
            child: Text('Alex Healey, TreasDev, V1.1, 2020', textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff5cc2f2),
                )
            )
        )
    );
  }
}