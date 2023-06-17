import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

var randomizer = Random();

class _DiceRollerState extends State<DiceRoller> {
  var imageHolder = 'assets/images/dice-2.png';

  void rollDiceFunc() {
    setState(() {
      var randomNums = randomizer.nextInt(6) + 1;
      imageHolder = 'assets/images/dice-$randomNums.png';
      // print("working Good!"); Log check
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        imageHolder,
        width: 200,
      ),
      const SizedBox(height: 30),
      ElevatedButton(
        onPressed: rollDiceFunc,
        style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        child: const Text("Roll"),
      )
    ]);
  }
}
