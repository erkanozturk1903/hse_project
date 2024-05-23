import 'package:hse_project/controllers/my_controller.dart';
import 'package:hse_project/helpers/widgets/my_text_utils.dart';

class PricingController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
}
