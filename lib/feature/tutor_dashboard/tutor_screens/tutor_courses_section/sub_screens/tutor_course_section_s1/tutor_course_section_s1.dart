import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/feature/tutor_dashboard/tutor_screens/tutor_courses_section/sub_screens/tutor_course_section_s1/tutor_course_section_s1_controller.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';

class TutorCourseSectionS1View extends StatelessWidget {
  const TutorCourseSectionS1View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TutorCourseSectionS1Controller>(context);
    final course = model.course;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(20)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AssetUtils.backArrow,
                        height: ch(24),
                      ),
                    ),
                  ),
                  Center(
                    child: AppText(
                      txt: "Corso Details",
                      fontSize: AppFontSize.f16 + 4,
                      isItalic: true,
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding:
                    EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    activityCard(
                      isGradient: true,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: ch(44),
                                width: cw(64),
                                decoration: BoxDecoration(
                                  color: AppColor.c626262,
                                  borderRadius: BorderRadius.circular(cw(12)),
                                ),
                                child: Center(
                                  child: AppText(
                                    txt: "Corso",
                                    fontSize: AppFontSize.f16,
                                    color: AppColor.cFFFFFF,
                                  ),
                                ),
                              ),
                              SizedBox(width: cw(12)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: course["title"]!,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: ch(22),
                                width: cw(68),
                                padding: EdgeInsets.symmetric(
                                    horizontal: cw(10), vertical: ch(4)),
                                decoration: BoxDecoration(
                                  color: AppColor.c34C759,
                                  borderRadius: BorderRadius.circular(cw(12)),
                                ),
                                child: Center(
                                  child: AppText(
                                    txt: "Attivo",
                                    fontSize: 11,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: ch(20)),
                          AppText(
                            txt: course["description"]!,
                            fontSize: 12,
                            color: Colors.white60,
                            maxLines: 2,
                          ),
                          SizedBox(height: ch(20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.access_time,
                                  size: cw(14), color: Colors.orangeAccent),
                              AppText(
                                  txt: course["weeks"]!,
                                  fontSize: AppFontSize.f15,
                                  color: AppColor.cFFFFFF),
                              SizedBox(width: cw(12)),
                              Icon(
                                Icons.group,
                                size: cw(14),
                                color: AppColor.cFF8D28,
                              ),
                              AppText(
                                  txt: course["students"]!,
                                  fontSize: AppFontSize.f15,
                                  color: AppColor.cFFFFFF.withOpacity(0.7)),
                              SizedBox(width: cw(12)),
                              SvgPicture.asset(
                                AssetUtils.intro,
                                color: AppColor.cFF8D28,
                              ),
                              AppText(
                                  txt: course["modules"]!,
                                  fontSize: AppFontSize.f15,
                                  color: AppColor.cFFFFFF.withOpacity(0.7)),
                            ],
                          ),
                        ],
                      ),
                    )
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.all(cw(16)),
                    //   decoration: BoxDecoration(
                    //     color: AppColor.c313131,
                    //     border: Border.all(
                    //         color: Colors.orangeAccent.withOpacity(0.5)),
                    //     borderRadius: BorderRadius.circular(cw(16)),
                    //   ),
                    //   child:),

                    ,
                    SizedBox(height: ch(24)),
                    AppText(
                      txt: "Moduli",
                      fontSize: AppFontSize.f20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    SizedBox(height: ch(12)),
                    ListView.builder(
                      itemCount: model.modules.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final mod = model.modules[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: ch(10)),
                          padding: EdgeInsets.all(cw(14)),
                          decoration: BoxDecoration(
                            color: AppColor.c313131,
                            borderRadius: BorderRadius.circular(cw(14)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: ch(36),
                                width: cw(36),
                                decoration: const BoxDecoration(
                                  color: AppColor.c292929,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SizedBox(
                                    height: ch(12),
                                    width: cw(12),
                                    child: mod["icon"],
                                  ),
                                ),
                              ),
                              SizedBox(width: cw(12)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      txt: mod["title"] ?? "",
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: ch(2)),
                                    AppText(
                                      txt: mod["type"] ?? "",
                                      fontSize: 12,
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(AssetUtils.edit)
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: ch(16)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutePaths.tutorCourseSectionS2View,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: ch(14)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(cw(50)),
                        ),
                        child: Center(
                          child: AppText(
                            txt: "+ Carica contenuto (video/PDF)",
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: ch(10)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutePaths.tutorCourseSectionS2View,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: ch(14)),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(cw(50)),
                          border: Border.all(color: Colors.grey.shade800),
                        ),
                        child: Center(
                          child: AppText(
                            txt: "+ Aggiungi collegamento al quiz",
                            fontSize: AppFontSize.f16,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget activityCard({
  required Widget child,
  bool isGradient = true,
  double borderRadius = 16,
  double borderWidth = 2,
  EdgeInsets? padding,
  double? width,
  ImageProvider? image,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: image != null
          ? DecorationImage(
              image: image,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColor.background.withOpacity(0.8), BlendMode.darken))
          : null,
      border: Border.all(
          width: isGradient == false ? 3 : 0,
          color: isGradient == false ? AppColor.c2C2C32 : AppColor.transparent),
      gradient: isGradient ? AppGradients.redGradient : null,
      color: isGradient ? null : AppColor.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: isGradient
        ? Padding(
            padding: EdgeInsets.all(borderWidth),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF121212),
                borderRadius: BorderRadius.circular(borderRadius - 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          )
        : Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
  );
}
