import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/feature/athelete_dashboard/dashboard/dashboard_controller.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewYourCheckInController extends ChangeNotifier {
  final AppRepoService appRepoService;
  TextEditingController weightLastWeek = TextEditingController();
  TextEditingController weightThisWeek = TextEditingController();
  TextEditingController lifeLastWeek = TextEditingController();
  TextEditingController lifeThisWeek = TextEditingController();
  TextEditingController armLastWeek = TextEditingController();
  TextEditingController armThisWeek = TextEditingController();

  ReviewYourCheckInController({required this.appRepoService}) {
    weightLastWeek.addListener(_onTextChanged);
    weightThisWeek.addListener(_onTextChanged);
    lifeLastWeek.addListener(_onTextChanged);
    lifeThisWeek.addListener(_onTextChanged);
    armLastWeek.addListener(_onTextChanged);
    armThisWeek.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    notifyListeners();
  }

  bool get isNext =>
      weightLastWeek.text.isNotEmpty &&
      weightThisWeek.text.isNotEmpty &&
      lifeLastWeek.text.isNotEmpty &&
      lifeThisWeek.text.isNotEmpty &&
      armLastWeek.text.isNotEmpty &&
      armThisWeek.text.isNotEmpty;
bool _isLoading = false;
bool get isLoading => _isLoading;

  Future<void> createCheckIn(
      {required Map<String, dynamic> requestBody,
      required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    final response = await runApiCall(
        apiCall: () => appRepoService.createCheckIn(requestBody: requestBody),
        context: context,
        onSuccess: (data) async {
          final dashboardController = context.read<DashboardController>();
          dashboardController.setSelectedIndex(0);
          if (dashboardController.pageController.hasClients) {
            dashboardController.pageController.jumpToPage(0);
          }
          Navigator.popUntil(context,
              (route) => route.settings.name == RoutePaths.dashboardView);
        });
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    weightLastWeek.dispose();
    weightThisWeek.dispose();
    lifeLastWeek.dispose();
    lifeThisWeek.dispose();
    armLastWeek.dispose();
    armThisWeek.dispose();
    super.dispose();
  }
}
