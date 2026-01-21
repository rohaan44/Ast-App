import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/asset_utils.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showApiSnackBar(
  BuildContext context, {
  required String title,
  required String message,
  required bool isSuccess,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 140,
          left: 10,
          right: 10),
      duration: const Duration(milliseconds: 1000),
      content: AnimatedApiSnackBar(
        title: title,
        message: message,
        isSuccess: isSuccess,
      ),
    ),
  );
}

class AnimatedApiSnackBar extends StatefulWidget {
  final String title;
  final String message;
  final bool isSuccess;

  const AnimatedApiSnackBar({
    super.key,
    required this.title,
    required this.message,
    required this.isSuccess,
  });

  @override
  State<AnimatedApiSnackBar> createState() => _AnimatedApiSnackBarState();
}

class _AnimatedApiSnackBarState extends State<AnimatedApiSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _fade,
        child: ApiSnackBar(
          title: widget.title,
          message: widget.message,
          isSuccess: widget.isSuccess,
        ),
      ),
    );
  }
}

class ApiSnackBar extends StatelessWidget {
  final String title;
  final String message;
  final bool isSuccess;

  const ApiSnackBar({
    super.key,
    required this.title,
    required this.message,
    required this.isSuccess,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: cw(16), vertical: ch(10)),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(cw(20)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _StatusIcon(isSuccess: isSuccess),
          SizedBox(width: cw(14)),
          Expanded(
            // <<< IMPORTANT FIX
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  txt: title,
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                  height: 1.2,
                ),
                SizedBox(height: ch(4)),
                AppText(
                  txt: message,
                  fontSize: AppFontSize.f13 + 6,
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final bool isSuccess;

  const _StatusIcon({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cw(34),
      height: ch(34),
      decoration: const BoxDecoration(
        gradient: AppGradients.redGradient,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        width: cw(24),
        height: ch(24),
        isSuccess ? AssetUtils.successIcon : AssetUtils.errorIcon,
      ),
    );
  }
}
