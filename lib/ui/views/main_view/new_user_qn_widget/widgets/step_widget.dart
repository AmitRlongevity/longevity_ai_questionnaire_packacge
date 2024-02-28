import 'package:flutter/material.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';


class StepWidget extends StatelessWidget{
  const StepWidget({
    super.key,
    required this.step,
    required this.state,
    this.onTap
  });
  final HeartAgeStep step;
  final HeartAgeCalculatorState state;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final decoration = getQuestionState(
        step: step,
        state: state
    );
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 6.h,
              decoration: BoxDecoration(
                color: decoration.backgroundColor,
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          ),
          8.sbWidth,
        ],
      ),
    );
  }

  QuestionDecoration getQuestionState({
    required HeartAgeCalculatorState state,
    required HeartAgeStep step
  }){
    if(step == state.current){
      return QuestionDecoration(
        backgroundColor: AppColors.backgroundLightGreen
      );
    }
    if(step.index < state.maxStep.index){
      return QuestionDecoration(
        backgroundColor: AppColors.backgroundDarkGreen
      );
    }
    if(step == state.maxStep){
      return QuestionDecoration(
        backgroundColor: AppColors.backgroundGray
      );
    }
    return QuestionDecoration(
      backgroundColor: AppColors.backgroundGray
    );
  }
}

class QuestionDecoration{
  Color backgroundColor;
  QuestionDecoration({ required this.backgroundColor});
}