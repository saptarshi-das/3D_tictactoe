import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'helppage.dart';
//import 'dart:math';
//import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

//final openAI = OpenAI.instance.build(token: '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',baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));

dynamic player1;
dynamic aI;
var alertText;

// the real game page
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);


  @override
  State<GamePage> createState() => _GamePageState();

}

class _GamePageState extends State<GamePage> {

  //algorithm for checking wins
  //DEFINING ALL VARIABLES AND FUNCTIONS
  int moveCounter= 1;
  String l1= 'images/empty.png';
  String l2= 'images/empty.png';
  String l3= 'images/empty.png';
  String l4= 'images/empty.png';
  String l5= 'images/empty.png';
  String l6= 'images/empty.png';
  String l7= 'images/empty.png';
  String l8= 'images/empty.png';
  String l9= 'images/empty.png';
  String m1= 'images/empty.png';
  String m2= 'images/empty.png';
  String m3= 'images/empty.png';
  String m4= 'images/empty.png';
  String m5= 'images/empty.png';
  String m6= 'images/empty.png';
  String m7= 'images/empty.png';
  String m8= 'images/empty.png';
  String m9= 'images/empty.png';
  String u1= 'images/empty.png';
  String u2= 'images/empty.png';
  String u3= 'images/empty.png';
  String u4= 'images/empty.png';
  String u5= 'images/empty.png';
  String u6= 'images/empty.png';
  String u7= 'images/empty.png';
  String u8= 'images/empty.png';
  String u9= 'images/empty.png';



  bool horUWin() {
    if (u1== u2 && u2== u3 && (u3=='images/cross.png' ||u3=='images/nought.png') ){
      return true;
    }
    if (u4== u5 && u5== u6 && (u6=='images/cross.png' ||u6=='images/nought.png') ){
      return true;
    }
    if (u7== u8 && u8== u9 && (u9=='images/cross.png' ||u9=='images/nought.png') ){
      return true;
    }
    if (u1== u4 && u4== u7 && (u7=='images/cross.png' ||u7=='images/nought.png') ){
      return true;
    }
    if (u2== u5 && u5== u8 && (u8=='images/cross.png' ||u8=='images/nought.png') ){
      return true;
    }
    if (u3== u6 && u6== u9 && (u9=='images/cross.png' ||u9=='images/nought.png') ){
      return true;
    }
    if (u1== u5 && u5== u9 && (u9=='images/cross.png' ||u9=='images/nought.png') ){
      return true;
    }
    if (u3== u5 && u5== u7 && (u7=='images/cross.png' ||u7=='images/nought.png') ){
      return true;
    }
    else{
      return false;
    }
  }

  bool horMWin() {
    if (m1== m2 && m2== m3 && (m3=='images/cross.png' ||m3=='images/nought.png') ){
      return true;
    }
    if (m4== m5 && m5== m6 && (m6=='images/cross.png' ||m6=='images/nought.png') ){
      return true;
    }
    if (m7== m8 && m8== m9 && (m9=='images/cross.png' ||m9=='images/nought.png') ){
      return true;
    }
    if (m1== m4 && m4== m7 && (m7=='images/cross.png' ||m7=='images/nought.png') ){
      return true;
    }
    if (m2== m5 && m5== m8 && (m8=='images/cross.png' ||m8=='images/nought.png') ){
      return true;
    }
    if (m3== m6 && m6== m9 && (m9=='images/cross.png' ||m9=='images/nought.png') ){
      return true;
    }
    if (m1== m5 && m5== m9 && (m9=='images/cross.png' ||m9=='images/nought.png') ){
      return true;
    }
    if (m3== m5 && m5== m7 && (m7=='images/cross.png' ||m7=='images/nought.png') ){
      return true;
    }
    else{
      return false;
    }
  }

  bool horLWin() {
    if (l1== l2 && l2== l3 && (l3=='images/cross.png' ||l3=='images/nought.png') ){
      return true;
    }
    if (l4== l5 && l5== l6 && (l6=='images/cross.png' ||l6=='images/nought.png') ){
      return true;
    }
    if (l7== l8 && l8== l9 && (l9=='images/cross.png' ||l9=='images/nought.png') ){
      return true;
    }
    if (l1== l4 && l4== l7 && (l7=='images/cross.png' ||l7=='images/nought.png') ){
      return true;
    }
    if (l2== l5 && l5== l8 && (l8=='images/cross.png' ||l8=='images/nought.png') ){
      return true;
    }
    if (l3== l6 && l6== l9 && (l9=='images/cross.png' ||l9=='images/nought.png') ){
      return true;
    }
    if (l1== l5 && l5== l9 && (l9=='images/cross.png' ||l9=='images/nought.png') ){
      return true;
    }
    if (l3== l5 && l5== l7 && (l7=='images/cross.png' ||l7=='images/nought.png') ){
      return true;
    }
    else{
      return false;
    }
  }

