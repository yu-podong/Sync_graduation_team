import 'package:flutter/material.dart';

class EleButton extends StatelessWidget {
  EleButton(
      {this.text,
      this.color,
      this.radius,
      this.height,
      this.width,
      this.onPressed});

  final Widget? text;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ButtonTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius!))),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                text!,
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
            onPressed: onPressed,
          )),
    );
  }
}
