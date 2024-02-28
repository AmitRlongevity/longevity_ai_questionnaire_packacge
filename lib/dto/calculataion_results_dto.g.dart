// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculataion_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculationResultsDto _$CalculationResultsDtoFromJson(
        Map<String, dynamic> json) =>
    CalculationResultsDto(
      heartRisk: (json['heart_risk'] as num?)?.toDouble(),
      heartAge: (json['heart_age'] as num?)?.toDouble(),
      dangerLevel: json['danger_level'] as String?,
    );

Map<String, dynamic> _$CalculationResultsDtoToJson(
        CalculationResultsDto instance) =>
    <String, dynamic>{
      'heart_risk': instance.heartRisk,
      'heart_age': instance.heartAge,
      'danger_level': instance.dangerLevel,
    };
