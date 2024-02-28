import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';

class InputQuestionWidget extends StatelessWidget{
  const InputQuestionWidget({
    super.key,
    this.onChange,
    required this.question,
    required this.questionInfo,
    required this.hint,
    required this.textController,
    required this.onEditingComplete,
    this.inputFormatters = const [],
    this.units,
    this.maxBorder
  });
  final TextEditingController textController;
  final void Function(String str)? onChange;
  final void Function() onEditingComplete;
  final String question;
  final String questionInfo;
  final String hint;
  final List<TextInputFormatter> inputFormatters;
  final String? units;
  final int? maxBorder;

  @override
  Widget build(BuildContext context) {
    if(maxBorder != 0){
      inputFormatters.add(TextInputFormatter.withFunction((oldValue, newValue) {
        int current = int.tryParse(newValue.text) ?? 0;
        if(current <= maxBorder!){
          return newValue;
        }
        return TextEditingValue(
          text: maxBorder!.toString(),
          selection: const TextSelection.collapsed(offset: 3)
        );
      }));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        100.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            25.sbWidth,
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 674.w),
                child: Text(
                  textAlign: TextAlign.center,
                  question,
                  style: AppStyles.text32.andWeight(FontWeight.w600),
                ),
              ),
            ),
            25.sbWidth,
          ],
        ),
        12.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            25.sbWidth,
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 674.w),
                child: Text(
                  textAlign: TextAlign.center,
                  questionInfo,
                  style: AppStyles.text16.andColor(AppColors.textHint),
                ),
              ),
            ),
            25.sbWidth,
          ],
        ),
        80.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            25.sbWidth,
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500.w),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.borderElements, width: 2)
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onEditingComplete: onEditingComplete,
                          autofocus: true,
                          controller: textController,
                          cursorColor: AppColors.plainText,
                          decoration: InputDecoration.collapsed(
                            hintText: hint,
                            hintStyle: AppStyles.text18.andColor(AppColors.textLightGray),
                          ),
                          style: AppStyles.text18,
                          inputFormatters: inputFormatters,
                          keyboardType: TextInputType.number,
                          onChanged: onChange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if(units != null) ... [
              24.sbWidth,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.backgroundLeftBar
                ),
                child: Text(
                  units!,
                  style: AppStyles.text18.andWeight(FontWeight.w500),
                ),
              )
            ],
            25.sbWidth
          ],
        ),
      ],
    );
  }
}