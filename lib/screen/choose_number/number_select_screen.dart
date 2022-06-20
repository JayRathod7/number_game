import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_game/screen/select_number/select_number.dart';
import 'package:number_game/widgets/toast.dart';

class ChooseNumber extends StatefulWidget {
  const ChooseNumber({Key? key}) : super(key: key);

  @override
  State<ChooseNumber> createState() => _ChooseNumberState();
}

class _ChooseNumberState extends State<ChooseNumber> {
  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("please enter your mumber"),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.yellow.withOpacity(0.1),
                        ),
                        child: TextField(
                          controller: player1,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "player 1",
                              contentPadding: const EdgeInsets.all(20.0)),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.yellow.withOpacity(0.1),
                        ),
                        child: TextField(
                          controller: player2,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "player 2",
                              contentPadding: const EdgeInsets.all(20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      validation();
                    },
                    child: Center(
                      child: Text("Enter"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validation() {
    if (player1.text.isEmpty) {
      showToast("player 1  enter your number");
      return;
    } else if (player2.text.isEmpty) {
      showToast("player 2 enter your number");
      return;
    } else if (player1.text == player2.text) {
      showToast("please select different number");
      player2.clear();
      player1.clear();
      setState(() {});
    } else if (int.parse(player1.text) > 10 || int.parse(player1.text) == 0) {
      showToast("player 1 please enter number out of 10 ");
      player1.clear();
      return;
    } else if (int.parse(player2.text) > 10 || int.parse(player2.text) == 0) {
      showToast("player 2 please enter number out of 10 ");
      player2.clear();
      return;
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectNumber(
                  player1: int.parse(player1.text),
                  player2: int.parse(player2.text))));
    }
  }
}
