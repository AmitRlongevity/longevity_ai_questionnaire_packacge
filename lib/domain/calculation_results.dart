import 'package:longevity_ai_questionnaire/domain/enums.dart';

class CalculationResults{
  double risk;
  double heartAge;
  DangerLevel dangerLevel;
  CalculationResults({
    required this.risk,
    required this.heartAge,
    required this.dangerLevel
  });
}