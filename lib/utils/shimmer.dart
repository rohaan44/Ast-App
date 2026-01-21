import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GlobalSkeleton extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const GlobalSkeleton({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      enableSwitchAnimation: true,
      child: child,
    );
  }
}
