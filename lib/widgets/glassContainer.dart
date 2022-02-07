import 'package:flutter/material.dart';

import 'package:glass_kit/glass_kit.dart';

class FrostedGlass extends StatelessWidget {
  final bool isFrostedGlass;
  final double height;
  final double width;
  final Widget baccha;
  final Gradient glassColor;
  final Gradient borderColor;
  final double brdwdth;

  const FrostedGlass({
    Key? key,
    required this.brdwdth,
    required this.isFrostedGlass,
    required this.height,
    required this.width,
    required this.baccha,
    required this.borderColor,
    required this.glassColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(19.47),
      height: height,
      width: width,
      gradient: glassColor,

      borderGradient: borderColor,
      blur: 8.85,
      borderWidth: brdwdth,
      isFrostedGlass: isFrostedGlass,

      // shadowColor: Colors.black.withOpacity(0.20),
      alignment: Alignment.center,
      frostedOpacity: 0.12,
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      child: baccha,
    );
  }
}



























//?----> Tried as a Method but didn't work 


// import 'package:glass_kit/glass_kit.dart';



// import 'package:flutter/material.dart';

// Widget frostedGlass(
//     {required final bool isFrostedGlass,
//     required final double lambai,
//     required final double chaudai,
//     final Widget? baccha,
//     final Gradient? glassColor,
//     final Gradient? borderColor}) {
//   return GlassContainer(
//     borderRadius: BorderRadius.circular(19.47),
//     height: lambai,
//     width: chaudai,
//     gradient: glassColor,
//     borderGradient: borderColor,
//     blur: 8.85,
//     borderWidth: 0.71,
//     isFrostedGlass: isFrostedGlass,

//     // shadowColor: Colors.black.withOpacity(0.20),
//     alignment: Alignment.center,
//     frostedOpacity: 0.12,
//     margin: EdgeInsets.all(8.0),
//     padding: EdgeInsets.all(8.0),
//     child: baccha,
//   );
// }



