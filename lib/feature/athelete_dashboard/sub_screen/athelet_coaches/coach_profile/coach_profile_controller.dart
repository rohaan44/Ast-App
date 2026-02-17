import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:flutter/material.dart';

class CoachProfileController with ChangeNotifier {
 final AppRepoService appRepoService;
  bool isLoading = true;
  bool isAboutExpanded = false;

  CoachProfileController(this.appRepoService) {
    _init();
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

  void _init() async {
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }
}
