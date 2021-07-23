import 'package:flutter/material.dart';
import 'package:feedback_app/services/ratingsclass.dart';
import 'package:emojis/emojis.dart';

class finalpage extends StatefulWidget {
  const finalpage({Key key}) : super(key: key);

  @override
  _finalpageState createState() => _finalpageState();
}



class _finalpageState extends State<finalpage> {

  Map nowrating = {};
  double nowrating1 = 0.0;





  @override
  Widget build(BuildContext context) {


    nowrating = ModalRoute.of(context).settings.arguments;
    print(nowrating);
    nowrating1 = nowrating['ratings1'] + nowrating['ratings2']+nowrating['ratings3']+nowrating['ratings4']+nowrating['ratings5']+nowrating['ratings6'];
    print(nowrating1);


    bool High = nowrating1 >= 21.0 && nowrating1 <= 30.0 ? true : false ;
    print(High);
    bool Medium = nowrating1 >= 11.0 && nowrating1 <= 20.0 ? true : false;
    print(Medium);


    Color fontcolor1 = Medium ? Colors.amber : Colors.red;
    Color fontcolor = High ? Colors.green : fontcolor1;

    String feedback1 = Medium ? 'Hope we serve you better next time ${Emojis.sadButRelievedFace}' : 'We are sorry for your inconvenience ${Emojis.faceScreamingInFear}';
    String feedback = High? 'We hope you come back next time ${Emojis.smilingFace} ' : feedback1;

    void back () {



       Ratings instance = Ratings( ratings1: 0.0, ratings2: 0, ratings3: 0, ratings4: 0,ratings5: 0,ratings6: 0 );

      Navigator.pushReplacementNamed(context, '/1', arguments:
      {'ratings1': instance.ratings1,'ratings2':instance.ratings2,
        'ratings3':instance.ratings3,'ratings4':instance.ratings4,
        'ratings5' :instance.ratings5,'ratings6':instance.ratings6}
      );

    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Feedback',
          style: TextStyle(fontSize: 40.0,
            letterSpacing: 1.0,
            color: Colors.yellow[200],
            fontFamily: 'Play',

          ),
        ),
      ),
      body: Container(
        color: Colors.blueAccent[100],
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text('You gave us a rating:',
                    style: TextStyle(color: Colors.yellow[400],
                    fontFamily: 'Play',
                    fontSize: 20.0)),
                    SizedBox(width: 10.0),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '${nowrating1}/30.0',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.blueAccent[400],
                          fontFamily: 'Play',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Container( padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                  child: Text('$feedback',
                  style: TextStyle(
                    fontFamily: 'Play',
                      color: fontcolor,
                    fontSize: 20.0,
                  ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextButton(onPressed: () {
                  back();
                }, child: Text(
                  'Restart', style: TextStyle(color: Colors.yellow,
                fontSize: 15.0),
                ))
              ],
            ),
        ),
      ),
    );
  }
}
