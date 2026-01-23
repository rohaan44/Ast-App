import 'dart:io';

import 'package:ast_official/domain/repository/app_repo_service.dart';
import 'package:ast_official/ui_molecules/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

class TrainingPlanController with ChangeNotifier {
  final AppRepoService appRepoService;

  final TextEditingController nameController =
      TextEditingController(text: "Bench Press");
  final TextEditingController categoryController =
      TextEditingController(text: "Strength");
  final TextEditingController muscleController =
      TextEditingController(text: "Chest");
  final TextEditingController descriptionController =
      TextEditingController(text: "Compound chest exercise");

  final FocusNode nameControllerFocusNode = FocusNode();
  final FocusNode categoryControllerFocusNode = FocusNode();
  final FocusNode muscleControllerFocusNode = FocusNode();
  final FocusNode descriptionControllerFocusNode = FocusNode();

  TrainingPlanController({required this.appRepoService});

  // final ImagePicker _picker = ImagePicker();

  String video = "https://example.com/video.mp4";
  File? selectedVideo;

  bool get hasVideo => selectedVideo != null;

  // Future<void> pickVideo() async {
  //   final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

  //   if (video != null) {
  //     selectedVideo = File(video.path);
  //     notifyListeners();
  //   }
  // }

  void clearVideo() {
    selectedVideo = null;
    notifyListeners();
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final Map<String, dynamic> planData = {
    "title": "Fase 1 dell’ipertrofia",
    "type": "Formazione",
    "duration": "6 settimane",
    "focus": "Forza/Ipertrofia"
  };

  final Map<String, TextEditingController> controllers = {};

  TextEditingController getController(String key, String initialValue) {
    if (!controllers.containsKey(key)) {
      controllers[key] = TextEditingController(text: initialValue);
    }
    return controllers[key]!;
  }

  void updateText(String key, String value) {
    if (controllers.containsKey(key)) {
      controllers[key]!.text = value;
      controllers[key]!.selection =
          TextSelection.collapsed(offset: value.length);
    }
    notifyListeners();
  }

  void disposeControllers() {
    for (final c in controllers.values) {
      c.dispose();
    }
    controllers.clear();
  }

  List days = [
    {
      'title': "Giorno 1: Corpo Intero",
      'exercises': ["Squats", "Bench", "Righe"],
    },
    {
      'title': "Giorno 2: Inferiore",
      'exercises': ["Stacchi", "Pull Ups"],
    },
  ];
  List<Map<String, dynamic>> weekPlans = [
    {
      "days": [
        {
          "title": "Giorno 1: Corpo intero",
          "exercises": ["Squats", "Bench", "Righe"]
        },
        {
          "title": "Giorno 2: Inferiore",
          "exercises": ["Stacchi", "Pull Ups"]
        },
      ]
    }
  ];

  void updateDayTitle(int week, int day, String newTitle) {
    weekPlans[week]["days"][day]["title"] = newTitle;
    notifyListeners();
  }

  void updateExercise(int week, int day, int exIndex, String newName) {
    weekPlans[week]["days"][day]["exercises"][exIndex] = newName;
    notifyListeners();
  }

  void addExercise(int week) {
    weekPlans[week]["days"][0]["exercises"].add("Nuovo esercizio");
    notifyListeners();
  }

  Future<void> createExcercise(context, String name, String category,
      String muscleGroup, String description, String videoUrl) async {
    final response = await appRepoService.createExcercise(
        name: name,
        category: category,
        muscleGroup: muscleGroup,
        description: description,
        videoUrl: videoUrl);
    if (response == true) {
      showApiSnackBar(
        context,
        title: "Success",
        message: "Exercise create successfully",
        isSuccess: true,
      );
      // Navigator.pushNamed(context, RoutePaths.otpView);
      // context.read<FlowDataProvider>().addOrUpdateFlow(customerSignIn,
      //   data: {"email": email,
      //   "from": "forgotPassword"
      //   },
      // );
    } else {
      showApiSnackBar(
        context,
        title: "Error",
        message: "Failed to resend OTP",
        isSuccess: false,
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();

    nameControllerFocusNode.dispose();

    muscleController.dispose();
    descriptionController.dispose();
    descriptionControllerFocusNode.dispose();
    muscleControllerFocusNode.dispose();
    categoryController.dispose();
    categoryControllerFocusNode.dispose();
    muscleControllerFocusNode.dispose();
    disposeControllers();
    super.dispose();
  }
}
