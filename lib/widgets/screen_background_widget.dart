import 'package:flutter/material.dart';
class ScreenBackGroundWidget extends StatelessWidget {
  final Widget child;
  const ScreenBackGroundWidget({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.blue,
    ],
    ),
    ),
      child: child,
    );
  }
}
