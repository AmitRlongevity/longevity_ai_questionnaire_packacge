import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/new_user_qn_widget_controller.dart';

import 'button_back.dart';
import 'button_next.dart';

class BottomBar extends ConsumerStatefulWidget{
  final NewUserQnWidgetController controller;
  const BottomBar({super.key, required this.controller});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BottomBarState();
  }

}

class _BottomBarState extends ConsumerState<BottomBar>{
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.controller.stateProvider);
    return Row(
      children: [
        Expanded(
            child: Container(
                padding: EdgeInsets.only(
                    left: 23.w,
                    right: 23.w,
                    top: 24.h,
                    bottom: 23.h
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: AppColors.borderElements
                        )
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: state.current != HeartAgeStep.beginning,
                        child: ButtonBack(
                            onTap: widget.controller.onBackButton
                        )
                    ),
                    Visibility(
                        visible: state.current != HeartAgeStep.a,
                        child: ButtonNext(
                            onTap: widget.controller.isNextAvailable() ?
                            widget.controller.onNextButton : null,
                            isStart: state.current == HeartAgeStep.beginning,
                        )
                    )
                  ],
                )
            )
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}