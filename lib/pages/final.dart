import 'package:flutter/material.dart';

class finalpage extends StatefulWidget {
  const finalpage({Key key}) : super(key: key);

  @override
  _finalpageState createState() => _finalpageState();
}



class _finalpageState extends State<finalpage> {

  double nowrating = 0;





  @override
  Widget build(BuildContext context) {


    nowrating = ModalRoute.of(context).settings.arguments;


    bool High = nowrating >= 21.0 && nowrating <= 30.0 ? true : false ;
    print(High);
    bool Medium = nowrating >= 11.0 && nowrating <= 20.0 ? true : false;
    print(Medium);


    Color fontcolor1 = Medium ? Colors.amber : Colors.red;
    Color fontcolor = High ? Colors.green : fontcolor1;

    String feedback1 = Medium ? 'Hope we serve you better next time' : 'We are sorry for your inconvenience';
    String feedback = High? 'We hope you come back next time' : feedback1;

    void back () {



      Navigator.pushReplacementNamed(context, '/1'
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
                        '${nowrating}/30.0',
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
