import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/coach_dashboard/home_screen/coach_home_screen_view.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_helper/app_helpers.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/appbar/appbar.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui_molecules/app_helper/app_constant.dart';
import '../seleted_check_in/selected_check_in_view.dart';
import 'edit_ai_suggestion_controller.dart';

class EditAiSuggestionView extends StatelessWidget {
  const EditAiSuggestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final flowData = context.read<FlowDataProvider>().getFlowData(checkIn);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: cw(20)),
        child: Column(
          children: [
            centerTextBackIconAppbar(
                context: context, text: "Modifica suggerimenti AI"),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  activityCard(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: cw(50),
                            backgroundColor: AppColor.blue,
                            // backgroundImage: AssetImage(athlete["imagePath"]
                            // ),
                          ),
                          SizedBox(
                            width: cw(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                txt: flowData?["name"] ?? "N/A",
                                fontSize: AppFontSize.f20,
                              ),
                              SizedBox(
                                height: ch(8),
                              ),
                              AppText(
                                txt: flowData?["date"] ?? "N/A",
                                fontSize: AppFontSize.f15 - 2,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: ch(20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Card 1: Weight Gain
                          activityCard(
                              width: cw(93),
                              height: ch(100),
                              isGradient: true,
                              child: activityInfoContent(
                                  topText: 'Peso',
                                  mainValue:
                                      "${flowData?["weight"]?.toString() ?? "N/A"} Kg",
                                  changeValue: '+0.2kg',
                                  isPositiveChange: true)),

                          // Card 2: Percentage Loss
                          activityCard(
                              width: cw(93),
                              height: ch(100),
                              isGradient: true,
                              child: activityInfoContent(
                                  topText: 'Vita',
                                  mainValue:
                                      '${flowData?["waist"]?.toString() ?? "N/A"} cm',
                                  changeValue: '-0.5 cm',
                                  isPositiveChange: false)),

                          // Card 3: Weight Gain
                          activityCard(
                              width: cw(93),
                              height: ch(100),
                              isGradient: true,
                              child: activityInfoContent(
                                  topText: 'Grasso',
                                  mainValue: '14.8%',
                                  changeValue: '+0.2kg',
                                  isPositiveChange: true)),
                        ],
                      ),
                    ],
                  )),
                  SizedBox(height: ch(20)),
                  activityCard(
                    padding: const EdgeInsets.all(0),
                    child: Consumer<EditAiSuggestionController>(
                      builder: (context, provider, _) {
                        final data = provider.aiSuggestions["nutrition"];
                        return Container(
                          padding: EdgeInsets.all(cw(16)),
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(cw(16)),
                            border: Border.all(
                                color: AppColor.white.withOpacity(0.1)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🔹 Title
                              AppText(
                                txt: "Adeguamento nutrizionale",
                                fontSize: AppFontSize.f20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                              SizedBox(height: ch(16)),

                              // 🔹 Inner card
                              Container(
                                padding: EdgeInsets.all(cw(16)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(12)),
                                  color: AppColor.white.withOpacity(0.05),
                                  border: Border.all(
                                      color: AppColor.white.withOpacity(0.1)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Status row (Respinto + toggle + edit icon)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            AppText(
                                              txt: data["status"],
                                              color: data["isRejected"]
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: AppFontSize.f15,
                                            ),
                                            SizedBox(width: cw(10)),
                                            Switch(
                                              activeColor: Colors.green,
                                              inactiveTrackColor:
                                                  Colors.red.withOpacity(0.5),
                                              inactiveThumbColor: Colors.red,
                                              value: !data["isRejected"],
                                              onChanged: (_) {
                                                provider
                                                    .toggleStatus("nutrition");
                                              },
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit,
                                              color: Colors.white, size: 20),
                                          onPressed: () {
                                            // You can show a bottom sheet or text field to edit
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                TextEditingController
                                                    controller =
                                                    TextEditingController(
                                                        text: data["text"]);
                                                return AlertDialog(
                                                  backgroundColor:
                                                      AppColor.background,
                                                  title: AppText(
                                                      txt: "Modifica testo",
                                                      color: AppColor.white,
                                                      fontSize:
                                                          AppFontSize.f20),
                                                  content: TextField(
                                                    controller: controller,
                                                    style: const TextStyle(
                                                        color: AppColor.white),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "Scrivi qui...",
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        provider.updateText(
                                                            "nutrition",
                                                            controller.text);
                                                        Navigator.pop(context);
                                                      },
                                                      child: AppText(
                                                        txt: "Salva",
                                                        fontSize:
                                                            AppFontSize.f18,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: ch(6)),
                                    AppText(
                                      txt: data["text"],
                                      color: AppColor.white.withOpacity(0.8),
                                      fontSize: AppFontSize.f16,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: ch(16)),

                              // 🔹 Add Button
                              GestureDetector(
                                onTap: () {
                                  // You can add a new suggestion dynamically
                                  provider.addNewSuggestion(
                                      "custom_${DateTime.now().millisecondsSinceEpoch}",
                                      {
                                        "status": "Approvato",
                                        "isRejected": false,
                                        "text": "Nuova intensità aggiunta",
                                      });
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(vertical: ch(14)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(cw(12)),
                                    border: Border.all(
                                        color: AppColor.white.withOpacity(0.3)),
                                    color: AppColor.white.withOpacity(0.03),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      txt: "+ Aggiungi intensità specifica",
                                      color: AppColor.white,
                                      fontSize: AppFontSize.f16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: ch(20)),
                  activityCard(
                    padding: const EdgeInsets.all(0),
                    child: Consumer<EditAiSuggestionController>(
                      builder: (context, provider, _) {
                        final data = provider.aiSuggestions["training"];
                        return Container(
                          padding: EdgeInsets.all(cw(16)),
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(cw(16)),
                            border: Border.all(
                                color: AppColor.white.withOpacity(0.1)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 🔹 Title
                              AppText(
                                txt: "Adattamento allenamento",
                                fontSize: AppFontSize.f20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                              SizedBox(height: ch(16)),

                              // 🔹 Inner card
                              Container(
                                padding: EdgeInsets.all(cw(16)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(cw(12)),
                                  color: AppColor.white.withOpacity(0.05),
                                  border: Border.all(
                                      color: AppColor.white.withOpacity(0.1)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            AppText(
                                              txt: data["status"],
                                              color: data["isRejected"]
                                                  ? Colors.red
                                                  : Colors.green,
                                              fontSize: AppFontSize.f15,
                                            ),
                                            SizedBox(width: cw(10)),
                                            Switch(
                                              activeColor: Colors.green,
                                              inactiveTrackColor:
                                                  Colors.red.withOpacity(0.5),
                                              inactiveThumbColor: Colors.red,
                                              value: !data["isRejected"],
                                              onChanged: (_) {
                                                provider
                                                    .toggleStatus("nutrition");
                                              },
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit,
                                              color: Colors.white, size: 20),
                                          onPressed: () {
                                            // You can show a bottom sheet or text field to edit
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                TextEditingController
                                                    controller =
                                                    TextEditingController(
                                                        text: data["text"]);
                                                return AlertDialog(
                                                  backgroundColor:
                                                      AppColor.background,
                                                  title: AppText(
                                                      txt: "Modifica testo",
                                                      color: AppColor.white,
                                                      fontSize:
                                                          AppFontSize.f20),
                                                  content: TextField(
                                                    controller: controller,
                                                    style: const TextStyle(
                                                        color: AppColor.white),
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText: "Scrivi qui...",
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.white54),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        provider.updateText(
                                                            "training",
                                                            controller.text);
                                                        Navigator.pop(context);
                                                      },
                                                      child: AppText(
                                                        txt: "Salva",
                                                        fontSize:
                                                            AppFontSize.f18,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: ch(6)),
                                    AppText(
                                      txt: data["text"],
                                      color: AppColor.white.withOpacity(0.8),
                                      fontSize: AppFontSize.f16,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: ch(16)),

                              // 🔹 Add Button
                              GestureDetector(
                                onTap: () {
                                  provider.addNewSuggestion(
                                      "custom_${DateTime.now().millisecondsSinceEpoch}",
                                      {
                                        "status": "Approvato",
                                        "isRejected": false,
                                        "text": "Nuova intensità aggiunta",
                                      });
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(vertical: ch(14)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(cw(12)),
                                    border: Border.all(
                                        color: AppColor.white.withOpacity(0.3)),
                                    color: AppColor.white.withOpacity(0.03),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      txt: "+ Aggiungi intensità specifica",
                                      color: AppColor.white,
                                      fontSize: AppFontSize.f16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: ch(20)),
                              AppText(
                                txt: "Note dell'allenatore",
                                fontSize: AppFontSize.f20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                              SizedBox(height: ch(16)),

                              GestureDetector(
                                onTap: () {
                                  provider.addNewSuggestion(
                                      "custom_${DateTime.now().millisecondsSinceEpoch}",
                                      {
                                        "status": "Approvato",
                                        "isRejected": false,
                                        "text": "Nuova intensità aggiunta",
                                      });
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      EdgeInsets.symmetric(vertical: ch(14)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(cw(12)),
                                    border: Border.all(
                                        color: AppColor.white.withOpacity(0.3)),
                                    color: AppColor.white.withOpacity(0.03),
                                  ),
                                  child: Center(
                                    child: AppText(
                                      txt: "+ Aggiungi intensità specifica",
                                      color: AppColor.white,
                                      fontSize: AppFontSize.f16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: ch(20),
                  ),
                  AppButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          RoutePaths.coachMainScreenView, (route) => false);
                    },
                    text: "Salva modifiche",
                  ),
                  SizedBox(
                    height: ch(20),
                  ),
                  AppButton(
                    onPressed: () {},
                    text: "Ripristina il piano AI",
                    textColor: AppColor.white,
                    buttonColor: AppColor.transparent,
                    isBorder: true,
                    borderColor: AppColor.c333333,
                  ),
                  SizedBox(
                    height: ch(40),
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
