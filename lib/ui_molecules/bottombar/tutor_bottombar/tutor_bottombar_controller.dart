import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/cupertino.dart';

class TutorBottomBar with ChangeNotifier {
  final PageController pageController = PageController();
  final List<String> iconsList = [
    AssetUtils.homeIcon,
    AssetUtils.tutorBottomIcon1,
    AssetUtils.tutorBottomIcon2,
    AssetUtils.tutorBottomIcon3,
    AssetUtils.tutorBottomIcon4
  ];

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
