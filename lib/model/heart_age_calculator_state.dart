import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:longevity_ai_questionnaire/domain/enums.dart';
import 'package:longevity_ai_questionnaire/domain/patient_details.dart';

part 'heart_age_calculator_state.freezed.dart';
enum HeartAgeStep{
  beginning,
  age,
  sex,
  smoke,
  cholesterol,
  hdl,
  pressure,
  medication,
  diabetes,
  a,
  b,
  c,
  d,
  e,
}

@freezed
class HeartAgeCalculatorState with _$HeartAgeCalculatorState{
  const factory HeartAgeCalculatorState({
    required HeartAgeStep current,
    required HeartAgeStep maxStep,
    int? age,
    bool? isMale,
    bool? smoke,
    double? cholesterol,
    double? hdl,
    int? pressure,
    bool? medication,
    bool? diabetes,
    double? result
  }) = _HeartAgeCalculatorState;

  const HeartAgeCalculatorState._();
  static HeartAgeCalculatorState getInitial(){
    return const HeartAgeCalculatorState(
      current: HeartAgeStep.beginning,
      maxStep: HeartAgeStep.beginning,
    );
  }
  static const int minAge = 18;
  static const int maxAge = 150;
  static const int maxCholesterol = 270;
  static const int maxHdl = 100;
  static const int maxPressure = 250;
}

extension HeartAgeCalculatorStateX on HeartAgeCalculatorState{
  PatientDetails toPatientDetails(){
    return PatientDetails(
      age: age == null || age! < 18 ? 18 : age! < 150 ? age! : 150,
      gender: isMale != null && isMale! ? Gender.male : Gender.female,
      smoke: smoke ?? true,
      cholesterol: cholesterol == null || cholesterol! <= 0 ? 0.1 : cholesterol! < 270 ? cholesterol! : 270,
      hdl: hdl == null || hdl! <= 0 ? 0.1 : hdl! < 100 ? hdl! : 100,
      pressure: pressure == null || pressure! <= 0 ? 1 : pressure! < 250 ? pressure! : 250,
      medication: medication ?? true,
      diabetes: diabetes ?? true
    );
  }
}