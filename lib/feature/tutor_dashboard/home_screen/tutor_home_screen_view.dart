import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorHomeScreenView extends StatelessWidget {
  const TutorHomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: cw(20), vertical: ch(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    txt: "Ciao, Alex",
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
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: cw(20)),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              activityCardItem(
                                width: cw(171),
                                height: ch(121),
                                title: "Corsi Attivi",
                                countLabel: "5",
                                isGradient: true,
                                onTap: () {},
                              ),
                              SizedBox(
                                height: ch(10),
                              ),
                              activityCardItem(
                                width: cw(171),
                                height: ch(121),
                                title: "Esami In\nSospeso",
                                countLabel: "12",
                                isGradient: false,
                                onTap: () {},
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: cw(11),
                        ),
                        activityCardItem(
                          image: const AssetImage(AssetUtils.tutorContainerBG),
                          title: "Certificati Emessi",
                          countLabel: "30",
                          isGradient: false,
                          height: ch(252),
                          isSpacer: true,
                          width: cw(171),
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: ch(30),
                    ),
                    SizedBox(
                      height: ch(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          txt: "Notifiche",
                          fontSize: AppFontSize.f19,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutePaths.notificationScreen);
                              },
                              child: AppText(
                                txt: "Visualizza tutto",
                                fontSize: AppFontSize.f16,
                                color: AppColor.c42A8FF,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.c42A8FF,
                              ),
                            ),
                            SizedBox(
                              width: cw(4),
                            ),
                            SvgPicture.asset(AssetUtils.arrowForward)
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: ch(15),
                    ),
                    notificationCard(
                        title: "John ha inviato il",
                        title_2: " Modulo 2 dello studio di caso",
                        title2Color: AppColor.cFF8D28,
                        subtitle: "2 ore fa"),
                    SizedBox(
                      height: ch(15),
                    ),
                    notificationCard(
                        title: "Maria ha completato il",
                        title_2: " Quiz 3",
                        title2Color: AppColor.c00C3D0,
                        subtitle: "2 ore fa"),
                    SizedBox(
                      height: ch(15),
                    ),
                    notificationCard(
                        title: "Certificazione rilasciata a",
                        title_2: " Luca",
                        title2Color: AppColor.c34C759,
                        subtitle: "L'atleta Jane Roe ha inviato"),
                    SizedBox(
                      height: ch(50),
                    )
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
                  AppColor.c000000.withOpacity(0.9), BlendMode.darken))
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

Widget activityCardItem({
  required String title,
  String? subtitle,
  String? countLabel,
  String? iconPath,
  bool isGradient = true,
  double? width,
  double? height,
  bool isSpacer = false,
  VoidCallback? onTap,
  ImageProvider? image,
}) {
  return GestureDetector(
    onTap: onTap,
    child: activityCard(
      isGradient: isGradient,
      width: width,
      height: height,
      child: Stack(
        children: [
          if (image != null)
            Positioned(
              top: 0,
              right: 0,
              child: ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ).createShader(rect),
                blendMode: BlendMode.dstIn,
                child: Image(
                  image: image,
                  width: width != null ? width * 0.9 : 120,
                  fit: BoxFit.contain,
                  opacity: const AlwaysStoppedAnimation(0.7),
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isSpacer) const Spacer(),
              AppText(
                txt: subtitle != null ? "$title\n$subtitle" : title,
                fontSize: AppFontSize.f19,
                fontWeight: FontWeight.w600,
                isItalic: true,
                height: 1.5,
              ),
              if (countLabel != null)
                Row(
                  children: [
                    AppText(
                      txt: countLabel,
                      fontSize: AppFontSize.f16,
                    ),
                  ],
                ),
              SizedBox(
                height: ch(25),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget notificationCard({
  required String title,
  required String title_2,
  required String subtitle,
  Color title2Color = AppColor.cFFFFFF,
}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    decoration: BoxDecoration(
      color: AppColor.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(cw(20)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: cw(50),
          height: ch(50),
          padding: EdgeInsets.all(cw(15)),
          decoration: const BoxDecoration(
            color: AppColor.c252525,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AssetUtils.bellIcon,
            width: 18,
            height: 18,
          ),
        ),
        SizedBox(width: cw(16)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.f20 - 2,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: title_2,
                      style: TextStyle(
                        color: title2Color,
                        fontSize: AppFontSize.f20 - 2,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(4)),
              AppText(
                txt: subtitle,
                color: AppColor.white.withOpacity(0.5),
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.normal,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
