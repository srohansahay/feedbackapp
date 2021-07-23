
import 'package:flutter/material.dart';
import 'package:feedback_app/services/ratingsclass.dart';

class page1 extends StatefulWidget {
  const page1({Key key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}


class _page1State extends State<page1> {


  double rating1 = 0;
  double rating11 = 0;

  void changeratings () {



   Ratings instance = Ratings( ratings1: rating1*4+1, ratings2: 0, ratings3: 0, ratings4: 0,ratings5: 0,ratings6: 0 );
   Navigator.pushReplacementNamed(context, '/2',arguments:
     {'ratings1': instance.ratings1,'ratings2':instance.ratings2,
       'ratings3':instance.ratings3,'ratings4':instance.ratings4,
      'ratings5' :instance.ratings5,'ratings6':instance.ratings6}
   );


  }

  Map nowrating = {};


  @override
  Widget build(BuildContext context) {

    nowrating = ModalRoute.of(context).settings.arguments;
    print(nowrating);



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
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Center(
                child: Text('How was our service?',
                  style: TextStyle(
                    fontFamily: 'Play',
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    color: Colors.yellow[200],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 50.0),
                  Slider(value: rating1, onChanged: (newrating){
                    setState(() {
                      rating1 = newrating;
                      rating11 = rating1;
                      if(newrating == null){
                        rating1 == 0.0;
                      }

                     }
                    );
                  },
                      activeColor: Colors.yellow[400],
                      inactiveColor: Colors.blueAccent[700],
                      divisions: 4,
                      label: '${rating1*4+1}'),
                  SizedBox(width: 30.0),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '${rating1*4+1}',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent[400],
                        fontFamily: 'Play',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 70.0),
              ElevatedButton.icon(onPressed: () {
                changeratings();
                } ,
                icon: Icon(Icons.arrow_right_alt, color: Colors.blueAccent[400] ),
                label: Text('Next', style: TextStyle(color: Colors.blueAccent[400]),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow[200]),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
