import 'package:ast_official/feature/coach_dashboard/plans/nutrition_plan/nutrition_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/ui_molecules/buttons/app_primary_button.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';

class ShoppingListView extends StatelessWidget {
  const ShoppingListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NutritionPlanController>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal:cw(15)),
      decoration: BoxDecoration(
        color: AppColor.c1E1E1E,
        borderRadius: BorderRadius.circular(cw(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Category: Proteine
          ...controller.shoppingList.keys.map((category) {
            final items = controller.shoppingList[category]!;
            return Padding(
              padding: EdgeInsets.only(bottom: ch(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    txt: category,
                    fontSize: AppFontSize.f18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  SizedBox(height: ch(10)),

                  // 🔹 Item cards with checkbox
                  ...items.map((item) {
                    final bool isChecked = controller.checkedItems.contains(item);
                    return GestureDetector(
                      onTap: () => controller.toggleItem(item),
                      child: Container(
                        

                        margin: EdgeInsets.only(bottom: ch(10)),
                        padding: EdgeInsets.symmetric(
                            vertical: ch(14), horizontal: cw(14)),
                        decoration: BoxDecoration(
                          color: AppColor.c252525,
                          borderRadius: BorderRadius.circular(cw(50)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppText(
                                txt: item,
                                color: AppColor.white,
                                fontSize: AppFontSize.f14+5,
                              ),
                            ),
                            Checkbox(
                              value: isChecked,
                              onChanged: (_) => controller.toggleItem(item),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              activeColor: AppColor.red,
                              side: BorderSide(
                                  color: AppColor.white.withOpacity(0.8),
                                  width: 1.2),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          }),

          // 🔹 Total cost card
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: ch(10)),
            padding: EdgeInsets.all(cw(14)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cw(12)),
              border: Border.all(color: AppColor.red.withOpacity(0.5)),
            ),
            child: Center(
              child: AppText(
                txt: "Costo totale stimato: \$85 | Per 7 giorni",
                fontSize: AppFontSize.f15 + 1,
                fontWeight: FontWeight.w600,
                color: AppColor.white.withOpacity(0.9),
              ),
            ),
          ),

          SizedBox(height: ch(20)),
          // 🔹 Bottom buttons
          AppButton(
            text: "Scarica l'elenco (PDF)",
            onPressed: () {},
            textColor: AppColor.black,
            buttonColor: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: ch(15)),
          AppButton(
            text: "Sincronizza con l'app Store",
            onPressed: () {},
            isBorder: true,
            borderColor: AppColor.c333333,
            borderWidth: 1.5,
            buttonColor: AppColor.transparent,
            textColor: AppColor.white,
          ),
        ],
      ),
    );
  }
}
