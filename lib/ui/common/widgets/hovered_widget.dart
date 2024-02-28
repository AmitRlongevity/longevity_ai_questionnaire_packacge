import 'package:flutter/material.dart';

class HoveredWidget extends StatelessWidget{
  final Color? hoverColor;
  final Widget? child;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool isEnabled;
  const HoveredWidget({
    super.key,
    this.child,
    this.onTap,
    this.hoverColor,
    this.borderRadius,
    this.backgroundColor = Colors.transparent,
    this.isEnabled = true
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: backgroundColor,
      child: InkWell(
        mouseCursor: isEnabled && onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        borderRadius: borderRadius,
        onTap: isEnabled ? onTap : null,
        hoverColor: isEnabled ? hoverColor : Colors.transparent,
        child: child,
      ),
    );
  }

}