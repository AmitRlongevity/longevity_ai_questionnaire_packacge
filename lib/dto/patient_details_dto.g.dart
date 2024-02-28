// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetailsDto _$PatientDetailsDtoFromJson(Map<String, dynamic> json) =>
    PatientDetailsDto(
      age: json['age'] as int,
      cholesterol: json['cholesterol'] as int,
      diabetes: json['diabetes'] as bool,
      gender: json['gender'] as String,
      hdlCholesterol: json['hdl_cholesterol'] as int,
      medication: json['medication'] as bool,
      smoke: json['smoke'] as bool,
      systolicBloodPressure: json['systolic_blood_pressure'] as int,
    )
      ..steps = json['steps'] as int
      ..hemA1c = (json['hem_a1c'] as num).toDouble();

Map<String, dynamic> _$PatientDetailsDtoToJson(PatientDetailsDto instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'smoke': instance.smoke,
      'cholesterol': instance.cholesterol,
      'hdl_cholesterol': instance.hdlCholesterol,
      'systolic_blood_pressure': instance.systolicBloodPressure,
      'medication': instance.medication,
      'diabetes': instance.diabetes,
      'steps': instance.steps,
      'hem_a1c': instance.hemA1c,
    };
