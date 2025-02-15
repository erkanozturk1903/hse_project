import 'package:hse_project/app_constant.dart';
import 'package:hse_project/controllers/forms/wizard_controller.dart';
import 'package:hse_project/helpers/extensions/string.dart';
import 'package:hse_project/helpers/theme/app_style.dart';
import 'package:hse_project/helpers/utils/mixins/ui_mixin.dart';
import 'package:hse_project/helpers/widgets/my_breadcrumb.dart';
import 'package:hse_project/helpers/widgets/my_breadcrumb_item.dart';
import 'package:hse_project/helpers/widgets/my_button.dart';
import 'package:hse_project/helpers/widgets/my_container.dart';
import 'package:hse_project/helpers/widgets/my_flex.dart';
import 'package:hse_project/helpers/widgets/my_flex_item.dart';
import 'package:hse_project/helpers/widgets/my_spacing.dart';
import 'package:hse_project/helpers/widgets/my_text.dart';
import 'package:hse_project/helpers/widgets/my_text_style.dart';
import 'package:hse_project/views/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WizardPage extends StatefulWidget {
  const WizardPage({super.key});

  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage>
    with SingleTickerProviderStateMixin, UIMixin {
  late WizardController controller;
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    controller = Get.put(WizardController());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder<WizardController>(
          init: controller,
          builder: (controller) {
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.titleMedium(
                        "wizard".tr(),
                        fontSize: 18,
                        fontWeight: 600,
                      ),
                      MyBreadcrumb(
                        children: [
                          MyBreadcrumbItem(name: 'forms'.tr()),
                          MyBreadcrumbItem(name: 'wizard'.tr(), active: true),
                        ],
                      ),
                    ],
                  ),
                ),
                MySpacing.height(flexSpacing),
                Center(
                  child: GestureDetector(
                    onTap: () => {
                      controller
                          .onChangedValidation(!controller.enableValidation)
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          onChanged: controller.onChangedValidation,
                          value: controller.enableValidation,
                          activeColor: theme.colorScheme.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: getCompactDensity,
                        ),
                        MySpacing.width(16),
                        MyText.labelMedium(
                            "enable_validation".tr().capitalizeWords)
                      ],
                    ),
                  ),
                ),
                MySpacing.height(flexSpacing),
                Padding(
                  padding: MySpacing.x(flexSpacing / 2),
                  child: MyFlex(
                    children: [
                      MyFlexItem(
                          sizes: "lg-6 md-12",
                          child: MyContainer.bordered(
                            clipBehavior: Clip.none,
                            paddingAll: flexSpacing,
                            child: Column(
                              children: [
                                Row(
                                  children: getTabs(),
                                ),
                                MySpacing.height(32),
                                SizedBox(
                                  height: 376,
                                  child: PageView(
                                    pageSnapping: true,
                                    controller: controller.pageController,
                                    onPageChanged: controller.onChangePage,
                                    children: getContents(),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  List<Widget> getContents() {
    step1() {
      return Form(
        key: controller.step1Validator.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "username".tr(),
            ),
            MySpacing.height(8),
            TextFormField(
              validator: controller.step1Validator.getValidation('username'),
              controller: controller.step1Validator.getController('username'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "username".tr(),
                  hintStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  prefixIcon: Icon(
                    LucideIcons.user,
                    size: 16,
                  ),
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            MySpacing.height(16),
            MyText.labelMedium(
              "email_address".tr().capitalizeWords,
            ),
            MySpacing.height(8),
            TextFormField(
              validator: controller.step1Validator.getValidation('email'),
              controller: controller.step1Validator.getController('email'),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  prefixIcon: Icon(
                    LucideIcons.mail,
                    size: 16,
                  ),
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            MySpacing.height(16),
            MyText.labelMedium(
              "password".tr(),
            ),
            MySpacing.height(8),
            TextFormField(
              validator: controller.step1Validator.getValidation('password'),
              controller: controller.step1Validator.getController('password'),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.showPassword,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: MyTextStyle.bodySmall(xMuted: true),
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: focusedInputBorder,
                  prefixIcon: Icon(
                    LucideIcons.lock,
                    size: 16,
                  ),
                  suffixIcon: InkWell(
                    onTap: controller.onChangeShowPassword,
                    child: Icon(
                      controller.showPassword
                          ? LucideIcons.eye
                          : LucideIcons.eyeOff,
                      size: 18,
                    ),
                  ),
                  contentPadding: MySpacing.all(16),
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            MySpacing.height(28),
            Align(
              alignment: Alignment.centerRight,
              child: MyButton.rounded(
                onPressed: () {
                  controller.onNext();
                },
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: contentTheme.primary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    controller.loading
                        ? SizedBox(
                            height: 14,
                            width: 14,
                            child: CircularProgressIndicator(
                              color: colorScheme.onPrimary,
                              strokeWidth: 1.2,
                            ),
                          )
                        : Container(),
                    if (controller.loading) MySpacing.width(16),
                    MyText.bodySmall(
                      'next'.tr(),
                      color: contentTheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    step2() {
      return Form(
        key: controller.step2Validator.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.labelMedium(
                        "first_name".tr().capitalizeWords,
                      ),
                      MySpacing.height(4),
                      TextFormField(
                        validator: controller.step2Validator
                            .getValidation('first_name'),
                        controller: controller.step2Validator
                            .getController('first_name'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: MyTextStyle.bodySmall(xMuted: true),
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: focusedInputBorder,
                          prefixIcon: Icon(
                            LucideIcons.users,
                            size: 20,
                          ),
                          contentPadding: MySpacing.all(16),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ],
                  ),
                ),
                MySpacing.width(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.labelMedium(
                        "last_name".tr().capitalizeWords,
                      ),
                      MySpacing.height(4),
                      TextFormField(
                        validator: controller.step2Validator
                            .getValidation('last_name'),
                        controller: controller.step2Validator
                            .getController('last_name'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: MyTextStyle.bodySmall(xMuted: true),
                          border: outlineInputBorder,
                          enabledBorder: outlineInputBorder,
                          focusedBorder: focusedInputBorder,
                          prefixIcon: Icon(
                            LucideIcons.users,
                            size: 20,
                          ),
                          contentPadding: MySpacing.all(16),
                          isCollapsed: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MySpacing.height(20),
            MyText.labelMedium(
              "phone_number".tr().capitalizeWords,
            ),
            MySpacing.height(4),
            TextFormField(
              validator:
                  controller.step2Validator.getValidation('phone_number'),
              controller:
                  controller.step2Validator.getController('phone_number'),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: MyTextStyle.bodySmall(xMuted: true),
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: focusedInputBorder,
                prefixIcon: Icon(
                  LucideIcons.mail,
                  size: 20,
                ),
                contentPadding: MySpacing.all(16),
                isCollapsed: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            MySpacing.height(20),
            MyText.labelMedium(
              "date_of_birth".tr(),
            ),
            MySpacing.height(4),
            MyButton.outlined(
              onPressed: () {
                controller.pickDateTime();
              },
              borderColor: colorScheme.primary,
              padding: MySpacing.xy(16, 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    LucideIcons.calendarCheck,
                    color: colorScheme.primary,
                    size: 16,
                  ),
                  MySpacing.width(10),
                  MyText.labelMedium(
                      controller.selectedDateTime != null
                          ? "${dateFormatter.format(controller.selectedDateTime!)} ${timeFormatter.format(controller.selectedDateTime!)}"
                          : "select_date_&_time".tr().capitalizeWords,
                      fontWeight: 600,
                      color: colorScheme.primary),
                ],
              ),
            ),
            MySpacing.height(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton.text(
                  onPressed: () {
                    controller.onPrev();
                  },
                  elevation: 0,
                  padding: MySpacing.xy(16, 12),
                  splashColor: contentTheme.secondary.withAlpha(40),
                  child: MyText.bodySmall(
                    'prev'.tr(),
                    color: contentTheme.secondary,
                  ),
                ),
                MySpacing.width(8),
                MyButton.rounded(
                  onPressed: () {
                    controller.onNext();
                  },
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: contentTheme.primary,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      controller.loading
                          ? SizedBox(
                              height: 14,
                              width: 14,
                              child: CircularProgressIndicator(
                                color: colorScheme.onPrimary,
                                strokeWidth: 1.2,
                              ),
                            )
                          : Container(),
                      if (controller.loading) MySpacing.width(16),
                      MyText.bodySmall(
                        'next'.tr(),
                        color: contentTheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    step3() {
      return Column(
        children: [
          Icon(
            LucideIcons.checkCircle,
            size: 44,
            color: contentTheme.primary,
          ),
          MySpacing.height(32),
          MyText("your_registration_process_is_finished".tr()),
          MySpacing.height(32),
          Row(
            children: [
              Checkbox(
                onChanged: controller.onChangedChecked,
                value: controller.checked,
                activeColor: theme.colorScheme.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: getCompactDensity,
              ),
              MySpacing.width(16),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "i_agree_with ".tr(),
                  ),
                  TextSpan(
                      text: "terms_&_conditions".tr(),
                      style: MyTextStyle.bodyMedium(
                          color: contentTheme.success, fontWeight: 600)),
                ], style: MyTextStyle.bodyMedium(fontWeight: 600)),
              )
            ],
          ),
          MySpacing.height(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton.text(
                onPressed: () {
                  controller.onPrev();
                },
                elevation: 0,
                padding: MySpacing.xy(16, 12),
                splashColor: contentTheme.secondary.withAlpha(40),
                child: MyText.bodySmall(
                  'prev'.tr(),
                  color: contentTheme.secondary,
                ),
              ),
              MySpacing.width(8),
              MyButton.rounded(
                onPressed: () {
                  controller.onFinish();
                },
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: contentTheme.primary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    controller.loading
                        ? SizedBox(
                            height: 14,
                            width: 14,
                            child: CircularProgressIndicator(
                              color: colorScheme.onPrimary,
                              strokeWidth: 1.2,
                            ),
                          )
                        : Container(),
                    if (controller.loading) MySpacing.width(16),
                    MyText.bodySmall(
                      'finish'.tr(),
                      color: contentTheme.onPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    return [step1(), step2(), step3()];
  }

  List<Widget> getTabs() {
    return [
      Expanded(
          child: MyContainer(
        padding: MySpacing.y(12),
        onTap: () => controller.changePage(0),
        color: controller.selectedTab == 0
            ? contentTheme.primary.withAlpha(40)
            : null,
        child: MyText.labelMedium("account".tr(),
            textAlign: TextAlign.center,
            fontWeight: controller.selectedTab == 0 ? 700 : 600,
            color: controller.selectedTab == 0 ? contentTheme.primary : null),
      )),
      MySpacing.width(20),
      Expanded(
          child: MyContainer(
        padding: MySpacing.y(12),
        onTap: () => controller.changePage(1),
        color: controller.selectedTab == 1
            ? contentTheme.primary.withAlpha(40)
            : null,
        child: MyText.labelMedium("profile".tr(),
            textAlign: TextAlign.center,
            fontWeight: controller.selectedTab == 1 ? 700 : 600,
            color: controller.selectedTab == 1 ? contentTheme.primary : null),
      )),
      MySpacing.width(20),
      Expanded(
          child: MyContainer(
        padding: MySpacing.y(12),
        onTap: () => controller.changePage(2),
        color: controller.selectedTab == 2
            ? contentTheme.primary.withAlpha(40)
            : null,
        child: MyText.labelMedium("complete".tr(),
            textAlign: TextAlign.center,
            fontWeight: controller.selectedTab == 2 ? 700 : 600,
            color: controller.selectedTab == 2 ? contentTheme.primary : null),
      )),
    ];
  }
}
