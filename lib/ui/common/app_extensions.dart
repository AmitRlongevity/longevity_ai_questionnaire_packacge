import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:longevity_ai_questionnaire/globals.dart';
import 'package:longevity_ai_questionnaire/ui/router/root_router.dart';

final _su = ScreenUtil();

bool isAdopt() {
  final context = AppRouter.navigatorKey.currentContext;
  if(context == null){
    return false;
  }
  final contextSize = MediaQuery.of(context).size;
  // if(contextSize.width > designSize.width || contextSize.height > designSize.height){
  //   return false;
  // }
  // return true;
  if(contextSize.width < designSize.width){
    return true;
  }
  return false;
}

extension NumX on num {
  ///To the radial dimension
  double get r => isAdopt() ? _su.radius(this) : toDouble();

  ///To shrift points
  double get sp =>  isAdopt() ? _su.setSp(this) : toDouble();

  ///To width
  double get w => isAdopt() ? _su.setWidth(this) : toDouble();

  ///To width in device pixels
  double get w0 => toDouble();

  ///To height
  double get h => isAdopt() ? _su.setHeight(this) : toDouble();

  ///To height in device pixels
  double get h0 => toDouble();

  SizedBox get sbHeight =>
      SizedBox(height: isAdopt() ? _su.setHeight(this) : toDouble());

  SizedBox get sbHeightFromWidth =>
      SizedBox(height: isAdopt() ? _su.setWidth(this) : toDouble());

  /// This is the same as from minimal coefficient
  SizedBox get sbHeightFromRadius =>
      SizedBox(height: isAdopt() ? _su.radius(this) : toDouble());

  SizedBox get sbHeight0 => SizedBox(height: toDouble());

  SizedBox get sbWidth =>
      SizedBox(width: isAdopt() ? _su.setWidth(this) : toDouble());
  Container get filledDot =>
    Container(
      width: isAdopt() ? _su.setWidth(this) : toDouble(),
      height: isAdopt() ? _su.setHeight(this) : toDouble(),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE3E3E3)
      ),
    );

  SizedBox get sbWidthFromHeight =>
      SizedBox(width: isAdopt() ? _su.setHeight(this) : toDouble());

  /// This is the same as from minimal coefficient
  SizedBox get sbWidthFromRadius =>
      SizedBox(width: isAdopt() ? _su.radius(this) : toDouble());

  SizedBox get sbWidth0 => SizedBox(width: toDouble());

  EdgeInsets get insetsHor => EdgeInsets.symmetric(horizontal: this * 1.0);

  EdgeInsets get insetsVert => EdgeInsets.symmetric(vertical: this * 1.0);

  EdgeInsets get insetsAll => EdgeInsets.all(this * 1.0);
}

extension StringX on String {
  /// Trim the string if it is longer than the maximum length
  String crop(int maxLength) {
    assert(maxLength > -1, 'Must be positive');
    return length <= maxLength ? this : substring(0, maxLength);
  }

  String safeEnds(int endLength, {String delimiter = '..'}) {
    assert(endLength > -1, 'Must be positive');
    if (endLength == 0) {
      return this;
    }
    if (endLength * 2 >= length) {
      return this;
    }
    final start = substring(0, endLength);
    final end = substring(length - endLength, length);
    return '$start$delimiter$end';
  }

  Size calculateTextSize(TextStyle style, {double minWidth = 0, double maxWidth = double.infinity}) {
    final textSpan = TextSpan(text: this, style: style);
    final tp = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    tp.layout(minWidth: minWidth, maxWidth: maxWidth);
    return tp.size;
  }
}

extension DateTimeX on DateTime {
  int yearsFormNow() {
    final now = DateTime.now();
    if (now.month < month) {
      return now.year - year - 1;
    }
    if (now.month == month && now.day > day) {
      return now.year - year - 1;
    }
    return DateTime.now().year - year;
  }

  String howManyTimeFromNow() {
    final now = DateTime.now();
    final years = now.year - year;
    int months =
    now.year - year == 0 ? now.month - month : now.month + 12 - month;
    if (years == 1) {
      if (months > 12) {
        return '1 Year';
      }
    }
    if (years > 1) {
      return '$years Years';
    }
    final days = DateTime.now().difference(this).inDays;
    if (days > 31) {
      if (months == 1) {
        return '1 Month';
      }
      return '$months Months';
    }
    if (days > 1) {
      return '$days Days';
    }
    return '1 Day';
  }
}