  bool verBwin() {
    if (u1== m1 && m1== l1 && (l1=='images/cross.png' ||l1=='images/nought.png') ) {
      return true;
    }
    if (u2== m2 && m2== l2 && (l2=='images/cross.png' ||l2=='images/nought.png') ) {
      return true;
    }
    if (u3== m3 && m3== l3 && (l3=='images/cross.png' ||l3=='images/nought.png') ) {
      return true;
    }
    if (u1== m2 && m2== l3 && (l3=='images/cross.png' ||l3=='images/nought.png') ) {
      return true;
    }
    if (u3== m2 && m2== l1 && (l1=='images/cross.png' ||l1=='images/nought.png') ) {
      return true;
    }
    else{
      return false;
    }

  }

  bool verMwin() {
    if (u4== m4 && m4== l4 && (l4=='images/cross.png' ||l4=='images/nought.png') ) {
      return true;
    }
    if (u5== m5 && m5== l5 && (l5=='images/cross.png' ||l5=='images/nought.png') ) {
      return true;
    }
    if (u6== m6 && m6== l6 && (l6=='images/cross.png' ||l6=='images/nought.png') ) {
      return true;
    }
    if (u4== m5 && m5== l6 && (l6=='images/cross.png' ||l6=='images/nought.png') ) {
      return true;
    }
    if (u6== m5 && m5== l4 && (l4=='images/cross.png' ||l4=='images/nought.png') ) {
      return true;
    }
    else{
      return false;
    }

  }

  bool verFwin() {
    if (u7== m7 && m7== l7 && (l7=='images/cross.png' ||l7=='images/nought.png') ) {
      return true;
    }
    if (u8== m8 && m8== l8 && (l8=='images/cross.png' ||l8=='images/nought.png') ) {
      return true;
    }
    if (u9== m9 && m9== l9 && (l9=='images/cross.png' ||l9=='images/nought.png') ) {
      return true;
    }
    if (u7== m8 && m8== l9 && (l9=='images/cross.png' ||l9=='images/nought.png') ) {
      return true;
    }
    if (u9== m8 && m8== l7 && (l7=='images/cross.png' ||l7=='images/nought.png') ) {
      return true;
    }
    else{
      return false;
    }

  }

  bool diagonalWin() {
    if (u1== m5 && m5== l9 && (l9=='images/cross.png' ||l9=='images/nought.png') ) {
      return true;
    }
    if (u3== m5 && m5== l7 && (l7=='images/cross.png' ||l7=='images/nought.png') ) {
      return true;
    }
    if (u9== m5 && m5== l1 && (l1=='images/cross.png' ||l1=='images/nought.png') ) {
      return true;
    }
    if (u7== m5 && m5== l3 && (l3=='images/cross.png' ||l3=='images/nought.png') ) {
      return true;
    }
    if (u2== m5 && m5== l8 && (l8=='images/cross.png' ||l8=='images/nought.png') ) {
      return true;
    }
    if (u6== m5 && m5== l4 && (l4=='images/cross.png' ||l4=='images/nought.png') ) {
      return true;
    }
    if (u8== m5 && m5== l2 && (l2=='images/cross.png' ||l2=='images/nought.png') ) {
      return true;
    }
    if (u4== m5 && m5== l6 && (l6=='images/cross.png' ||l6=='images/nought.png') ) {
      return true;
    }
    else{
      return false;
    }

  }

