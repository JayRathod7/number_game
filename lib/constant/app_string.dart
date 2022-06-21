class AppString {
  static String gameButton = "Enter";
  static _Validation validation = _Validation();
  static _Label label =_Label();

}
class _Label{
  final String player1 = "Player 1";
  final String player2 = "Player 2";
  final String gameLabel = "Please enter your number";
  final String winner = "won";
}

class _Validation {
  final String player1Empty = "player 1 enter your number";
  final String player2Empty = "player 2 enter your number";
  final String chooseDifferentNumber = "please select different number";
  final String player1EnterNumber= "player 1 please enter number out of 10 ";
  final String player2EnterNumber= "player 2 please enter number out of 10 ";
}