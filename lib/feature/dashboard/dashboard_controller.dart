import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';

class DashboardController with ChangeNotifier {
  final PageController pageController = PageController();

  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  final List<String> iconsList = [
    AssetUtils.homeIcon,
    AssetUtils.icon,
    AssetUtils.icon1,
    AssetUtils.icon2,
    AssetUtils.icon3,
  ];
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