  void winCheck(){
    if (horLWin() || horMWin() || horUWin() || verBwin() || verMwin() || verFwin() || diagonalWin()){
      //return true;
      print ("WONNNNNNNNN");
      if (player1== "images/cross.png"){
        alertText = "Cross won this game!!";
      }
      else {
        alertText= "Nought won this game!!";
      }
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Game Won"),
          content: Text(alertText),
          actions: [
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Quit", style: TextStyle(color: Colors.black38),),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  l1= 'images/empty.png';
                  l2= 'images/empty.png';
                  l3= 'images/empty.png';
                  l4= 'images/empty.png';
                  l5= 'images/empty.png';
                  l6= 'images/empty.png';
                  l7= 'images/empty.png';
                  l8= 'images/empty.png';
                  l9= 'images/empty.png';
                  m1= 'images/empty.png';
                  m2= 'images/empty.png';
                  m3= 'images/empty.png';
                  m4= 'images/empty.png';
                  m5= 'images/empty.png';
                  m6= 'images/empty.png';
                  m7= 'images/empty.png';
                  m8= 'images/empty.png';
                  m9= 'images/empty.png';
                  u1= 'images/empty.png';
                  u2= 'images/empty.png';
                  u3= 'images/empty.png';
                  u4= 'images/empty.png';
                  u5= 'images/empty.png';
                  u6= 'images/empty.png';
                  u7= 'images/empty.png';
                  u8= 'images/empty.png';
                  u9= 'images/empty.png';
                });
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Play again", style: TextStyle(color: Colors.green),),
              ),
            ),
          ],
        ),
      );
    }
    //What happens in a draw
    else if (
    u1!='images/empty.png'&&
    u2!='images/empty.png'&&
    u3!='images/empty.png'&&
    u4!='images/empty.png'&&
    u5!='images/empty.png'&&
    u6!='images/empty.png'&&
    u7!='images/empty.png'&&
    u8!='images/empty.png'&&
    u9!='images/empty.png'&&
    m1!='images/empty.png'&&
    m2!='images/empty.png'&&
    m3!='images/empty.png'&&
    m4!='images/empty.png'&&
    m5!='images/empty.png'&&
    m6!='images/empty.png'&&
    m7!='images/empty.png'&&
    m8!='images/empty.png'&&
    m9!='images/empty.png'&&
    l1!='images/empty.png'&&
    l2!='images/empty.png'&&
    l3!='images/empty.png'&&
    l4!='images/empty.png'&&
    l5!='images/empty.png'&&
    l6!='images/empty.png'&&
    l7!='images/empty.png'&&
    l8!='images/empty.png'&&
    l9!='images/empty.png'
    ){
      alertText ='This game was a draw';
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Draw Game"),
          content: Text(alertText),
          actions: [
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Quit", style: TextStyle(color: Colors.black38),),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  l1= 'images/empty.png';
                  l2= 'images/empty.png';
                  l3= 'images/empty.png';
                  l4= 'images/empty.png';
                  l5= 'images/empty.png';
                  l6= 'images/empty.png';
                  l7= 'images/empty.png';
                  l8= 'images/empty.png';
                  l9= 'images/empty.png';
                  m1= 'images/empty.png';
                  m2= 'images/empty.png';
                  m3= 'images/empty.png';
                  m4= 'images/empty.png';
                  m5= 'images/empty.png';
                  m6= 'images/empty.png';
                  m7= 'images/empty.png';
                  m8= 'images/empty.png';
                  m9= 'images/empty.png';
                  u1= 'images/empty.png';
                  u2= 'images/empty.png';
                  u3= 'images/empty.png';
                  u4= 'images/empty.png';
                  u5= 'images/empty.png';
                  u6= 'images/empty.png';
                  u7= 'images/empty.png';
                  u8= 'images/empty.png';
                  u9= 'images/empty.png';
                });
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Play again", style: TextStyle(color: Colors.green),),
              ),
            ),
          ],
        ),
      );
    }
    else {
      print ("Game can continue");
    }
  }

  bool moveValidity(cellNumber){
    if(cellNumber == 'images/empty.png'){
      return true;
    }
    else {
      //moveCounter--;
      return false;
    }
  }

  //firstMoveAssignment(){
    //if (Random().nextInt(2)==1){
      // player1 is cross
      //player1= 'images/cross.png';
      //aI= 'images/nought.png';
    //}
    //else{
      //AI goes first with cross
      //player1= 'images/nought.png';
      //aI= 'images/cross.png';
    //}
  //}
  //void cellUpdate(String cellNumber, String players){
    //if (moveValidity(cellNumber)==true){
      //cellNumber= players;
      //setState(() {
        //cellNumber= players;
        //print(cellNumber);
      //});
    //}
    //else {
      //print("This cell has already been filled!!");
    //}
  //}

  void moveCount(){
    moveCounter++;
    if (moveCounter%2!=1){
      player1= 'images/cross.png';
    }
    else {
      player1= 'images/nought.png';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('T3D',style: TextStyle(fontFamily: 'Carlito', fontWeight: FontWeight.w900)),
        backgroundColor: Colors.red,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpPage()),
                  );
                },
                child: const Icon(
                    Icons.help
                ),
              )
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                childAspectRatio: 1,
                shrinkWrap: false,
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u1 got pressed");
                        if (moveValidity(u1)==true){
                          moveCount();
                          setState(() {
                            u1= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u1),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        if (moveValidity(u2)==true){
                          moveCount();
                          setState(() {
                            u2= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u2),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u3 got pressed");
                        if (moveValidity(u3)==true){
                          moveCount();
                          setState(() {
                            u3= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u3),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u4 got pressed");
                        if (moveValidity(u4)==true){
                          moveCount();
                          setState(() {
                            u4= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u4),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u5 got pressed");
                        if (moveValidity(u5)==true){
                          moveCount();
                          setState(() {
                            u5= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u5),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u6 got pressed");
                        if (moveValidity(u6)==true){
                          moveCount();
                          setState(() {
                            u6= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u6),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u7 got pressed");
                        if (moveValidity(u7)==true){
                          moveCount();
                          setState(() {
                            u7 = player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u7),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u8 got pressed");
                        if (moveValidity(u8)==true){
                          moveCount();
                          setState(() {
                            u8= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u8),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: TextButton(
                      onPressed: (){
                        print("u9 got pressed");
                        if (moveValidity(u9)==true){
                          moveCount();
                          setState(() {
                            u9= player1;
                          });
                        }
                        else {
                          print("This cell has already been filled!!");
                        }
                        winCheck();
                      },
                      child: Image.asset(u9),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
                child:
                GridView.count(
                  childAspectRatio: 1,
                  shrinkWrap: false,
                  primary: false,
                  padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m1 got pressed");
                          if (moveValidity(m1)==true){
                            moveCount();
                            setState(() {
                              m1= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m1),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m2 got pressed");
                          if (moveValidity(m2)==true){
                            moveCount();
                            setState(() {
                              m2= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m2),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m3 got pressed");
                          if (moveValidity(m3)==true){
                            moveCount();
                            setState(() {
                              m3= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m3),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m4 got pressed");
                          if (moveValidity(m4)==true){
                            moveCount();
                            setState(() {
                              m4= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m4),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m5 got pressed");
                          if (moveValidity(m5)==true){
                            moveCount();
                            setState(() {
                              m5= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m5),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m6 got pressed");
                          if (moveValidity(m6)==true){
                            moveCount();
                            setState(() {
                              m6= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m6),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m7 got pressed");
                          if (moveValidity(m7)==true){
                            moveCount();
                            setState(() {
                              m7= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m7),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m8 got pressed");
                          if (moveValidity(m8)==true){
                            moveCount();
                            setState(() {
                              m8= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m8),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("m9 got pressed");
                          if (moveValidity(m9)==true){
                            moveCount();
                            setState(() {
                              m9= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(m9),
                      ),
                    ),
                  ],
                )
            ),

            Expanded(
                child:
                GridView.count(
                  childAspectRatio: 1,
                  shrinkWrap: false,
                  primary: false,
                  padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 10),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l1 got pressed");
                          if (moveValidity(l1)==true){
                            moveCount();
                            setState(() {
                              l1= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l1),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l2 got pressed");
                          if (moveValidity(l2)==true){
                            moveCount();
                            setState(() {
                              l2= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l2),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l3 got pressed");
                          if (moveValidity(l3)==true){
                            moveCount();
                            setState(() {
                              l3= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l3),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l4 got pressed");
                          if (moveValidity(l4)==true){
                            moveCount();
                            setState(() {
                              l4= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l4),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l5 got pressed");
                          if (moveValidity(l5)==true){
                            moveCount();
                            setState(() {
                              l5= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l5),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l6 got pressed");
                          if (moveValidity(l6)==true){
                            moveCount();
                            setState(() {
                              l6= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l6),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l7 got pressed");
                          if (moveValidity(l7)==true){
                            moveCount();
                            setState(() {
                              l7= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l7),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l8 got pressed");
                          if (moveValidity(l8)==true){
                            moveCount();
                            setState(() {
                              l8= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l8),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: TextButton(
                        onPressed: (){
                          print("l9 got pressed");
                          if (moveValidity(l9)==true){
                            moveCount();
                            setState(() {
                              l9= player1;
                            });
                          }
                          else {
                            print("This cell has already been filled!!");
                          }
                          winCheck();

                        },
                        child: Image.asset(l9),
                      ),
                    ),
                  ],
                )
            ),



            //Expanded(
            // child:
            //),

            //Expanded(
            // child:
            // ),

          ],
        ),
      ),
    );
  }
}
