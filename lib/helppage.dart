import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Help',style: TextStyle(fontFamily: 'Carlito', fontWeight: FontWeight.w900)),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
            child: Column(
              children: [
                Text('''The game is played on three stacked 3x3 grids, resulting in a total of 27 spaces.''', style: TextStyle(fontSize: 20, fontFamily: 'Carlito'),),
                SizedBox(height: 20,),
                Text('The goal is to get three of your symbols in a row, either horizontally, vertically, or diagonally, on any of the three levels or on a straight line connecting the levels.', style: TextStyle(fontSize: 20, fontFamily: 'Carlito'),),
                Image.asset('images/helpshow.png'),
                Text('Players take turns placing their symbol (traditionally "X" or "O") on any empty space on any level of the board.', style: TextStyle(fontSize: 20, fontFamily: 'Carlito'),),
                SizedBox(height: 20,),
                Text('Once a symbol is placed in a space, it cannot be moved or replaced for the duration of the game.', style: TextStyle(fontSize: 20, fontFamily: 'Carlito'),),
                SizedBox(height: 20,),
                Text('Players can win on any level of the board or on a straight line connecting the levels, making the game more complex and requiring more strategic planning than regular tic-tac-toe.', style: TextStyle(fontSize: 20, fontFamily: 'Carlito'),),
                SizedBox(height: 20,),
                Image.asset('images/boardlayout.png'),
                SizedBox(height: 20,),
                Text('The game is over when one player gets three in a row, or all 27 spaces are filled without either player winning.', style: TextStyle(fontSize: 20, fontFamily: 'Carlito'),),
                SizedBox(height: 40,),

              ],
            ),
          ),
        )
      ),
    );
  }
}
