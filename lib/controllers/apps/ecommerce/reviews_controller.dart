import 'package:hse_project/controllers/my_controller.dart';
import 'package:hse_project/helpers/widgets/my_text_utils.dart';
import 'package:hse_project/models/reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsController extends MyController {
  bool liked = false;
  int initialRating = -1;
  List<Review> reviews = [];

  ReviewsController();

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  DateTimeRange? selectedDateTimeRange;

  Future<void> pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
        context: Get.context!,
        initialEntryMode: DatePickerEntryMode.input,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateTimeRange) {
      selectedDateTimeRange = picked;
      update();
    }
  }

  onChangeLike() {
    liked = !liked;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Review.dummyList.then((value) {
      reviews = value;
      update();
    });
  }
}
