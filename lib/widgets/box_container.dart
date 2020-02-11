import 'package:bear_grylls/theme/palette.dart';
import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  BoxContainer({
    @required this.child,
    @required this.width,
    @required this.height,
  });
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Palette.background_transparent,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}