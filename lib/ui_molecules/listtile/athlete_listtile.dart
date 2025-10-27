import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AthleteListTile extends StatelessWidget {
  final String name;
  final String status;
  final String type;
  final String expiryDate;
  final String lastCheckin;
  final String imageUrl;
  final VoidCallback? onTap; // Added for better reusability

  const AthleteListTile({
    super.key,
    required this.expiryDate,
    required this.name,
    required this.status,
    required this.type,
    required this.lastCheckin,
    required this.imageUrl,
    this.onTap,
  });

  // Helper to determine the color of the status text
  Color _getStatusColor(String status) {
    return status == 'Attiva' ? Colors.green : 
           status == 'Inattiva' ? AppColor.red : 
           status == 'PROVA' ? Colors.orange : 
           Colors.white;
  }

  @override
  Widget build(BuildContext context) {
  
    return Column(
      children: [
        Material(
          
          surfaceTintColor: AppColor.transparent,
          shadowColor: AppColor.transparent,
          child: ListTile(
            hoverColor: AppColor.transparent,
            focusColor: AppColor.transparent,
            splashColor: AppColor.transparent,
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: cw(28),
              backgroundImage: AssetImage(imageUrl),
              backgroundColor: const Color(0xFF333333),
            ),
            
            title: AppText(
              txt:name,
                           color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontSize: AppFontSize.f19,
              
            ),
            
            // --- Subtitle: Status and Details ---
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Row(
                  children: [
                 AppText(
                      txt: status,
                        color: _getStatusColor(status),
                        fontWeight: FontWeight.w600,
                height: 2,
                        fontSize: AppFontSize.f15,
                      ),
                    
                    // 'Ultimo check-in' text
                     AppText(
                      txt:' Ultimo check-in ',
                     color:AppColor.white.withOpacity(0.7), fontSize: AppFontSize.f15,
                    ),
                   AppText(
                      txt:lastCheckin,
                      fontSize: AppFontSize.f15,
                    ),
                  ],
                ),
                AppText(
                  txt: '$type $expiryDate',
                   color:AppColor.white.withOpacity(0.54), fontSize: AppFontSize.f15,
                   height:1.5,
                ),
              ],
            ),
            
            // --- Trailing: Arrow Icon ---
            trailing:SvgPicture.asset(AssetUtils.arrowForward),
            
            onTap: onTap, 
          ),
        ),
        
       
      ],
    );
  }
}