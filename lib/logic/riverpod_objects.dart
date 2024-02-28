import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longevity_ai_questionnaire/domain/patient_details.dart';
import 'package:longevity_ai_questionnaire/dto/calculataion_results_dto.dart';
import 'package:longevity_ai_questionnaire/globals.dart';
import 'package:longevity_ai_questionnaire/repository/dio_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:longevity_ai_questionnaire/domain/calculation_results.dart';

part 'riverpod_objects.g.dart';

@riverpod
Future <CalculationResults> fetchCalculationResults (FetchCalculationResultsRef ref, PatientDetails details) async{
  //await Future.delayed(Duration(milliseconds: 1000));
  debugPrint('fetchCalculationResults1');
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: EnvironmentVariables.mailUser,
      password: EnvironmentVariables.mailPassword
  );
  debugPrint('fetchCalculationResults2');
  final user = credential.user;
  if(user == null){
    throw Exception('USER IS NULL');
  }
  debugPrint('fetchCalculationResults3');
  final token = await user.getIdToken() ?? '';
  final builder = DioBuilder();
  final res = await builder.client.getFraminghamHeartRisk(token, details.toDto());
  final results = res.toDomain();
  debugPrint('fetchCalculationResults4');
  return results;
}