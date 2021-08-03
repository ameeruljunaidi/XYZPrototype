// Defautl bottom modal items
import 'package:flutter/material.dart';
import 'package:xyz_ui/src/shared/ui_helpers.dart';

Future defaultBottomSheet({
  required context,
  required builder,
  isScrollControlled = true,
}) {
  return showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultBorderRadiusValue),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: builder);
}
