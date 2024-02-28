import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:longevity_ai_questionnaire/globals.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_colors.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_icons.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_styles.dart';
import 'package:lottie/lottie.dart';

class InitialView extends StatelessWidget{
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    bool verInfo = false;
    if(EnvironmentVariables.version.toLowerCase().compareTo('stage') == 0){
      verInfo = true;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 290.r,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  245.sbWidthFromRadius,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'New User Questionnaire',
                                style: AppStyles.text32.andWeight(FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        12.sbHeight,
                        RichText(
                          text: TextSpan(
                            text: 'Powered by ',
                            style: AppStyles.text16.andColor(AppColors.textHint),
                            children: [
                              TextSpan(
                                text: 'Longevity AI',
                                style: AppStyles.text16,
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            UnconstrainedBox(
              child: Container(
                child: Lottie.asset(
                  AppIcons.animationHeart,
                  width: 290.r,
                  height: 290.r,
                ),
              ),
            ),
          ],
        ),
        //60.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 674.w
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(color: AppColors.borderElements)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppIcons.imageInfo,
                            width: 32.w,
                            height: 32.h,
                          ),
                          8.sbWidth,
                          Text(
                            verInfo ? 'About this Questionnaire:$kAppVersion' :
                            'About this Questionnaire',
                            style: AppStyles.text20.andWeight(FontWeight.w600),
                          ),
                        ],
                      ),
                      13.sbHeight,
                      Text(
                        'Please note that we take data privacy very seriously and do not share any information without explicit consent. Our platform is GDPR and HIPAA compliant, ensuring the confidentiality and security of all sensitive data.',
                        style: AppStyles.text16.andColor(AppColors.textHint),
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        )
      ],
    );
  }

}