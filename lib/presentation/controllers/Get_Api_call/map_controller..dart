import 'dart:developer';
import 'package:ast_official/data/models/map_model.dart';
import 'package:flutter/material.dart';

import '../../../domain/repository/repo_service.dart';

class MapController with ChangeNotifier {
  MapModel? map;
  bool isLoading = false;

  getMapData() {
    Repository().getMapData(true).then((value) {
      map = value;
      isLoading = true;
      notifyListeners();
    }).catchError((e) {
      log(e.toString());
    });
  }

  MapController() {
    getMapData();
  }
}
