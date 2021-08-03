import 'package:xyz_ui/src/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:xyz_ui/src/shared/ui_helpers.dart';

class BoxInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final void Function()? trailingTapped;
  final TextAlign textAlign;
  final bool tapOnly;
  final void Function()? onTap;
  final fillColor;
  final keyboardType;
  final maxLines;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defaultBorderRadiusValue),
  );

  BoxInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.textAlign = TextAlign.start,
    this.tapOnly = false,
    this.onTap,
    this.fillColor = kcVeryLightGreyColor,
    this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _decoration = InputDecoration(
      hintText: placeholder,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      filled: true,
      fillColor: fillColor,
      prefixIcon: leading,
      suffixIcon: trailing != null
          ? GestureDetector(
              onTap: trailingTapped,
              child: trailing,
            )
          : null,
      border: circularBorder.copyWith(
        borderSide: BorderSide(color: kcLightGreyColor),
      ),
      errorBorder: circularBorder.copyWith(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: circularBorder.copyWith(
        borderSide: BorderSide(color: kcPrimaryColor),
      ),
      enabledBorder: circularBorder.copyWith(
        borderSide: BorderSide(color: kcLightGreyColor),
      ),
    );

    return Theme(
      /// Overriding the default blue color.
      ///
      /// We can also avoid this by changing the [primarySwatch] in MaterialApp
      data: ThemeData(primaryColor: kcPrimaryColor),
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          enabled: !tapOnly,
          controller: controller,
          textAlign: textAlign,
          style: TextStyle(height: 1),
          obscureText: password,
          decoration: _decoration,
        ),
      ),
    );
  }
}
