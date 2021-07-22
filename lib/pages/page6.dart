import 'package:flutter/material.dart';

class page6 extends StatefulWidget {
  const page6({Key key}) : super(key: key);



  @override
  _page6State createState() => _page6State();
}

class ratings{

  final double rating6;
  ratings(this.rating6);

}

class _page6State extends State<page6> {

  double rating6=0;

  double nowrating = 0;

  @override
  Widget build(BuildContext context) {

    nowrating = ModalRoute.of(context).settings.arguments;


    void reverseratings () {

      ratings instance = ratings(rating6 = nowrating);
      Navigator.pushReplacementNamed(context, '/5',arguments:
      instance.rating6
      );
    }

    void changeratings () {

      ratings instance = ratings(rating6 = (rating6*4+1)+(nowrating));

      Navigator.pushReplacementNamed(context, '/7',arguments:
      instance.rating6
      );

    }

    return Scaffold(appBar: AppBar(
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('How likely are you to comeback here?',

                    style: TextStyle(
                      fontFamily: 'Play',
                      fontSize: 20.0,
                      letterSpacing: 1.5,
                      color: Colors.yellow[200],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 50.0),
                  Slider(value: rating6, onChanged: (newrating){
                    setState(() { rating6 = newrating;

                    });
                  },
                      activeColor: Colors.yellow[400],
                      inactiveColor: Colors.blueAccent[700],
                      divisions: 4,
                      label: '${rating6*4+1}'),
                  SizedBox(width: 30.0),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '${rating6*4+1}',
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
