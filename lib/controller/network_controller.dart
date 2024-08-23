import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:my_prayers/view/widgets/dialog_utils.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  dynamic _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.first == ConnectivityResult.none) {
      DialogUtils.noNetworkDialog();
    } else {
      Get.back();
    }
  }
}
