import 'dart:developer';
import 'package:ast_official/data/models/response_model.dart';
import 'package:ast_official/domain/repository/repo_service.dart';
import 'package:flutter/material.dart';

class PostApiController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  Map map = {};
  ResponseModel? model;

  postData() {
    Repository()
        .postApi({
          "id": 0,
          "username": userNameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passController.text.trim(),
        })
        .then((value) {
          if (value != null) {
            map = value;
            log(value.toString());
          }
        })
        .then((value) => getResponse())
        .onError((error, stackTrace) {
          log(error.toString());
        });
  }

  getResponse() {
    if (map["id"] != null) {
      Repository().getResponse(map["id"]).then((value) {
        model = value;
        notifyListeners();
      }).onError((error, stackTrace) {
        log("Get Response Error: $error");
      });
    } else {
    log("Invalid map id: ${map["id"]}");
    }
  }
}
