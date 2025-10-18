import 'package:flutter/material.dart';

void goTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => page),
  );
}
// goTo(context, const HomeScreen());

void goToReplace(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => page),
  );
}

// goToReplace(context, const LoginScreen());

void goToAndClear(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => page),
    (route) => false,
  );
}


// goToAndClear(context, const DashboardScreen());
