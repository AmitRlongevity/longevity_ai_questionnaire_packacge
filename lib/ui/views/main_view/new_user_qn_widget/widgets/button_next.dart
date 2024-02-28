import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_icons.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';
import 'package:longevity_ai_questionnaire/ui/common/widgets/hovered_widget.dart';

class ButtonNext extends ConsumerWidget{
  const ButtonNext({
    super.key,
    this.onTap,
    required this.isStart
  });
  final bool isStart;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(onTap == null){
      return Container(
        padding: EdgeInsets.only(left: 22.w, right: 8.w, top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderElements, width: 2),
        ),
        child: Row(
          children: [
            Text(
              isStart ? 'Start' : 'Next',
              style: AppStyles.text18.andColor(AppColors.textDisabled),
            ),
            6.sbWidth,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: SvgPicture.asset(
                AppIcons.imageArrowNext,
                width: 24.r,
                height: 24.r,
                colorFilter: const ColorFilter.mode(
                  AppColors.textDisabled,
                  BlendMode.srcIn
                ),
              ),
            )
          ],
        ),
      );
    }
    return HoveredWidget(
      backgroundColor: AppColors.backgroundMenu,
      hoverColor: AppColors.backgroundLightGreenHover,
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 22.w, right: 8.w, top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderDarkGreen, width: 2),
        ),
        child: Row(
          children: [
            Text(
              isStart ? 'Start' : 'Next',
              style: AppStyles.text18.andColor(AppColors.textDarkGreen),
            ),
            6.sbWidth,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: SvgPicture.asset(
                AppIcons.imageArrowNext,
                width: 24.r,
                height: 24.r,
              ),
            )
          ],
        ),
      ),
    );
  }

}