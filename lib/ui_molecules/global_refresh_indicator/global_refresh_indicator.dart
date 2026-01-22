import 'package:flutter/material.dart';
import 'package:ast_official/utils/colors_utils.dart';

class GlobalRefreshIndicator extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const GlobalRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColor.cFFFFFF,
      backgroundColor: AppColor.cEB5725,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
