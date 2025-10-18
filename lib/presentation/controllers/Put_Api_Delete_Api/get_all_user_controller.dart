import 'dart:developer';
import 'package:ast_official/domain/repository/repo_service.dart';
import 'package:flutter/material.dart';

class GetAllUserController with ChangeNotifier {
  List? model;
  GetAllUserController() {
    getAllUser();
  }

  getAllUser() {
    Repository().getAllUsers().then((value) {
      model = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  putApi(Object obj, int id) {
    Repository().putApi(obj, id).then((value) {
      getAllUser();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  deleteApi(int id) {
    Repository().deleteApi(id).then((value) {
      getAllUser();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }
}
