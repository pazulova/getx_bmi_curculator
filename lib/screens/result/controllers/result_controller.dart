import 'package:get/get.dart';
import 'package:getx_bmi_curculator/repositorys/calculation_repo.dart';



class ResultController extends GetxController {

   // ignore: unused_field
  //  final HomeController _homeControllet = HomeController.findHomeController;
@override
  void onInit() {
    super.onInit();
  }

 
  String getResult() {
    return calculationRepo.getResult();
  }

  String getResultNumber() {
    return calculationRepo.getResultNumber();
  }

  String getInterpretation() {
    return calculationRepo.getInterpretation();
  }

 
}