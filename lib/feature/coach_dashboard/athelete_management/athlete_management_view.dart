import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/primary_textfield/primary_text_field.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AthleteManagementView extends StatelessWidget {
  const AthleteManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
         // SizedBox(height: ch(20),),
           Padding(
             padding:  EdgeInsets.all(cw(20)),
             child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    
                      AppText(
                        txt: "Atlete",
                        fontSize: AppFontSize.f24,
                        isItalic: true,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        child: SvgPicture.asset(
                          AssetUtils.profileIcon,
                          height: ch(40),
                        ),
                      )
                    ],
                  ),
           ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                primaryTextField(hintText: "Search")
              ],
            ),
          ))
        ],
      )),
    );
  }
}