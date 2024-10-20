import 'dart:ui';

import 'package:flutter/material.dart';


class Glassmorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final double radius;
  final Widget child;

  const Glassmorphism({
    super.key,
    required this.blur,
    required this.opacity,
    required this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          //padding: EdgeInsets.all(8 * 3),  
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
            colors: [
           // Colors.black.withOpacity(opacity),
              Color(0xFFfefcfb).withOpacity(opacity),
              Color(0xFFfedbb1).withOpacity(opacity),

            ],
            // begin: FractionalOffset(0.0, 0.0),
            // end: FractionalOffset(1.0, 2.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            // border: Border.all(
            //   width: 1.5,
            //   color: Colors.white.withOpacity(0.2),
            // ),
          ),
          child: child,
        ),
      ),
    );
  }
}