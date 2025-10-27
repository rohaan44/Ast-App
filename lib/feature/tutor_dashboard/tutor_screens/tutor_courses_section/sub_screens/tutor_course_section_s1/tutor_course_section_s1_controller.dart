import 'package:ast_official/utils/asset_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorCourseSectionS1Controller extends ChangeNotifier {
  final course = {
    "title": "Forza e Condizionamento – Livello 1",
    "description":
        "Corso di 6 settimane che copre le basi dell’allenamento della forza e i principi della nutrizione.",
    "weeks": "6 settimane",
    "students": "120 Studenti",
    "modules": "8 Moduli",
    "status": "Attivo",
  };

  final List<Map<String, dynamic>> modules = [
    {
      "title": "Modulo 1: Introduzione",
      "type": "Video",
      "icon": SvgPicture.asset(AssetUtils.intro),
    },
    {
      "title": "Modulo 2: Nozioni di base sulla nutrizione",
      "type": "PDF",
      "icon": SvgPicture.asset(AssetUtils.video),
    },
    {
      "title": "Modulo 3: Quiz 1",
      "type": "Collegato",
      "icon": SvgPicture.asset(AssetUtils.quiz),
    },
  ];
}
