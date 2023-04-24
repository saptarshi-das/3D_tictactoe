import 'package:flutter/material.dart';
import 'dart:math';


// the real game page
class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  //algorithm for checking wins
  var crossNoughtToggle= 'images/empty.png';
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
    if (u3== m2 && m2== u3 && (l1=='images/cross.png' ||l1=='images/nought.png') ) {
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
    if (u6== m5 && m5== u4 && (l4=='images/cross.png' ||l4=='images/nought.png') ) {
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
    if (u9== m8 && m8== u7 && (l7=='images/cross.png' ||l7=='images/nought.png') ) {
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
    else{
      return false;
    }

  }

  bool winCheck(){
    if (horLWin() || horMWin() || horUWin() || verBwin() || verMwin() || verFwin() || diagonalWin()){
      return true;
    }
    else {
      return false;
    }
  }

  bool moveValidity(){
    if(){

    }
  }

  void cellUpdate(cellNumber){

  }

  void firstMoveAssignment(){
    if (Random().nextInt(2)==1){
      //player goes first so he is cross
    }
    else{
      //AI goes first with cross
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('3D Tic-Tac-Toe'),
        backgroundColor: Colors.red,
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

                      },
                      child: Image.asset(u1),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: TextButton(
                      onPressed: (){
                        print("u2 got pressed");

                      },
                      child: Image.asset(u1),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
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
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[200],
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[300],
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[400],
                      child: const Text('Who scream'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[500],
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[600],
                      child: const Text('Revolution, they...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
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
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[200],
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[300],
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[400],
                      child: const Text('Who scream'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[500],
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[600],
                      child: const Text('Revolution, they...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
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
}// TODO Implement this library.