import 'package:flutter/material.dart';
import 'package:longevity_ai_questionnaire/domain/enums.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.maxRange,
    required this.minRange,
    required this.value,
    this.dangerLevel = DangerLevel.low
  });

  final DangerLevel dangerLevel;
  const IndicatorWidget.diagnosticSheet({
    super.key,
    required this.value,
    required this.dangerLevel
  }) : minRange = 20, maxRange = 100;

//  final TestParameter parameter;
  final double maxRange;
  final double minRange;
  final double value;

  @override
  Widget build(BuildContext context) {
    int leftFit = value.toInt();
    final rightFit = 100 - leftFit;
    Color color;
    switch(dangerLevel){
      case DangerLevel.low:{
        color = AppColors.scaleGreenColor;
        break;
      }
      case DangerLevel.moderate:{
        color = AppColors.scaleYellowColor;
        break;
      }
      case DangerLevel.high:{
        color = AppColors.scaleOrangeColor;
        break;
      }
      default: {
        color = Colors.black;
      }
    }
    if (leftFit == 100) {
      return Container(
        height: 6.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(71.r),
        ),
      );
    }
    if (leftFit == 0) {
      if (value == minRange) {
        return Container(
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(71.r),
              bottomEnd: Radius.circular(71.r),
            ),
            color: color.withOpacity(0.2),
          ),
        );
      }
      leftFit = 1;
    }
    return Row(
      children: [
        Expanded(
          flex: leftFit,
          child: Container(
            height: 6.h,
            decoration: BoxDecoration(
              boxShadow: AppColors.scaleShadow,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(71.r),
                bottomStart: Radius.circular(71.r),
              ),
              color: color,
            ),
          ),
        ),
        Expanded(
          flex: rightFit,
          child: Container(
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(71.r),
                bottomEnd: Radius.circular(71.r),
              ),
              color: color.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }
}
