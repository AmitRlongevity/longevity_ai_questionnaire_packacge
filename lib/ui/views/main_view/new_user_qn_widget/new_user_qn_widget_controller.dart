
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:longevity_ai_questionnaire/globals.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';



class NewUserQnWidgetController{
  final carouselController = CarouselController();
  static HeartAgeStateProvider? _stateProvider;
  HeartAgeStateProvider get stateProvider => _stateProvider!;
  NewUserQnWidgetController(){
    _stateProvider ??= HeartAgeStateProvider(
      (ref) {
        debugPrint(
          'NewUserQnWidgetController.NewUserQnWidgetController');
        return HeartAgeStateNotifier(HeartAgeCalculatorState.getInitial());
      }
    );
  }
  final ageController = TextEditingController();
  final cholesterolController = TextEditingController();
  final hdlController = TextEditingController();
  final pressureController = TextEditingController();

  void onNextButton() async{
    var state = appRef.read(stateProvider);
    // if(state.current == HeartAgeStep.diabetes){
    //   redirectToResults();
    //   return;
    // }
    final oldStep = state.current;
    final currentIndex = state.current.index + 1;
    var max = currentIndex;
    if(state.maxStep.index < max){
      max = currentIndex;
    }
    state = state.copyWith(
      current: HeartAgeStep.values[currentIndex],
      maxStep: HeartAgeStep.values[max]
    );
    appRef.read(stateProvider.notifier).setState(state);
    await carouselController.nextPage();
    switch(oldStep){
      case HeartAgeStep.age:{
        if(state.age == null){//It is impossible, but  ...
          break;
        }
        ageController.value = ageController.value.copyWith(text: state.age!.toString());
        break;
      }
      case HeartAgeStep.cholesterol:{
        if(state.cholesterol == null){//It is impossible, but  ...
          break;
        }
        cholesterolController.value = cholesterolController.value.copyWith(
            text: state.cholesterol!.toStringAsFixed(2)
        );
        break;
      }
      case HeartAgeStep.hdl:{
        if(state.hdl == null){//It is impossible, but  ...
          break;
        }
        hdlController.value = hdlController.value.copyWith(
            text: state.hdl!.toStringAsFixed(2)
        );
        break;
      }
      default:{}
    }
  }
  void onBackButton(){
    var state = appRef.read(stateProvider);
    state = state.copyWith(current: HeartAgeStep.values[state.current.index - 1]);
    appRef.read(stateProvider.notifier).setState(state);
    carouselController.previousPage();
  }
  bool isNextAvailable(){
    final state = appRef.read(stateProvider);
    return switch(state.current){
    HeartAgeStep.beginning => true,
    HeartAgeStep.age => state.age != null,
    HeartAgeStep.sex => state.isMale != null,
    HeartAgeStep.smoke => state.smoke != null,
    HeartAgeStep.cholesterol => state.cholesterol != null,
    HeartAgeStep.hdl => state.hdl != null,
    HeartAgeStep.pressure => state.pressure != null,
    HeartAgeStep.medication => state.medication != null,
    HeartAgeStep.diabetes => state.diabetes != null,
    HeartAgeStep.a => false,
    HeartAgeStep.b => false,
    HeartAgeStep.c => false,
    HeartAgeStep.d => false,
    HeartAgeStep.e => false,
    };
  }
  void onStepTap(HeartAgeStep step){
    var state = appRef.read(stateProvider);
    state = state.copyWith(current: step);
    appRef.read(stateProvider.notifier).setState(state);
    carouselController.animateToPage(step.index);
  }

  void updateAge(int? age) {
    if(age != null && age < 18){
      age = null;
    }
    var state = appRef.read(stateProvider);
    state = state.copyWith(age: age);
    appRef.read(stateProvider.notifier).setState(state);
  }

  bool isMale(){
    final state = appRef.read(stateProvider);
    return state.isMale ?? false;
  }

  bool isFemale(){
    final state = appRef.read(stateProvider);
    return state.isMale == null ? false : !state.isMale!;
  }

  void setMaleSex(bool isMale){
    var state = appRef.read(stateProvider);
    state = state.copyWith(isMale: isMale);
    appRef.read(stateProvider.notifier).setState(state);
  }

  bool isSmoke(){
    final state = appRef.read(stateProvider);
    return state.smoke ?? false;
  }

  bool isNoSmoke(){
    final state = appRef.read(stateProvider);
    return state.smoke == null ? false : !state.smoke!;
  }

  void setSmoke(bool isSmoke){
    var state = appRef.read(stateProvider);
    state = state.copyWith(smoke: isSmoke);
    appRef.read(stateProvider.notifier).setState(state);
  }

  void updateCholesterol(double? level){
    var state = appRef.read(stateProvider);
    state = state.copyWith(cholesterol: level);
    appRef.read(stateProvider.notifier).setState(state);
  }

  void updateHdlLevel(double? level){
    var state = appRef.read(stateProvider);
    state = state.copyWith(hdl: level);
    appRef.read(stateProvider.notifier).setState(state);
  }
  void updatePressure(int? pressure){
    var state = appRef.read(stateProvider);
    state = state.copyWith(pressure: pressure);
    appRef.read(stateProvider.notifier).setState(state);
  }

