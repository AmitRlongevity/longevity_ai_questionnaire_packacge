import 'package:dio/dio.dart' hide Headers;
import 'package:longevity_ai_questionnaire/dto/calculataion_results_dto.dart';
import 'package:longevity_ai_questionnaire/dto/patient_details_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/calculators/framingham_heart_risk')
  Future<CalculationResultsDto> getFraminghamHeartRisk (@Header('authorization') String token, @Body() PatientDetailsDto patientDetailsDto);
}
