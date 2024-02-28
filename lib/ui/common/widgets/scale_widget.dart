import 'package:flutter/material.dart';
import 'package:longevity_ai_questionnaire/domain/enums.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';

import 'indicator_widget.dart';

class ScaleWidget extends StatelessWidget {
  const ScaleWidget({
    super.key,
    required this.maxRange,
    required this.minRange,
    required this.value,
    this.dangerLevel = DangerLevel.none
  }) : _isDiagnosticSheet = false;
  final double maxRange;
  final double minRange;
  final double value;
  final bool _isDiagnosticSheet;
  final DangerLevel dangerLevel;
  const ScaleWidget.diagnosticSheet({super.key, required this.value, required this.dangerLevel}) : _isDiagnosticSheet = true, maxRange = 0, minRange = 0;
//  final TestParameter parameter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 6.h,
          margin: EdgeInsets.only(top: 4.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(71.r)),
          child: _isDiagnosticSheet ?
            IndicatorWidget.diagnosticSheet(value: value, dangerLevel: dangerLevel,) :
            IndicatorWidget(
              value: value,
              maxRange: maxRange,
              minRange: minRange,
              dangerLevel: dangerLevel,
            ),
        ),
        Row(
          children: [
            const Spacer(
              flex: 20,
            ),
            _isDiagnosticSheet ? const _ScaleValueWidget.text(textValue: 'Low') : _ScaleValueWidget(value: minRange),
            const Spacer(
              flex: 60,
            ),
            _isDiagnosticSheet ? const _ScaleValueWidget.text(textValue: 'High') : _ScaleValueWidget(value: maxRange),
            const Spacer(
              flex: 20,
            )
          ],
        )
      ],
    );
  }
}

class _ScaleValueWidget extends StatelessWidget {
  const _ScaleValueWidget({required this.value}) : textValue = '', _isText = false;
  const _ScaleValueWidget.text({required this.textValue}) : value = double.infinity, _isText = true;
  final double value;
  final String textValue;
  final bool _isText;
  @override
  Widget build(BuildContext context) {
    String label = '';
    Color labelColor;
    if(_isText){
      label = textValue;
      labelColor = AppColors.textHint;
    }
    else{
      label = value.isFinite ? '$value' : '';
      labelColor = value.isInfinite ? Colors.transparent : AppColors.textHint;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 16.h,
          width: 1.7.w,
          color: labelColor,
        ),
        Text(
          label,
          style: AppStyles.text11.andWeight(FontWeight.w400).andColor(labelColor),
        )
      ],
    );
  }
}
