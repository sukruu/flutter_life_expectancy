import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  Widget? child;
  final Function()? onPress;

  MyContainer(
      {this.renk = Colors.white, this.child, this.onPress}); // <--------- 1

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: renk),
        child: child, //<------------  2
      ),
    );
  }
}
