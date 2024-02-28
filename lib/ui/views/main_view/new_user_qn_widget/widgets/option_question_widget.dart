import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';
import 'package:longevity_ai_questionnaire/ui/common/widgets/hovered_widget.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/new_user_qn_widget_controller.dart';

class OptionQuestionWidget extends ConsumerWidget{
  final String question;
  final String questionInfo;
  final HeartAgeStateProvider stateProvider;
  final String firstButtonLabel;
  final String secondButtonLabel;
  final bool Function() isFirstButtonSelected;
  final bool Function() isSecondButtonSelected;
  final void Function(HeartAgeCalculatorState) onFirstButtonTap;
  final void Function(HeartAgeCalculatorState) onSecondButtonTap;
  const OptionQuestionWidget({
    super.key,
    required this.question,
    required this.questionInfo,
    required this.stateProvider,
    required this.firstButtonLabel,
    required this.secondButtonLabel,
    required this.isFirstButtonSelected,
    required this.isSecondButtonSelected,
    required this.onFirstButtonTap,
    required this.onSecondButtonTap
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        100.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            63.sbWidth,
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                question,
                style: AppStyles.text32.andWeight(FontWeight.w600),
              ),
            ),
            63.sbWidth,
          ],
        ),
        12.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            63.sbWidth,
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                questionInfo,
                style: AppStyles.text16.andColor(AppColors.textHint),
              ),
            ),
            63.sbWidth,
          ],
        ),
        80.sbHeight,
        Row(
          children: [
            63.sbWidth,
            Expanded(
                child: HoveredWidget(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () => onFirstButtonTap(state),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: isFirstButtonSelected() ?
                            AppColors.borderDarkGreen : AppColors.borderElements,
                            width: 2
                        ),
                        color: isFirstButtonSelected() ?
                        AppColors.backgroundMenu : null
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Center(
                        child: Text(
                          firstButtonLabel,
                          style: AppStyles.text18.andWeight(FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
            ),
            24.sbWidth,
            Expanded(
                child: HoveredWidget(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () => onSecondButtonTap(state),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: isSecondButtonSelected() ?
                            AppColors.borderDarkGreen : AppColors.borderElements,
                            width: 2
                        ),
                        color: isSecondButtonSelected() ?
                        AppColors.backgroundMenu : null
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Center(
                        child: Text(
                          secondButtonLabel,
                          style: AppStyles.text18.andWeight(FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
            ),
            63.sbWidth,
          ],
        )
      ],
    );
  }
}