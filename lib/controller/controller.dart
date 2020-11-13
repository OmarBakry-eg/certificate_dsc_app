import 'package:certificate_dsc_app/model/model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final Rx<DataModel> dataModel = DataModel().obs;

  changeFontFamily(value) {
    dataModel.update((val) {
      val.fontFamily = value;
    });
  }

  changeFontSize(value) {
    dataModel.update((val) {
      val.textFontSize = value;
    });
  }

  changeFontColor(value) {
    dataModel.update((val) {
      val.textColor = value;
    });
  }
}
