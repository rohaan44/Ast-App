import 'package:flutter/material.dart';

class AppDismissKeyboard extends StatelessWidget {
  final Widget child;

  const AppDismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
