// Horizontal Spacing
import 'package:flutter/material.dart';
import 'package:xyz_ui/src/widgets/box_text.dart';
import 'package:xyz_ui/xyz_ui.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

// Borders
BorderRadius defaultBorderRadius = BorderRadius.circular(16.0);

// Default back button
const IconData defaultBackIcon = Icons.arrow_back;

// Default box with shaodw
BoxDecoration defaultBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: defaultBorderRadius,
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0.0, 2.0),
      blurRadius: 6.0,
    )
  ],
);

// Defautl bottom modal items
Future defaultBottomSheet({context, builder}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: builder);
}

// Default title for textbox
Widget defaultTextBoxTitle(title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: BoxText.body(
      title,
      align: TextAlign.left,
      color: Colors.black,
    ),
  );
}
