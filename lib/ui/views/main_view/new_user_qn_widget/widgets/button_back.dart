import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_icons.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';
import 'package:longevity_ai_questionnaire/ui/common/widgets/hovered_widget.dart';

class ButtonBack extends StatelessWidget{
  const ButtonBack({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return HoveredWidget(
      borderRadius: BorderRadius.circular(12.r),
      onTap:  onTap,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(left: 10.w, right: 24.w, top: 10.h, bottom: 10.h),
        child: Row(
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                child: SvgPicture.asset(
                  AppIcons.imageArrowNext,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ),
            6.sbWidth,
            Text(
              'Back',
              style: AppStyles.text18.andColor(AppColors.textHint),
            )
          ],
        ),
      ),
    );
  }

}