// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:hse_project/controllers/starter_controller.dart';
import 'package:hse_project/helpers/extensions/string.dart';
import 'package:hse_project/helpers/theme/app_style.dart';
import 'package:hse_project/helpers/utils/mixins/ui_mixin.dart';
import 'package:hse_project/helpers/utils/my_shadow.dart';
import 'package:hse_project/helpers/widgets/my_breadcrumb.dart';
import 'package:hse_project/helpers/widgets/my_breadcrumb_item.dart';
import 'package:hse_project/helpers/widgets/my_card.dart';
import 'package:hse_project/helpers/widgets/my_container.dart';
import 'package:hse_project/helpers/widgets/my_flex.dart';
import 'package:hse_project/helpers/widgets/my_flex_item.dart';
import 'package:hse_project/helpers/widgets/my_spacing.dart';
import 'package:hse_project/helpers/widgets/my_text.dart';
import 'package:hse_project/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hse_project/views/layouts/left_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WorkSafetyPage extends StatefulWidget {
  const WorkSafetyPage({super.key});

  @override
  WorkSafetyPageState createState() => WorkSafetyPageState();
}

class WorkSafetyPageState extends State<WorkSafetyPage>
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
                          "Work Safety Page",
                          fontSize: 18,
                          fontWeight: 600,
                        ),
                        MyBreadcrumb(
                          children: [
                            MyBreadcrumbItem(name: 'Work Safety', active: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(flexSpacing),
                  Padding(
                    padding: MySpacing.x(flexSpacing),
                    child: MyFlex(
                      wrapAlignment: WrapAlignment.start,
                      wrapCrossAlignment: WrapCrossAlignment.start,
                      children: [
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () => MenuItem(
                              title: "candidates".tr(),
                              route: '/apps/work/kurul',
                              //isCondensed: widget.isCondensed,
                            ),
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Kurul Toplantısı Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.orangeAccent,
                                      child: Icon(
                                        LucideIcons.boxes,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Düzenli Faaliyet Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Düzeltici Faaliyet Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.green,
                                      child: Icon(
                                        LucideIcons.check,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Ramak Kala Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Ramak Kala Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.yellowAccent.shade700,
                                      child: Icon(
                                        LucideIcons.listChecks,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Saha Denetimleri Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Saha Denetimleri Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.pinkAccent.shade700,
                                      child: Icon(
                                        LucideIcons.list,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("KRisk Yönetimi Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Risk Değerlendirmesi Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.lime,
                                      child: Icon(
                                        LucideIcons.alertCircle,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Acil Durum Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Acil Durum Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.red,
                                      child: Icon(
                                        LucideIcons.siren,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Eğitim Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Eğitim Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.purple.shade700,
                                      child: Icon(
                                        LucideIcons.school2,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("İş Kazası Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "İş Kazası Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.tealAccent.shade700,
                                      child: Icon(
                                        LucideIcons.circleEllipsis,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Kişisel koruyucu Donanım Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Kişisel koruyucu Donanım ",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.orange.shade700,
                                      child: Icon(
                                        LucideIcons.hardHat,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Ekipman Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Ekipman Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.brown.shade700,
                                      child: Icon(
                                        LucideIcons.gavel,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Ortam Ölçümleri Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Ortam Ölçümleri Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.blueAccent,
                                      child: Icon(
                                        LucideIcons.thermometerSnowflake,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Yıllık Çalışma Planı");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Yıllık Çalışma Planı",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.yellow.shade700,
                                      child: Icon(
                                        LucideIcons.calendarDays,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("MSDS Formları");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "MSDS Formları",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.deepPurple,
                                      child: Icon(
                                        LucideIcons.library,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "xl-4 lg-6 sm-12",
                          child: InkWell(
                            onTap: () {
                              print("Çalışma İzinleri Yönetimi");
                            },
                            child: MyCard(
                                shadow: MyShadow(
                                    elevation: 0.5,
                                    position: MyShadowPosition.bottom),
                                padding: MySpacing.xy(20, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyText.bodyLarge(
                                          "Çalışma İzinleri Yönetimi",
                                          fontWeight: 600,
                                        ),
                                        MySpacing.height(4),
                                      ],
                                    ),
                                    MyContainer(
                                      color: Colors.greenAccent,
                                      child: Icon(
                                        LucideIcons.checkSquare,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}
