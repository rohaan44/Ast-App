import 'package:ast_official/data/models/app_models/get_checkins_model.dart';
import 'package:ast_official/data/models/base_model/base_model.dart';
import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:flutter/material.dart';

class CheckInController extends ChangeNotifier {
  final AppRepoService appRepoService;
  CheckInController({required this.appRepoService});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ApiResponse<CheckInsResponseData>? checkinsResponse;
  List<Map<String, dynamic>>? checkinsData;
  bool _isFirstFetchDone = false;
  bool get isFirstFetchDone => _isFirstFetchDone;

  Future<void> getCheckins({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await runApiCallWithModel<ApiResponse<CheckInsResponseData>>(
      context: context,
      apiCall: () => appRepoService.getCheckins(),
      onSuccess: (response) async {
        checkinsResponse = response;
        checkinsResponse!.data?.checkIns;
        checkinsData =
            checkinsResponse!.data?.checkIns?.map((e) => e.toJson()).toList();
      },
    );
    _isFirstFetchDone = true;
    _isLoading = false;
    notifyListeners();
  }
}
