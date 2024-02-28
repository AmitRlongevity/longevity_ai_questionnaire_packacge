import 'package:flutter/material.dart';
import 'package:longevity_ai_questionnaire/ui/common/app_extensions.dart';

class CustomTooltipWidget extends StatefulWidget{
  final Color color;
  final Widget child;
  final double tooltipWidth;
  final String message;
  final TextStyle? messageStyle;
  CustomTooltipWidget({
    required this.child,
    this.tooltipWidth = 120,
    required this.message,
    this.messageStyle,
    this.color = Colors.white
  }) : super(key: GlobalKey());

  @override
  State<CustomTooltipWidget> createState() {
    return _CustomTooltipWidgetState();
  }
}

class _CustomTooltipWidgetState extends State<CustomTooltipWidget>{
  static OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: widget.child,
      onEnter: (event) {
        createOverlay(event.position);
      },
      onExit: (_) => removeOverlay(),
    );
  }

  void createOverlay(Offset position){
    removeOverlay();
    final key = widget.key as GlobalKey;
    final renderBox = key.currentContext?.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);
    double x = position.dx - widget.tooltipWidth / 2 + size.width / 2;
    double y = position.dy + size.height;
    _overlayEntry = OverlayEntry(
        builder: (context){
          return Stack(
            children: [
              Padding(
                padding:EdgeInsets.only(left: x, top: y),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: UnconstrainedBox(
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 9.w,
                          right: 9.w,
                          bottom: 4.h,
                          top: 6.h + 5.h //5 - padding and 5 arrow height
                      ),
                      width: widget.tooltipWidth,
                      decoration: ShapeDecoration(
                        shape: _CustomShapeBorder(arrowHeight: 5.h),
                        color: widget.color,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text(widget.message, style: widget.messageStyle,)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void removeOverlay(){
    if (_overlayEntry != null){
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}

class _CustomShapeBorder extends ShapeBorder{

  final double radius;
  final double arrowHeight;
  final double arrowWidth;
  //ignore: unused_element
  const _CustomShapeBorder({this.radius = 6, this.arrowHeight = 5, this.arrowWidth = 9});
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double width = rect.width;
    return Path()
      ..moveTo(rect.left, rect.top + radius + arrowHeight)//Start point for our border
      ..lineTo(rect.left, rect.top + rect.height - radius)//Left border line
      ..arcToPoint(
          Offset(rect.left + radius, rect.top + rect.height),
          radius: Radius.circular(radius),
          clockwise: false)//Arc to bottom line
      ..lineTo(rect.left + width - radius, rect.top + rect.height)//Bottom border
      ..arcToPoint(
          Offset(rect.left + width, rect.top + rect.height - radius),
          radius: Radius.circular(radius),
          clockwise: false)//Arc to right border
      ..lineTo(rect.left + width, rect.top + radius + arrowHeight)//right border
      ..arcToPoint(
          Offset(rect.left + width - radius, rect.top + arrowHeight),
          radius: Radius.circular(radius),
          clockwise: false)//Arc to top border
      ..lineTo(rect.left + width / 2 + arrowWidth / 2, rect.top + arrowHeight)
      ..lineTo(rect.left + width / 2, rect.top)
      ..lineTo(rect.left + width / 2 - arrowWidth / 2, rect.top + arrowHeight)
      ..lineTo(rect.left + radius, rect.top + arrowHeight)
      ..arcToPoint(
          Offset(rect.left, rect.top + radius + arrowHeight),
          radius: Radius.circular(radius),
          clockwise: false);//Arc to left border
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

}