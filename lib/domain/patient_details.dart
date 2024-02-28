import 'package:longevity_ai_questionnaire/dto/patient_details_dto.dart';

import 'enums.dart';

class PatientDetails{
  int age;
  Gender gender;
  bool smoke;
  double cholesterol;
  double hdl;
  int pressure;
  bool medication;
  bool diabetes;
  PatientDetails({
    required this.age,
    required this.gender,
    required this.smoke,
    required this.cholesterol,
    required this.hdl,
    required this.pressure,
    required this.medication,
    required this.diabetes
  });
}

extension PatientDetailsX on PatientDetails{
  PatientDetailsDto toDto(){
    return PatientDetailsDto(
      age: age,
      cholesterol: cholesterol.toInt(),
      diabetes: diabetes,
      gender: gender.toString().toLowerCase(),
      hdlCholesterol: hdl.toInt(),
      medication: medication,
      smoke: smoke,
      systolicBloodPressure: pressure
    );
  }
}