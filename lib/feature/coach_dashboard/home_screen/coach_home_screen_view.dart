import 'package:ast_official/app_ui_helpers/app_routes/route_paths.dart';
import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoachHomeScreenView extends StatelessWidget {
  const CoachHomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             Padding(
               padding: EdgeInsets.symmetric( horizontal: cw(20), vertical: ch(20)),
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        txt: "Pannello Di Controllo",
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
                physics:const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              activityCardItem(
                                title: "Check-in",
                                subtitle: "In Sospeso",
                                countLabel: "12 In attesa di",
                                iconPath: AssetUtils.arrowGoto,
                                isGradient: true,
                                width: cw(171),
                                onTap: () {},
                              ),
                              SizedBox(
                                height: ch(10),
                              ),
                              activityCardItem(
                                title: "Atleti",
                                subtitle: "Attivi",
                                countLabel: "8 Attivo",
                                iconPath: AssetUtils.arrowGoto,
                                isGradient: false,
                                width: cw(171),
                                onTap: () {
                                  // Navigate to Check-in screen
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: cw(11),
                        ),
                        Expanded(
                            child: activityCardItem(
                              image:const AssetImage(AssetUtils.cardBg),
                          title: "Suggerimenti",
                          subtitle: "Dell'intelligenza\nArtificiale",
                          countLabel: "5 Suggerimenti",
                          iconPath: AssetUtils.arrowGoto,
                          isGradient: false,
                          height: ch(252),
                          isSpacer: true,
                          width: cw(171),
                          onTap: () {
                            // Navigate to Check-in screen
                          },
                        ))
                      ],
                    ),
                    SizedBox(
                      height: ch(30),
                    ),
                    AppText(
                      txt: "Azioni rapide",
                      fontSize: AppFontSize.f19,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: ch(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(cw(14)),
                            height: ch(85),
                            width: cw(160),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(cw(16)),
                                gradient: AppGradients.redGradient),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColor.c252525,
                                  child: SvgPicture.asset(
                                    AssetUtils.arrowGoto,
                                    width: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: cw(15),
                                ),
                                AppText(
                                  txt: "Recensi\nOni Del\nCheck-in",
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSize.f20 - 3,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(cw(14)),
                            height: ch(85),
                            width: cw(160),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(cw(16)),
                                gradient: AppGradients.redGradient),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColor.c252525,
                                  child: SvgPicture.asset(
                                    AssetUtils.arrowGoto,
                                    width: 15,
                                  ),
                                ),
                                SizedBox(
                                  width: cw(15),
                                ),
                                AppText(
                                  txt: "Nuovi Piani",
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppFontSize.f20 - 4,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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
                        GestureDetector(
                            onTap: () {
                                Navigator.pushNamed(context, RoutePaths.notificationScreen);
                              },
                            
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                txt: "Visualizza tutto",
                                fontSize: AppFontSize.f16,
                                color: AppColor.c42A8FF,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColor.c42A8FF,
                              ),
                              SizedBox(width: cw(4),),
                              SvgPicture.asset(AssetUtils.arrowForward,color:  AppColor.c42A8FF,)
                            ],
                          ),
                        )
                      ],
                    )
                 
                ,SizedBox(height: ch(15),),
                notificationCard(title: "Check-in", title_2: " In Ritardo", subtitle: "L'atleta John Doe ha una causa in sospeso"),
                SizedBox(height: ch(15),),
                notificationCard(title: "Nuovo Piano: ", title_2: " Parte Superiore Del Corpo", subtitle: "L'intelligenza artificiale ha generato un nuovo piano"),
                SizedBox(height: ch(15),),
                notificationCard(title: "Check-in ", title_2: " inviato", subtitle: "L'atleta Jane Roe ha inviato"),
                
                          
                SizedBox(height: ch(50),)
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
          ? DecorationImage(image: image, fit: BoxFit.cover,colorFilter: ColorFilter.mode(AppColor.background.withOpacity(0.8), BlendMode.darken))
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
  required String subtitle,
  required String countLabel,
  required String iconPath,
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
      image: image
          ,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSpacer == true) ...[const Spacer()],
          AppText(
            txt: "$title\n$subtitle",
            fontSize: AppFontSize.f19,
            fontWeight: FontWeight.w600,
            isItalic: true,
            height: 1.5,
          ),

          SizedBox(height: ch(15)),
          Container(
            width: cw(114),
            height: ch(30),
            padding: EdgeInsets.symmetric(horizontal: cw(10)),
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(cw(50)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  txt: countLabel,
                  fontSize: AppFontSize.f15 - 2,
                ),
                SvgPicture.asset(
                  iconPath,
                  height: ch(10),
                ),
              ],
            ),
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
 }
){
  return Container(
    alignment: Alignment.center,
    height: ch(85),

    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    decoration: BoxDecoration(

      color: AppColor.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(cw(20)), // Rounded corners
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
          child: SvgPicture.asset(AssetUtils.bellIcon,width: 18,height: 18,)
        ),
         SizedBox(width: cw(16)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text:  TextSpan(
                  children: [
                    TextSpan(
                      text: title,
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: AppFontSize.f20-2,
                        fontWeight: FontWeight.w900,
                        height: 1.2, 
                      ),
                    ),
                    TextSpan(
                      text: title_2,
                      style: TextStyle(
                         color: AppColor.white,
                       fontSize: AppFontSize.f20-2,
                        fontWeight: FontWeight.w900,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: ch(4)), 
               AppText(txt:
                subtitle,
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


