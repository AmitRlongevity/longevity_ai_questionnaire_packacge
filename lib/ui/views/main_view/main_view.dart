import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_icons.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/new_user_qn_widget.dart';


@RoutePage()
class MainView extends StatelessWidget{
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width >= 600.w0;
    final bool isHigh = size.height >= 900.h0 && isDesktop;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundWhite,
      body: Container(
        color: AppColors.backgroundWhite,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isDesktop ? isHigh ? 129.sbHeight : 25.sbHeight : 0.sbHeight,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding:  isDesktop ? EdgeInsets.symmetric(horizontal: 26.w) : null,
                            child: NewUserQnWidget(isDesktop: isDesktop,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  !isHigh ? isDesktop ? 25.sbHeight : 0.sbHeight :
                  SizedBox(
                    height: 129.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        26.sbWidth,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Powered by',
                              style: AppStyles.text16.andColor(AppColors.textLightGreen),
                            ),
                            6.sbWidth,
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.imageLoginLogo,
                                  width: 42.r,
                                  height: 42.r,
                                ),
                                12.sbWidth,
                                Text(
                                  'LongevityAI',
                                  style: AppStyles.text24.andWeight(FontWeight.w600).andColor(AppColors.textDarkGreen),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}