import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_bmi_curculator/app_enams/enums.dart';
import 'package:getx_bmi_curculator/repositorys/calculation_repo.dart';

class HomeController extends GetxController{
  static final HomeController findHomeController = Get.find<HomeController>();

 Rx<Gender> gender = Gender.UNKNOWN.obs;
  Rx<WeightOrAge> weightOrAge = WeightOrAge.NKNOWN.obs;

  RxDouble  height = 0.0.obs;
  RxInt  weight = 1.obs;
  RxInt  age = 1.obs;


  RxInt count = 1.obs;

  @override
  void onInit() {
    super.onInit();
   _initHomeController();
  }
void _initHomeController() {
   log('_initHomeController');
  height.value = 120;
  weight.value = 45;
  age.value = 16;
}

  @override
  void onClose() {
    super.onClose();
  }


 void decrement(WeightOrAge chosenType) {
    log('decremen');
    if (chosenType == WeightOrAge.WEIGHT) {
     
      weight.value--;
    } else {
      age.value--;
    }

   
       count.value++;
   
  }

   void increment(WeightOrAge chosenType) {
     log('incremen');
    if (chosenType == WeightOrAge.WEIGHT) {
     
      weight.value++;
    } else {
      age.value++;
    }
       count.value++;
   
  }

 void onSliderChange(double val) {
   log('onSliderChange');
   height.value = val;
 }

 void chooseGender(Gender val) {
    log('chooseGender');
    gender.value = val;
  }



  
  void calculateBMI(double height, double weight) {
    calculationRepo.calculateBMI(height, weight);
  }
}