import 'dart:async';

import 'package:flutter/material.dart';
import 'package:number_game/constant/app_string.dart';
import 'package:number_game/screen/choose_number/number_select_screen.dart';
import 'package:number_game/widgets/toast.dart';

class SelectNumber extends StatefulWidget {
  final int player1;
  final int player2;

  SelectNumber({required this.player1, required this.player2});

  @override
  State<SelectNumber> createState() => _SelectNumberState();
}

class _SelectNumberState extends State<SelectNumber> {
  bool isClick = false;
  int boxNumberIndex = 0;
  bool isPlayer1Enabled = false;

  @override
  void initState() {
    super.initState();
    isPlayer1Enabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              _buildGridView(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  playerButton(
                      borderColor: Colors.green,
                      containerColor: isPlayer1Enabled
                          ? Colors.greenAccent
                          : Colors.deepPurple,
                      text: isPlayer1Enabled
                          ? AppString.label.player1
                          : AppString.label.player2),
                ],
              )
            ],
          )),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.red),
          child: Center(
              child: GestureDetector(
            onTap: () {
              clickOnNumber(index);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
            ),
          )),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
    );
  }

  Widget playerButton(
      {required String text,
      required Color containerColor,
      required Color borderColor}) {
    return Expanded(
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          // color: Colors.green.withOpacity(0.9),
          color: containerColor,
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
    );
  }

  void clickOnNumber(index) {
    if (isPlayer1Enabled) {
      if ((index + 1) == widget.player2) {
        showDialogBox(text: AppString.label.player1);

        Timer(
            Duration(seconds: 3),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChooseNumber())));
        return;
      }
    } else if (!isPlayer1Enabled) {
      if ((index + 1) == widget.player1) {
        showDialogBox(text: AppString.label.player2);
        Timer(
            Duration(seconds: 3),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChooseNumber())));
        return;
      }
    }
    isPlayer1Enabled = !isPlayer1Enabled;
    setState(() {});
  }

  Future showDialogBox({required String text}) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppString.label.winner,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
      });
}
