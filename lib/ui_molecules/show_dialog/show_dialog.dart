import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';

Future<bool> showAlertDialog(
    {required BuildContext context,
    required String message,
    required VoidCallback onContinue}) async {
  Widget cancelButton = AppButton(
    borderRadius: cw(10),
    height: ch(40),
    width: cw(100),
    text: "Cancel",
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );
  Widget continueButton = AppButton(
    width: cw(100),
    borderRadius: cw(10),
    height: ch(40),
    text: "Continue",
    onPressed: () {
      onContinue();
    },
  ); // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // insetPadding: EdgeInsets.symmetric(horizontal: cw(0)),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(cw(10)),
    ),
    backgroundColor: AppColor.c171717,
    title: AppText(
      txt: "Sei sicuro?",
      fontSize: AppFontSize.f22,
      fontWeight: FontWeight.w600,
      color: AppColor.white,
    ),
    content: SizedBox(
      width: cw(300), // <── set dialog content width here
      child: AppText(
        txt: message,
        fontSize: AppFontSize.f18,
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
    ),
    actionsAlignment: MainAxisAlignment.spaceBetween,
    actions: [
      cancelButton,
      continueButton,
    ],
  ); // show the dialog
  final result = await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  return result ?? false;
}
