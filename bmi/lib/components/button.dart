import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;

  BottomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Container(
        child: Center(child: Text(title,style: calculateFont,)),
        width: double.infinity,
        height: bottomHeight,
        color: bottomColor,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}