  bool isUseMedication(){
    final state = appRef.read(stateProvider);
    return state.medication ?? false;
  }

  bool isDoNotUseMedication(){
    final state = appRef.read(stateProvider);
    return state.medication == null ? false : !state.medication!;
  }

  void setUseMedication(bool useMedication){
    var state = appRef.read(stateProvider);
    state = state.copyWith(medication: useMedication);
    appRef.read(stateProvider.notifier).setState(state);
  }

  bool haveDiabetes(){
    final state = appRef.read(stateProvider);
    return state.diabetes ?? false;
  }

  bool doNotHaveDiabetes(){
    final state = appRef.read(stateProvider);
    return state.diabetes == null ? false : !state.diabetes!;
  }

  void setDiabetes(bool diabetes){
    var state = appRef.read(stateProvider);
    state = state.copyWith(diabetes: diabetes);
    appRef.read(stateProvider.notifier).setState(state);
  }

  

  // Future<Either<String, CalculationResults?>> calculateResults(PatientDetails details) async {
  //   try{
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: 'test_mail@gmail.com',
  //         password: 'TESTPOSTMAN'
  //     );
  //     final user = credential.user;
  //     if(user == null){
  //       return left('Server error');
  //     }
  //     final token = await user.getIdToken() ?? '';
  //     final builder = DioBuilder();
  //     final res = await builder.client.getFraminghamHeartRisk(token, details.toDto());
  //     final results = res.toDomain();
  //     return right(results);
  //   }
  //   on FirebaseAuthException catch(e){
  //     if(e.toString().contains('auth/user-not-found')){
  //       left('Link error');
  //     }
  //     else if(e.toString().contains('auth/wrong-password')){
  //       left('Link error');
  //     }
  //     else{
  //       debugPrint('AuthBloc._onSignIn exception: ${e.toString()} ${e.code}');
  //     }
  //   }
  //   catch(e){
  //     debugPrint('HeartAgeCalculatorWidgetController.calculateResults ${e.toString()}');
  //   }
  //   return left('');
  //   // double riskScore = 0;
  //   // double heartAge = 0;
  //   // if(details.gender == Gender.female){
  //   //   final sbpWeight = details.medication ? 2.82263 : 2.76157;
  //   //   double weights = 2.3288 * math.log(details.age);
  //   //   weights += 1.20904 * math.log(details.cholesterol);
  //   //   weights -= 0.70833 * math.log(details.hdl);
  //   //   weights += sbpWeight * math.log(details.pressure);
  //   //   weights += (details.smoke ? 0.52873 : 0) + (details.diabetes ? 0.69154 : 0);
  //   //   final weightsWithMean = weights - 26.1931;
  //   //   riskScore = (1 - (math.pow(0.95012, math.exp(weightsWithMean)))).toDouble();
  //   //   heartAge = 1.350 * riskScore * 100 + 40.436;
  //   // }
  //   // else{
  //   //   final sbpWeight = details.medication ? 1.99881 : 1.93303;
  //   //   double weights = 3.06117 * math.log(details.age);
  //   //   weights += 1.12370 * math.log(details.cholesterol);
  //   //   weights -= 0.93263 * math.log(details.hdl);
  //   //   weights += sbpWeight * math.log(details.pressure);
  //   //   weights += (details.smoke ? 0.65451 : 0) + (details.diabetes ? 0.57367 : 0);
  //   //   final weightsWithMean = weights - 23.9802;
  //   //   riskScore = (1 - math.pow(0.88936, math.exp(weightsWithMean))).toDouble();
  //   //   heartAge = 0.754 * riskScore * 100 + 39.984;
  //   // }
  //   // if(heartAge - details.age > 7){
  //   //   heartAge = details.age + 7;
  //   // } else if(details.age - heartAge > 5){
  //   //   heartAge = details.age - 5;
  //   // }
  //   // DangerLevel level = DangerLevel.high;
  //   // if(heartAge - details.age <= 1){
  //   //   level = DangerLevel.low;
  //   // } else if(heartAge - details.age <= 5){
  //   //   level = DangerLevel.moderate;
  //   // }
  //   // return CalculationResults(
  //   //   risk: riskScore * 100,
  //   //   heartAge: heartAge,
  //   //   dangerLevel: level
  //   // );
  // }
  void onEditingComplete(){
      if(isNextAvailable()){
        onNextButton();
      }
  }

  void dispose(){
  }

  int getCurrentStepIndex(){
    debugPrint("appRef ${appRef.read(stateProvider)}");
    final state = appRef.read(stateProvider);
    return state.current.index;
  }
  
  
  HeartAgeCalculatorState getCurrentState(){
    return appRef.read(stateProvider);
  }
}

typedef HeartAgeStateProvider = StateNotifierProvider<HeartAgeStateNotifier, HeartAgeCalculatorState>;

class HeartAgeStateNotifier extends StateNotifier<HeartAgeCalculatorState>{
  HeartAgeStateNotifier(super.state);
  void setState(HeartAgeCalculatorState newState) => state = newState;
}