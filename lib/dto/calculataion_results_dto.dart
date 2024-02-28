import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:longevity_ai_questionnaire/domain/calculation_results.dart';
import 'package:longevity_ai_questionnaire/domain/enums.dart';
part 'calculataion_results_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CalculationResultsDto{
  double? heartRisk;
  double? heartAge;
  String? dangerLevel;
  CalculationResultsDto({
    this.heartRisk,
    this.heartAge,
    this.dangerLevel
  });

  factory CalculationResultsDto.fromJson(Map<String, dynamic> json) =>
      _$CalculationResultsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CalculationResultsDtoToJson(this);
}

extension CalculationResultsDtoX on CalculationResultsDto{
  CalculationResults toDomain(){
    DangerLevel dangerLevel = DangerLevel.high;
    if(this.dangerLevel == 'low'){
      dangerLevel = DangerLevel.low;
    } else if(this.dangerLevel == 'moderate'){
      dangerLevel = DangerLevel.moderate;
    }
    return CalculationResults(
      risk: heartRisk ?? 0,
      heartAge: heartAge ?? 0,
      dangerLevel: dangerLevel
    );
  }
}