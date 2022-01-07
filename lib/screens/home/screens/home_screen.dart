import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:getx_bmi_curculator/app_constants/app-colors.dart';
import 'package:getx_bmi_curculator/app_constants/app_text_styles.dart';
import 'package:getx_bmi_curculator/app_enams/enums.dart';

import 'package:getx_bmi_curculator/screens/home/controllers/home_controller.dart';
import 'package:getx_bmi_curculator/screens/result/screens/result_screen.dart';
//import 'package:getx_bmi_curculator/screens/result/screens/result_screen.dart';
import 'package:getx_bmi_curculator/widgets/circular_button.dart';
import 'package:getx_bmi_curculator/widgets/icon_widget.dart';
import 'package:getx_bmi_curculator/widgets/reusable_widget.dart';
import 'package:getx_bmi_curculator/widgets/weight_heigth_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  HomeController controller = Get.put<HomeController>(HomeController());

  // HomeConrtoller controller = HomeConrtoller();

  @override
  Widget build(BuildContext context) {
    log('build _count ====>> ${controller.count.value}');
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15.0),
                      Expanded(
                        child: Row(
                          children: [
                            Obx(() => ReUsableWidget(
                                  onTap: () =>
                                      controller.chooseGender(Gender.MALE),
                                  bgColor:
                                      controller.gender.value == Gender.MALE
                                          ? AppColors.activeIconColor
                                          : AppColors.inActiveIconColor,
                                  child: const IconWidget(
                                    icon: FontAwesomeIcons.mars,
                                    text: 'MALE',
                                    allPaddingSize: 12.0,
                                  ),
                                )),
                                const SizedBox(width: 15.0),
                            Obx(() => ReUsableWidget(
                                  onTap: () =>
                                      controller.chooseGender(Gender.FEMALE),
                                  bgColor:
                                      controller.gender.value == Gender.FEMALE
                                          ? AppColors.activeIconColor
                                          : AppColors.inActiveIconColor,
                                  child: const IconWidget(
                                    icon: FontAwesomeIcons.venus,
                                    text: 'FEMALE',
                                    allPaddingSize: 12.0,
                                  ),
                                )),
                            const SizedBox(width: 15.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Obx(() => ReUsableWidget(
                            onTap: null,
                            bgColor: AppColors.activeIconColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'HEIGHT',
                                  style: AppTextStyles.titleTextStyle,
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      controller.height.value
                                          .round()
                                          .toString(),
                                      style: AppTextStyles.numberTextStyle,
                                    ),
                                    const SizedBox(width: 5.0),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      'cm',
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12.0),
                                SliderTheme(
                                  data: const SliderThemeData(
                                    trackHeight: 2.0,
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                    thumbColor: Colors.red,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 18.0),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 30.0),
                                    overlayColor: Color(0x29EB1555),
                                  ),
                                  child: Obx(() => Slider(
                                        value: controller.height.value,
                                        min: 10,
                                        max: 240,
                                        onChanged: (double ozgorgonSan) {
                                          controller
                                              .onSliderChange(ozgorgonSan);
                                        },
                                      )),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 15.0),
                      Expanded(
                        child: Row(
                          children: [
                            Obx(() => ReUsableWidget(
                                  onTap: null,
                                  bgColor: AppColors.activeIconColor,
                                  child: WeightHeightWidget(
                                    title: 'WEIGHT',
                                    weight: controller.weight.value.toString(),
                                    increment: () => controller
                                        .increment(WeightOrAge.WEIGHT),
                                    decrement: () => controller
                                        .decrement(WeightOrAge.WEIGHT),
                                  ),
                                )),
                            const SizedBox(width: 15.0),
                            Obx(() => ReUsableWidget(
                                  onTap: null,
                                  bgColor: AppColors.activeIconColor,
                                  child: WeightHeightWidget(
                                    title: 'AGE',
                                    age: controller.age.value.toString(),
                                    increment: () =>
                                        controller.increment(WeightOrAge.AGE),
                                    decrement: () =>
                                        controller.decrement(WeightOrAge.AGE),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ),
              CustomButton(
                child: const Text(
                  'CALCULATE',
                  style: AppTextStyles.buttonTextStyle,
                ),
                onTap: () {
                  controller.calculateBMI(
                    controller.height.value, controller.weight.value.toDouble());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                height: controller.height.value,
                                weight: controller.weight.value.toDouble(),
                              )));
                },
                buttonColor: AppColors.buttonColor,
                constraints: BoxConstraints(
                  minHeight: 82,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // chooseGender(Gender chosenGender) {
  //   setState(() {
  //      _count++;
  //     controller.gender.value = chosenGender;
  //   });
  // }
}
