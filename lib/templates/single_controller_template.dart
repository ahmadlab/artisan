import 'package:get/get.dart';

class SingleController extends GetxController {
  var isLoading = false.obs;
  RxList<String> theAvengers = RxList<String>();

  getData() async {
    isLoading.value = true;
    isLoading.value = true;
    Future.delayed(const Duration(milliseconds: 2000), () {
      theAvengers.add('Captain America');
      theAvengers.add('Spiderman');
      theAvengers.add("Thor");
      isLoading.value = false;
    });
  }
}
