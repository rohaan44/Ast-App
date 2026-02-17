import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/helpers/api_helper/api_helper.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';

import 'package:flutter/material.dart';

class CoachProfileController with ChangeNotifier {
  final AppRepoService appRepoService;
  bool isAboutExpanded = false;
  String? _lastFetchedId;

  CoachProfileController({required this.appRepoService}) {
    // _init();
    // getCoachProfileById(id: "", context: context);
  }

  void toggleAboutExpanded() {
    isAboutExpanded = !isAboutExpanded;
    notifyListeners();
  }

  final Map<String, dynamic> coachData = {
    "name": "Darleen Bratt",
    "image":
        "https://static.vecteezy.com/system/resources/thumbnails/046/836/977/small/african-male-fitness-trainer-in-gym-fitness-and-wellness-african-american-coach-healthy-lifestyle-photo.jpg",
    "specialties": [
      {"label": "Cardio", "icon": "heart"},
      {"label": "Anaerobico", "icon": "bolt"},
      {"label": "Equilibrio", "icon": "scale"},
    ],
    "about":
        "Sono Darleen Bratt, una coach certificata nel fitness, appassionata nell'aiutare le persone a muoversi meglio, sentirsi più forti e vivere in salute. Con oltre 8 anni di esperienza nell'allenamento anaerobico, nei movimenti di equilibrio e nel potenziamento muscolare, ho guidato centinaia di atleti verso i loro obiettivi. Il mio approccio combina disciplina e divertimento, assicurando che ogni sessione sia efficace e motivante. Credo fermamente che il benessere sia un viaggio e sono qui per supportarti in ogni passo.",
  };

  final List<Map<String, dynamic>> workouts = [
    {
      "title": "Mountain Climbers",
      "subtitle": "Attivazione del core + cardio",
      "badges": ["3 serie x 20 sec", "12 kcal"],
      "tags": ["Principiante", "Allenamento di 4 settimane"],
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4ue5qKdBf9PNwfN3UUwUTDzjmZVjnwGtruA&s",
    }
  ];

  final Map<String, dynamic> reviewStats = {
    "rating": 4.5,
    "totalRatings": "200k",
    "totalReviews": "31k",
    "distribution": [0.8, 0.6, 0.4, 0.2, 0.1], // 5 to 1 stars
  };
  // void _init() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   isLoading = false;
  //   notifyListeners();
  // }
  Map<String, dynamic>? _coachProfile;
  Map<String, dynamic>? get coachProfile => _coachProfile;

  void clearProfile() {
    _coachProfile = null;
    _lastFetchedId = null;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
    bool _isLoadingCoachRequest = false;
  bool get isLoadingCoachRequest => _isLoadingCoachRequest;

  Future<void> sendCoachRequest(
      {required String coachId, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await runApiCall(
        context: context,
        apiCall: () => appRepoService.sendCoachRequest(coachId: coachId),
        onSuccess: (response) async {
          _isLoadingCoachRequest = true;
          showApiSnackBar(
            context,
            title: "Success",
            message: "Coach request sent successfully",
            isSuccess: true,
          );
        });
    _isLoading = false;
    notifyListeners();
  }

  // Future<void> getCoachProfileById(
  //     {required String id, required BuildContext context}) async {
  //   if (isLoading || _lastFetchedId == id) return;

  //   _lastFetchedId = id;
  //   isLoading = true;
  //   notifyListeners();
  //   await runApiCall(
  //       apiCall: () => appRepoService.getCoachProfileById(id: id),
  //       context: context,
  //       onSuccess: (response) async {
  //         // Robust parsing for different API response structures
  //         final dynamic data = response['data'];
  //         if (data is Map) {
  //           final List? users = data['users'];
  //           if (users != null && users.isNotEmpty) {
  //             _coachProfile = users.first as Map<String, dynamic>;
  //           } else if (data.containsKey('_id') || data.containsKey('id')) {
  //             _coachProfile = data as Map<String, dynamic>;
  //           } else {
  //             _coachProfile = response as Map<String, dynamic>;
  //           }
  //         } else {
  //           _coachProfile = response as Map<String, dynamic>;
  //         }
  //       });
  //   isLoading = false;
  //   notifyListeners();
  // }

  @override
  void dispose() {
    debugPrint("CoachProfileController DISPOSED");
    super.dispose();
  }
}
