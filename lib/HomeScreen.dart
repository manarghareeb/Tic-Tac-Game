import 'package:flutter/material.dart';

import 'models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String turn = 'X';
  late String result = '';
  int count = 0;
  bool gameOver = false;
  Game game =Game();
  List<bool> isClicked = [false,false,false,
    false,false,false,
    false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('IT\'S $turn TURN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60),),
                SizedBox(height: 20,),
                Expanded(
                  child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      children: List.generate(9, (index) => GestureDetector(
                        onTap: gameOver ? null : () => _onTap(index),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey[400]),
                          alignment: Alignment.center,
                          child: Text(
                            Player.playerX.contains(index)?'X':Player.playerO.contains(index)?'O':'',
                            style: TextStyle(
                                fontSize: 70,fontWeight: FontWeight.bold,
                                color: Player.playerX.contains(index)?Colors.blue:Colors.pink[300]
                            ),
                          ),
                        ),
                      ),
                      )
                  ),
                ),
                Text('$result',style: TextStyle(fontSize: 40),),
                SizedBox(height: 30,),
                ElevatedButton.icon(
                  icon: Icon(Icons.replay,size: 30,),
                  label: Text('Repeat The Game',style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(fixedSize: Size.fromWidth(250)),
                  onPressed: (){
                    setState(() {
                      // restart
                      Player.playerX=[];
                      Player.playerO=[];
                      turn = 'X';
                      result = '';
                      count = 0;
                      gameOver = false;
                      isClicked = [false,false,false,
                        false,false,false,
                        false,false,false];
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTap (int index){
    if(!isClicked[index]  ){
      game.play(index, turn);
      setState(() {
        turn = (turn=='X') ? 'O' : 'X';
      });
      isClicked[index] = true ;
    }
    if(Player.playerX.contains(0)&&Player.playerX.contains(1)&&Player.playerX.contains(2)
        ||Player.playerX.contains(3)&&Player.playerX.contains(4)&&Player.playerX.contains(5)
        || Player.playerX.contains(6)&&Player.playerX.contains(7)&&Player.playerX.contains(8)
        ||Player.playerX.contains(0)&&Player.playerX.contains(3)&&Player.playerX.contains(6)
        ||Player.playerX.contains(1)&&Player.playerX.contains(4)&&Player.playerX.contains(7)
        || Player.playerX.contains(2)&&Player.playerX.contains(5)&&Player.playerX.contains(8)
        ||Player.playerX.contains(0)&&Player.playerX.contains(4)&&Player.playerX.contains(8)
        || Player.playerX.contains(2)&&Player.playerX.contains(4)&&Player.playerX.contains(6)
    )
    {
      result='X is The Winner';
    }
    else if(
    Player.playerO.contains(0)&&Player.playerO.contains(1)&&Player.playerO.contains(2)
        ||Player.playerO.contains(3)&&Player.playerO.contains(4)&&Player.playerO.contains(5)
        || Player.playerO.contains(6)&&Player.playerO.contains(7)&&Player.playerO.contains(8)
        ||Player.playerO.contains(0)&&Player.playerO.contains(3)&&Player.playerO.contains(6)
        ||Player.playerO.contains(1)&&Player.playerO.contains(4)&&Player.playerO.contains(7)
        || Player.playerO.contains(2)&&Player.playerO.contains(5)&&Player.playerO.contains(8)
        ||Player.playerO.contains(0)&&Player.playerO.contains(4)&&Player.playerO.contains(8)
        || Player.playerO.contains(2)&&Player.playerO.contains(4)&&Player.playerO.contains(6)
    )
    {
      result='O is The Winner';
    }
  }

}

