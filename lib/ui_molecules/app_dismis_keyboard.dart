import 'package:flutter/material.dart';

class AppDismissKeyboard extends StatelessWidget {
  final Widget child;

  const AppDismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
  //    splashColor: Colors.transparent,    // disables splash animation
  // highlightColor: Colors.transparent, // disables highlight color
  // hoverColor: Colors.transparent, 
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
