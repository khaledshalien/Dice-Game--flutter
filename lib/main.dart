import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
            title: Text('Dice Game',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30
          ),
        )),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
 int leftdice  = 1;
 int rightdice = 1;

 var res = "";

 void changdice()
 {
   leftdice = Random().nextInt(6) + 1;
   rightdice = Random().nextInt(6)+ 1;
   if(leftdice == rightdice)
     res = "YES";
   else
     res = "NO";
 }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(

              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: (){
                      setState(() {
                        changdice();
                      });
                    },
                    child: Image(image: AssetImage('images/Dice-$leftdice-b.svg.png'),),
                  ),
                ),
                Expanded(
                  child:
                  FlatButton(child:
                  Image(image: AssetImage('images/Dice-$rightdice-b.svg.png'),),
                  onPressed: (){
                    setState(() {
                      changdice();
                    });
                  },),
                )
              ],
            ),
          ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('The Result is $res',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
