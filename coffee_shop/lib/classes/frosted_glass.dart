import 'dart:ui';

import 'package:flutter/material.dart';

/// {@template frosted_glass}
/// FrostedGlassBox widget.
/// {@endtemplate}
class FrostedGlassBox extends StatelessWidget {
  /// {@macro frosted_glass}
  ///
  final thewidth;
  final theheight;
  final thechild;
  const FrostedGlassBox({
    super.key, // ignore: unused_element
    required this.theheight,
    required this.thewidth,
    required this.thechild,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
          width: thewidth,
          height: theheight,
          color: Colors.transparent,
          child: Stack(
            children: [
              //blur effect
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(),
              ),
              //gradient effect
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.13),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),

              //child
              Center(child: thechild),
            ],
          )),
    );
  }
}
