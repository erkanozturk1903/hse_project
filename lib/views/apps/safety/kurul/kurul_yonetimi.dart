import 'package:hse_project/controllers/starter_controller.dart';
import 'package:hse_project/helpers/theme/app_style.dart';
import 'package:hse_project/helpers/utils/mixins/ui_mixin.dart';
import 'package:hse_project/helpers/widgets/my_breadcrumb.dart';
import 'package:hse_project/helpers/widgets/my_breadcrumb_item.dart';
import 'package:hse_project/helpers/widgets/my_spacing.dart';
import 'package:hse_project/helpers/widgets/my_text.dart';
import 'package:hse_project/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class KurulYonetimiPage extends StatefulWidget {
  const KurulYonetimiPage({super.key});

  @override
  KurulYonetimiPageState createState() =>KurulYonetimiPageState();
}

class KurulYonetimiPageState extends State<KurulYonetimiPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late StarterController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(StarterController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetBuilder<StarterController>(
            init: controller,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.x(flexSpacing),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText.titleMedium(
                          "Kurul Yönetimi",
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(name: 'Kurul Yönetimi', active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
