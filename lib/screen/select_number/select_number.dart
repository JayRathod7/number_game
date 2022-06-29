import 'dart:async';

import 'package:flutter/material.dart';
import 'package:number_game/constant/app_string.dart';
import 'package:number_game/screen/choose_number/number_select_screen.dart';
import 'package:number_game/screen/select_number/model/numberList.dart';
import 'package:number_game/widgets/player_button.dart';

class SelectNumber extends StatefulWidget {
  final int player1;
  final int player2;

  SelectNumber({required this.player1, required this.player2});

  @override
  State<SelectNumber> createState() => _SelectNumberState();
}

class _SelectNumberState extends State<SelectNumber> {
  bool isPlayer1Enabled = false;
  late List<ListItem<String>> list;

  @override
  void initState() {
    super.initState();
    isPlayer1Enabled = true;
    populateData();
  }

  void populateData() {
    list = [];
    for (int i = 0; i < 10; i++) list.add(ListItem<String>("${i + 1}"));
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
              _buildGridView(context),
              SizedBox(height: 30),
              playerLabel()
            ],
          )),
    );
  }

  Widget _buildGridView(BuildContext context) => GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: gridViewContainer,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      );

  Widget gridViewContainer(BuildContext context, index) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: list[index].isSelected ? Colors.grey :Colors.red ),
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
                    list[index].data,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
              ))));

  Widget playerLabel() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          playerButton(
              borderColor:
                  isPlayer1Enabled ? Colors.greenAccent : Colors.deepPurple,
              containerColor:
                  isPlayer1Enabled ? Colors.greenAccent : Colors.deepPurple,
              text: isPlayer1Enabled
                  ? AppString.label.player1
                  : AppString.label.player2),
        ],
      );

  void clickOnNumber(index) {

    if (isPlayer1Enabled) {
      if (index + 1 == widget.player2) {
        showDialogBox(text: AppString.label.player1);
        Timer(
            const Duration(seconds: 2),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChooseNumber())));
      }
    } else if (!isPlayer1Enabled) {
      if (index + 1 == widget.player1) {
        showDialogBox(text: AppString.label.player2);
        Timer(
            Duration(seconds: 2),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChooseNumber())));
      }
    }
    isPlayer1Enabled = !isPlayer1Enabled;
    list[index].isSelected = true;
    setState(() {});
  }

  Future showDialogBox({required String text}) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            height: 150,
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
