import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';



  var topLeftAlignment = Alignment.topLeft;
  var bottomRightAlignment = Alignment.bottomRight;

class GradientBuilder extends StatelessWidget{



    const GradientBuilder(this.color1, this.color2, {super.key});

      const GradientBuilder.pallete({super.key}):
    color1 = Colors.pinkAccent, color2 = Colors.orange;

     final Color color1;
     final Color color2;


  @override
  Widget build(context) {
    return Container (

      decoration:   BoxDecoration(
          gradient : LinearGradient(
            colors: [color1, color2],
            begin : topLeftAlignment,
            end : bottomRightAlignment,
          )

            
          ),
      child: const Center(
        child: DiceRoller() ,
      ),
        
        );
         

  }
}