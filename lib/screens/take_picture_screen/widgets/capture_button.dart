import 'package:bear_grylls/theme/palette.dart';
import 'package:flutter/material.dart';

class CaptureButton extends StatelessWidget {
  CaptureButton({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.accent_transparent,
          border: Border.all(
            color: Colors.white,
            width: 7,
          ),
        ),
      ),
      splashColor: Colors.white,
    );
  }
}