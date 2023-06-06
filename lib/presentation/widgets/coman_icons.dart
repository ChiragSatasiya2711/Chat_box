import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommanIcons extends StatelessWidget {
  final Function onClickOne;
  final Function onClickTwo;
  final Function onClickThree;
  final Function onClickFour;
  final ColorOne;
  final ColorTwo;
  final ColorThree;
  final ColorFour;
  const CommanIcons({Key? key, required this.onClickOne, required this.onClickTwo, required this.onClickThree, required this.onClickFour, this.ColorOne, this.ColorTwo, this.ColorThree, this.ColorFour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onClickOne();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message_outlined, color: ColorOne),
                Text(
                  "Message",
                  style: TextStyle(color: ColorOne, height: 1.5),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onClickTwo();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/call_logo.png", color: ColorTwo),
                Text("Calls", style: TextStyle(color: ColorTwo, height: 1.5)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onClickThree();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_pin, color: ColorThree),
                Text("Contacts", style: TextStyle(color: ColorThree, height: 1.5)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onClickFour();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, color: ColorFour),
                Text("Settings", style: TextStyle(color: ColorFour, height: 1.5)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
