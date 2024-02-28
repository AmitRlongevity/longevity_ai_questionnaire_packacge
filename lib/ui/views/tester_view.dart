import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TesterView extends StatelessWidget{
  const TesterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, color: Colors.red,);
  }

}