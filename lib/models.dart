class Player
{
  static List playerX = [];
  static List playerO = [];
}

class Game
{
  void play(int index,String turn)
  {
    if(turn=='X')
      Player.playerX.add(index);
    else if(turn =='O')
      Player.playerO.add(index);
  }

}