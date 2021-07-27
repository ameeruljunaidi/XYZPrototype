// Defautl bottom modal items
import 'package:flutter/material.dart';

Future defaultBottomSheet({
  required context,
  required builder,
  isScrollControlled = true,
}) {
  return showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: builder);
}
