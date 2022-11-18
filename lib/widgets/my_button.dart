import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  MyButton({
    this.isResponsive = false,
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.indigo[400],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('img/button-one.png'),
          ),
        ],
      ),
    );
  }
}
