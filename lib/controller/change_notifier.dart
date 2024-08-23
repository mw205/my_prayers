import 'package:get/get.dart';

class ChangeNotifierController extends GetxController {
  // RxBool isSelected = false.obs;
  final RxInt _currentIndex = 1.obs;
  set selectItem(int index) {
    _currentIndex.value = index;
  }

  int get currentIndex => _currentIndex.value;
}
