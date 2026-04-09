import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_controller.dart';
import 'package:ast_official/feature/coach_dashboard/athelete_management/athlete_management_controller.dart';
import 'package:ast_official/feature/coach_dashboard/check_in/check_in_reviews/check_in_reviews_controller.dart';
import 'package:ast_official/feature/coach_dashboard/coach_Message/coach_chat_controller.dart';

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

  void setSelectedIndex(int index, BuildContext context) {
    _selectedIndex = index;
    notifyListeners();

    // Trigger API calls for the selected tab
    _refreshTabData(index, context);
  }

  void _refreshTabData(int index, BuildContext context) {
    switch (index) {
      case 0:
        context
            .read<CoachHomeScreenController>()
            .getAllMyAtheletes(context: context);
        break;
      case 1:
        context
            .read<AthleteManagementController>()
            .getAllMyAtheletes(context: context);
        break;
      case 2:
        // PlansManagementController doesn't have a fetch method yet
        break;
      case 3:
        context
            .read<CheckInReviewsController>()
            .getCoahCheckInReview(context: context);
        break;
      case 4:
        context.read<CoachChatController>().loadConversations();
        break;
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
