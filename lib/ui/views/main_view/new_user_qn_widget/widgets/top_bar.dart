import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/new_user_qn_widget.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/new_user_qn_widget_controller.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/widgets/step_widget.dart';

class TopBar extends ConsumerStatefulWidget{
  final NewUserQnWidgetController controller;
  const TopBar({
    super.key,
    required this.controller
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TopBarState();
  }
}


class _TopBarState extends ConsumerState<TopBar>{

  @override
  Widget build(BuildContext context) {
    int qnSetLength = HeartAgeStep.values.length - 1;
    final state = ref.watch(widget.controller.stateProvider);
    
    return Visibility(
      replacement: 100.sbHeight,
      visible: state.current != HeartAgeStep.beginning,
      child: Container(
        padding: EdgeInsets.only(
            left: 23.w,
            right: 23.w,
            top: 23.h,
            bottom: 24.h
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            qnSetLength,
            (index) {
              return StepWidget(
                state: state,
                step: HeartAgeStep.values[index + 1],
                onTap: () => {},
              );
            }
          ),
        ),
      ),
    );
  }
}


