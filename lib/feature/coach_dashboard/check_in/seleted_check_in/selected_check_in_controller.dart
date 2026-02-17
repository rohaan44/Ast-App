import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:flutter/material.dart';

class SelectedCheckInController extends ChangeNotifier {
  final AppRepoService appRepoService;

  SelectedCheckInController({required this.appRepoService});

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  // Future<void> getChekInById({required BuildContext context, required String id}) async {
  //   _isLoading = true;
  //   final response = await runApiCall(
  //       apiCall: () => appRepoService.getCoachCheckInById(id: id),
  //       context: context,
  //       onSuccess: (response) async {});
  // }
}
