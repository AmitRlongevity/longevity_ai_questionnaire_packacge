import 'package:flutter/material.dart';

class AppColors {
  static const plainText = Color(0xFF4B4B4B);
  static const textDarkGreen = Color(0xFF155A5A);
  static const textLightGreen = Color(0xFF2C9393);
  static const textHint = Color(0xFF818181);
  static const textMainGray3 = Color(0xFFB3B3B3);
  static const textWhite = Color(0xFFFFFFFF);
  static const textDisabled = Color(0xFFF2F2F2);
  static const textCopyrights = Color(0xFFA3D8D8);
  static const textLightGray = Color(0xFFE3E3E3);

  static const scaleBackground = Color(0xFFE3E3E3);

  static const iconBack = Color(0xFF2C9393);

  static const backgroundWhite = Color(0xFFFFFFFF);
  static const backgroundMain = Color(0xFFF4FAFC);
  static const backgroundMenu = Color(0xFFF6FFFF);
  static const backgroundLightGreen = Color(0xFFBFE8E8);
  static const backgroundLeftBar = Color(0xFFE0F6F6);
  static const shimmerAnimationColor = Color(0xFFE3E3E3);

  static const backgroundMainHover = Color(0xFFF9F9F9);
  static const backgroundLightGreenHover = Color(0xFFE0F6F6);
  static const backgroundSubmitButtonHover = Color(0xFF207171);

  static const borderDarkGreen = Color(0xFF2C9393);
  static const borderLightGreen = Color(0xFFBFE8E8);
  static const borderElements = Color(0xFFE3E3E3);

  static const backgroundBlack = Color(0xFF000000);
  static const backgroundGreenMedium = Color(0xFF2C9393);
  static const backgroundLightGray = Color(0xFFF2F2F2);
  static const backgroundDotGray = Color(0xFFE3E3E3);
  static const backgroundGray = Color(0xFFF9F9F9);
  static const backgroundDarkGreen = Color(0xFF2C9393);
  static const backgroundLightRed = Color.fromRGBO(255, 119, 119, 0.1);
  static const backgroundOrangeError = Color.fromRGBO(0xFF, 0x9F, 69, 0.1);
  static const backgroundTooltip = Color(0xFF155A5A);
  static const backgroundSubItemHover = Color(0xFFBFE8E8);
  static const backgroundButtonApprove = Color(0xFF155A5A);
  static const backgroundExtraLight = Color(0xFFF6FFFF);
  static const backgroundMainGray = Color(0xFF818181);
  static const checkboxHovered = Color(0xFF4B4B4B);
  static const shimmerAnimationCollor = Color(0xFFE3E3E3);

  static const borderLeftBar = Color(0xFFBFE8E8);
  static const borderMainGray = Color(0xFF818181);

  static const borderRed = Color(0xFFFF7777);
  static const borderGreen = Color(0xFF8BE2A8);
  static const borderOrange = Color(0xFFFF9F69);

  static const scaleGreenColor = Color(0xFF8BE2A8);
  static const scaleLightGreenColor = Color(0xFFE8F9EE);

  static const scaleYellowColor = Color(0xFFFFC700);
  static const scaleLightYellowColor = Color(0xFFFFF4CC);

  static const scaleOrangeColor = Color(0xFFFF9F69);
  static const scaleLightOrangeColor = Color(0xFFFFECE1);

  static const sideButtonSelected = Color(0xFF8BE2A8);
  static const buttonApproveHovered = Color(0xFF1C6F6F);

  static const graphDotPointer = Color(0xFF969696);
  static const graphPredictedTrend = Color(0xFFE3E3E3);
  static const graphGridLines = Color.fromRGBO(0xD8, 0xD8, 0xD8, 0.5);

  static const opacityGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFFFFFFF), Color(0x00FFFFFF)]);

  static Color calculateScaleColor(
      double value, double minRange, double maxRange) {
    if (minRange <= value && value <= maxRange) {
      return scaleGreenColor;
    }
    if (maxRange < value && value <= maxRange * 1.1) {
      return scaleYellowColor;
    }
    if (value < minRange && minRange / 1.1 < value) {
      return scaleYellowColor;
    }
    return scaleOrangeColor;
  }

  static Color calculateScaleColorFromPercentile(int value) {
    if(value <= 10){
      return scaleOrangeColor;
    }
    if(value <= 20){
      return scaleYellowColor;
    }
    if(value <= 80){
      return scaleGreenColor;
    }
    if(value <= 90){
      return scaleYellowColor;
    }
    return scaleOrangeColor;
  }

  static const loginGradient =  RadialGradient(
    center: Alignment.topCenter,
    radius: 3,
    colors:  [
      Color.fromRGBO(0x73, 0xE5, 0xE5, 0.2),
      Color(0x00F6FFFF),
      Color(0xFFFFFFFF)
    ]
  );

  static const loginShadows = <BoxShadow>[
    BoxShadow(
      offset: Offset(0, 4),
      color: Color.fromRGBO(0 , 0, 0, 0.03),
      blurRadius: 51,
      spreadRadius: 0
    ),
    BoxShadow(
        offset: Offset(0, 25),
        color: Color.fromRGBO(0 , 0, 0, 0.05),
        blurRadius: 50,
        spreadRadius: -30
    ),
  ];

  static const scaleShadow = <BoxShadow>[
    BoxShadow(
      offset: Offset(0, 2),
      spreadRadius: 0,
      blurRadius: 4,
      color: Color.fromRGBO(0 , 0, 0, 0.05),
    )
  ];
}
