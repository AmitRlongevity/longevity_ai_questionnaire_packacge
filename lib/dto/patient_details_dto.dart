import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_details_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PatientDetailsDto{
  int age;
  String gender;
  bool smoke;
  int cholesterol;
  int hdlCholesterol;
  int systolicBloodPressure;
  bool medication;
  bool diabetes;
  int steps = 0;
  double hemA1c = 0;

  PatientDetailsDto({
    required this.age,
    required this.cholesterol,
    required this.diabetes,
    required this.gender,
    required this.hdlCholesterol,
    required this.medication,
    required this.smoke,
    required this.systolicBloodPressure
  });

  factory PatientDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDetailsDtoToJson(this);
}