import 'package:flutter/material.dart';
import 'package:feedback_app/services/ratingsclass.dart';

class page2 extends StatefulWidget {
  const page2({Key key}) : super(key: key);

  @override
  _page2State createState() => _page2State();
}



class _page2State extends State<page2> {



  double rating2=0;
  double rating21 =0;

  Map nowrating = {};



  @override
  Widget build(BuildContext context)  {

    nowrating =  ModalRoute.of(context).settings.arguments ;


    print(nowrating);

     void reverseratings () {

      Ratings instance = Ratings(ratings1: 0,ratings2: 0,ratings3: 0, ratings4: 0,ratings5: 0,ratings6: 0 );
      Navigator.pushReplacementNamed(context, '/1',arguments:{'ratings1': instance.ratings1
          ,'ratings2':instance.ratings2,'ratings3':instance.ratings3,'ratings4':instance.ratings4,
          'ratings5' :instance.ratings5,'ratings6':instance.ratings6}


      );
      print(instance.ratings2);
    }

    void changeratings () {

      Ratings instance = Ratings(ratings1: nowrating['ratings1'],ratings2: rating2*4+1,ratings3: 0, ratings4: 0,ratings5: 0,ratings6: 0 );

      Navigator.pushReplacementNamed(context, '/3',arguments:{'ratings1': instance.ratings1
         ,'ratings2':instance.ratings2,'ratings3':instance.ratings3,'ratings4':instance.ratings4,
        'ratings5' :instance.ratings5,'ratings6':instance.ratings6}

      );
      print(instance.ratings2);

    }



    return  Scaffold(appBar: AppBar(
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
                child: Text('How was the sanitation?',
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
                  Slider(  value: rating2, onChanged: (newrating)  {
                    setState(()  { rating2 =  newrating;
                                    rating21 =  rating2;

                    });
                  },
                      activeColor: Colors.yellow[400],
                      inactiveColor: Colors.blueAccent[700],
                      divisions: 4,
                      label:  (rating2*4+1).round().toString()),
                  SizedBox(width: 30.0),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '${rating2*4+1}',
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
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton.icon(onPressed: () {
                    reverseratings();
                  }, icon: Icon(Icons.arrow_left, color: Colors.blueAccent[400] ), label: Text('Back', style: TextStyle(color: Colors.blueAccent[400]),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow[200]),
                    ),
                  ),
                  SizedBox(width: 75.0),
                  ElevatedButton.icon(onPressed: () {
                    changeratings();
                  }, icon: Icon(Icons.arrow_right, color: Colors.blueAccent[400] ), label: Text('Next', style: TextStyle(color: Colors.blueAccent[400]),),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow[200]),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
