import 'package:ast_official/ui_molecules/bottombar/coach_bottombar/coach_bottombar_controller.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

Widget coachBottomBar() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
    child: Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E).withOpacity(0.9),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Consumer<CoachBottomBar>(
        builder: (context, model, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(model.iconsList.length, (index) {
              final bool isSelected = model.selectedIndex == index;

              return InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  model.setSelectedIndex(index);
                  model.pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColor.white.withOpacity(0.05)),
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColor.red
                        : AppColor.c252525.withOpacity(0.45),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      model.iconsList[index],
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        BlendMode.srcIn,
                      ),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    ),
  );
}
