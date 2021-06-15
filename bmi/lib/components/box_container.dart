import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {

  BoxContainer({required this.colour, required this.childCard});
  
  final Color colour;
  final Widget childCard;
  

  @override
  Widget build(BuildContext context) {
    return Container(
          child: childCard,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)
          ),
      );
  }
}

