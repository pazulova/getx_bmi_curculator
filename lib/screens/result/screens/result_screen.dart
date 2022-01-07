
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_bmi_curculator/app_constants/app-colors.dart';
import 'package:getx_bmi_curculator/app_constants/app_text_styles.dart';
//mport 'package:getx_bmi_curculator/modules/home/screens/home_screen.dart';
import 'package:getx_bmi_curculator/repositorys/calculation_repo.dart';

import 'package:getx_bmi_curculator/screens/home/screens/home_screen.dart';
import 'package:getx_bmi_curculator/screens/result/controllers/result_controller.dart';

import 'package:getx_bmi_curculator/widgets/circular_button.dart';
import 'package:getx_bmi_curculator/widgets/reusable_widget.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({Key key, this.height, this.weight}) : super(key: key);


 final ResultController  _resultController =
  Get.put<ResultController>(ResultController());
  final double height;
  final double weight;


  // @override
  // void initState() {
  //   super.initState();

  // //  calculationRepo.calculateBMI(widget.height, widget.weight);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'BMI CALCULATOR',
          style: AppTextStyles.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                   const Text(
                      'Your Result',
                      style: AppTextStyles.resultTitle,
                    ),
                    const SizedBox(height: 25.0),
                    ReUsableWidget(
                      bgColor: AppColors.activeIconColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _resultController.getResult(),
                              style: AppTextStyles.resultSubTitle,
                            ),
                            Text(
                            _resultController.getResultNumber(),
                              style: AppTextStyles.resultNumber,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                _resultController.getInterpretation(),
                                style: AppTextStyles.titleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              ),
            ),
            CustomButton(
              child: const Text(
                'RE-CALCULATE',
                style: AppTextStyles.buttonTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false);
              },
              buttonColor: AppColors.buttonColor,
              constraints: BoxConstraints(
                minHeight: 92,
                minWidth: MediaQuery.of(context).size.width,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
