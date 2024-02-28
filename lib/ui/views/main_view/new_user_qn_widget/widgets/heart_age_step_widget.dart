import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:longevity_ai_questionnaire/model/heart_age_calculator_state.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/new_user_qn_widget_controller.dart';
import 'package:longevity_ai_questionnaire/ui/views/main_view/new_user_qn_widget/views/intial_view.dart';

import 'input_question_widget.dart';
import 'option_question_widget.dart';

class HeartAgeStepWidget extends StatelessWidget{

  final HeartAgeStep step;
  final NewUserQnWidgetController controller;
  const HeartAgeStepWidget({super.key, required this.step, required this.controller});

  @override
  Widget build(BuildContext context) {
    final state = controller.getCurrentState();
    switch(step){
      case HeartAgeStep.beginning: {
        return const InitialView();
      }
      case HeartAgeStep.age:{
        if(state.age != null){
          controller.ageController.text = state.age.toString();
        }
        return InputQuestionWidget(
          onEditingComplete: controller.onEditingComplete,
          question: 'How old are you?',
          questionInfo: 'Age is a general indicator for various health risks and conditions.',
          onChange: (str) => controller.updateAge(int.tryParse(str)),
          hint: 'Tap to input. Must be over 18 years old',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textController: controller.ageController,
          maxBorder: HeartAgeCalculatorState.maxAge,
        );
      }
      case HeartAgeStep.sex:{
        return OptionQuestionWidget(
            question: 'What is your sex?',
            questionInfo: 'Sex can influence how certain health metrics are interpreted.',
            stateProvider: controller.stateProvider,
            firstButtonLabel: 'Male',
            secondButtonLabel: 'Female',
            isFirstButtonSelected: controller.isMale,
            isSecondButtonSelected: controller.isFemale,
            onFirstButtonTap: (_) => controller.setMaleSex(true),
            onSecondButtonTap: (_) => controller.setMaleSex(false)
        );
      }
      case HeartAgeStep.smoke:{
        return OptionQuestionWidget(
            question: 'Do you currently smoke?',
            questionInfo: 'Smoking status is a lifestyle factor that can affect general health.',
            stateProvider: controller.stateProvider,
            firstButtonLabel: 'Yes',
            secondButtonLabel: 'No',
            isFirstButtonSelected: controller.isSmoke,
            isSecondButtonSelected: controller.isNoSmoke,
            onFirstButtonTap: (_) => controller.setSmoke(true),
            onSecondButtonTap: (_) => controller.setSmoke(false)
        );
      }
      case HeartAgeStep.cholesterol:{
        if(state.cholesterol != null){
          controller.cholesterolController.text = state.cholesterol.toString();
        }
        return InputQuestionWidget(
          maxBorder: HeartAgeCalculatorState.maxCholesterol,
          onEditingComplete: controller.onEditingComplete,
          question: 'What is your total cholesterol level?',
          questionInfo: 'Total cholesterol is a measure of fats in your blood, important for assessing metabolic health.',
          onChange: (str) => controller.updateCholesterol(double.tryParse(str)),
          hint: 'Normal <200',
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^(\d{1,3})(\.\d{0,2})?'))//Reg exp for numbers like 123.19
          ],
          textController: controller.cholesterolController,
          units: 'mg/dL',
        );
      }
      case HeartAgeStep.hdl:{
        if(state.hdl != null){
          controller.hdlController.text = state.hdl.toString();
        }
        return InputQuestionWidget(
          maxBorder: HeartAgeCalculatorState.maxHdl,
          onEditingComplete: controller.onEditingComplete,
          question: 'What is your HDL cholesterol level?',
          questionInfo: 'HDL cholesterol is known as "good" cholesterol and is a marker of metabolic and cardiovascular health.',
          onChange: (str) => controller.updateHdlLevel(double.tryParse(str)),
          hint: 'Normal >40 and <60',
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^(\d{1,3})(\.\d{0,2})?'))//Reg exp for numbers like 123.19
          ],
          textController: controller.hdlController,
          units: 'mg/dL',
        );
      }
      case HeartAgeStep.pressure:{
        if(state.pressure != null){
          controller.pressureController.text = state.pressure.toString();
        }
        return InputQuestionWidget(
          maxBorder: HeartAgeCalculatorState.maxPressure,
          onEditingComplete: controller.onEditingComplete,
          question: 'What is your systolic blood pressure?',
          questionInfo: 'Systolic blood pressure is a measure of the force your heart uses to pump blood around your body.',
          onChange: (str) => controller.updatePressure(int.tryParse(str)),
          hint: 'Normal <130 ',
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          textController: controller.pressureController,
          units: 'mmHg',
        );
      }
      case HeartAgeStep.medication:{
        return OptionQuestionWidget(
            question: 'Are you currently taking medication for high blood pressure?',
            questionInfo: 'Medication use can influence how other health metrics are interpreted.',
            stateProvider: controller.stateProvider,
            firstButtonLabel: 'Yes',
            secondButtonLabel: 'No',
            isFirstButtonSelected: controller.isUseMedication,
            isSecondButtonSelected: controller.isDoNotUseMedication,
            onFirstButtonTap: (_) => controller.setUseMedication(true),
            onSecondButtonTap: (_) => controller.setUseMedication(false)
        );
      }
      case HeartAgeStep.diabetes:{
        return OptionQuestionWidget(
            question: 'Do you have diabetes?',
            questionInfo: 'Diabetes status is an important factor for assessing metabolic and cardiovascular health.',
            stateProvider: controller.stateProvider,
            firstButtonLabel: 'Yes',
            secondButtonLabel: 'No',
            isFirstButtonSelected: controller.haveDiabetes,
            isSecondButtonSelected: controller.doNotHaveDiabetes,
            onFirstButtonTap: (_) => controller.setDiabetes(true),
            onSecondButtonTap: (_) => controller.setDiabetes(false)
        );
      }
      default: {
        return Container(color: Colors.red,);
      }
    }
  }
}