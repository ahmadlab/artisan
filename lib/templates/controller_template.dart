import 'package:artisan/templates/repository_template.dart';
import 'package:get/get.dart';

class ModuleController extends GetxController{
  var isLoading = false.obs;
  RxList<String> theAvengers = RxList<String>();

  getData() async{
    isLoading.value = true;
    var callApi = await ModuleRepository().getData();
    theAvengers.addAll(callApi!);
    isLoading.value = false;
  }
}