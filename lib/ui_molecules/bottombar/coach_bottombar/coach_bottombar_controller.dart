import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/cupertino.dart';

class CoachBottomBar with ChangeNotifier {
  final PageController pageController = PageController();
  final List<String> iconsList = [
   AssetUtils.homeIcon,
    AssetUtils.coachBottombar2,
    AssetUtils.coachBottombar3,
    AssetUtils.coachBottombar4,
      AssetUtils.coachBottombar5
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }

   @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
