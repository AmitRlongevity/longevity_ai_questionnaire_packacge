import 'package:flutter/material.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/widgets/bottom_bar.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/widgets/heart_age_step_widget.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/widgets/top_bar.dart';

import 'new_user_qn_widget_controller.dart';


class NewUserQnWidget extends StatefulWidget{
  const NewUserQnWidget({super.key, required this.isDesktop});
  final bool isDesktop;

  @override
  State createState() {
    return _NewUserQnWidgetState();
  }

}

class _NewUserQnWidgetState extends State<NewUserQnWidget>{
  final controller = NewUserQnWidgetController();
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if(constraints.hasInfiniteWidth || constraints.hasInfiniteHeight){
          return Container();
        }
        double width = constraints.maxWidth;
        if(width > 800.w){
          width = 800.w;
        }
        else if(width < 427.w){
          width = 427.w;
        }
        return UnconstrainedBox(
          child: Container(
            width: width,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              borderRadius: !widget.isDesktop ? null : BorderRadius.circular(10.r),
              border: !widget.isDesktop ? null : Border.all(
                  color: AppColors.borderElements,
                  width: 2
              ),
              color: AppColors.backgroundWhite
            ),
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(10.r),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: CarouselSlider.builder(
                                carouselController: controller.carouselController,
                                disableGesture: true,
                                options: CarouselOptions(
                                  height: constraints.maxHeight,
                                  scrollPhysics: const NeverScrollableScrollPhysics(),
                                  autoPlay: false,
                                  scrollDirection: Axis.horizontal,
                                  viewportFraction: 1,
                                  initialPage: controller.getCurrentStepIndex(),
                                ),
                                itemCount: HeartAgeStep.values.length - 1,
                                itemBuilder: (_, index, __){
                                  return HeartAgeStepWidget(
                                    step: HeartAgeStep.values[index],
                                    controller: controller,
                                  );
                                },
                              )
                            ),
                          ],
                        ),
                        TopBar( controller: controller,),
                      ],
                    ),
                  ),
                  BottomBar(controller: controller,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

