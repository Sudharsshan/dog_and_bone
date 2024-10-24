import 'package:dog_and_bone/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  DogAndBone createState()=> DogAndBone();
}

class DogAndBone extends State<MyApp>{
  void init(){
    super.initState();
  }

  double dogX = 0; // defaults at middle during start
  double dogY = 1; // dog always stays on the ground
  double movementSpeed = 0.25;
  int score = 0; // initial score of the game is 0

  void moveLeft(){
    if((dogX - movementSpeed) < -1){
      // do nothing
    }
    else {
      setState(() {
        dogX -= movementSpeed;
      });
    }
  }

  void moveRight(){
    if((dogX + movementSpeed) > 1){
      // do nothing
    } else {
      setState(() {
        dogX += movementSpeed;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            // play area
            Expanded(
                flex: 3,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // background
                    Container(
                      color: Colors.green[100],
                    ),

                    // dog character
                    Container(
                      alignment: Alignment(dogX, dogY),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.brown,
                      ),
                    )
                  ],
                )
            ),

            // controls area
            Expanded(
                child: Container(
                  color: Colors.grey[600],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // move left button
                      Custombutton(
                        function: (){
                          // move dog left
                          moveLeft();
                        },
                        icon:  const Icon(Icons.arrow_back),
                      ),
                      
                      // current score
                      Container(
                        color: Colors.white,
                        width: 50,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text("$score"),
                        ),
                      ),

                      // move right button
                      Custombutton(
                        function: (){
                          // move the dog right
                          moveRight();
                        },
                        icon: const Icon(Icons.arrow_forward),
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}