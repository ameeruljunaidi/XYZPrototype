// Default draggableBottomSheet
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:xyz_ui/xyz_ui.dart';

// Go back and continue on modal
Widget defaultBackAndContinue(
  context, {
  required goBack,
  goContinue,
  continueButton = true,
  backgroundColor = Colors.white,
}) {
  return Container(
    width: screenWidth(context),
    color: backgroundColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: goBack,
          child: Row(
            children: [
              Icon(Icons.arrow_left),
              Text(
                'Go Back',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (continueButton)
          ElevatedButton(
            onPressed: goContinue,
            child: Text(
              'Continue',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return kcPrimaryColor;
                  else if (states.contains(MaterialState.disabled))
                    return Colors.grey;
                  return kcPrimaryColor; // Use the component's default.
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return kcPrimaryColor;
                  else if (states.contains(MaterialState.disabled))
                    return Colors.white;
                  return Colors.white; // Use the component's default.
                },
              ),
            ),
          ),
      ],
    ),
  );
}

Widget defaultBackAndContinueSliver(context, model,
    {required goBack, goContinue}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(defaultBorderRadiusValue),
          topLeft: Radius.circular(defaultBorderRadiusValue),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          )
        ],
      ),
      padding: EdgeInsets.only(
        bottom: 16.0,
        top: 16.0,
        right: 24.0,
        left: 24.0,
      ),
      child: defaultBackAndContinue(
        context,
        goBack: goBack,
        goContinue: goContinue,
      ),
    ),
  );
}

SliverFillRemaining emptyWhiteSpaceSliver() {
  return SliverFillRemaining(
    fillOverscroll: true,
    hasScrollBody: false,
    child: Container(
      height: double.infinity,
      color: Colors.white,
    ),
  );
}

SliverFillRemaining emptyWhiteSpaceSliverBottom() {
  return SliverFillRemaining(
    fillOverscroll: true,
    hasScrollBody: false,
    child: Container(
      height: 120.0,
      color: Colors.white,
    ),
  );
}

Container getHelpAppBarButton({color = Colors.white}) {
  return Container(
    decoration: BoxDecoration(borderRadius: defaultBorderRadius),
    child: Center(
      child: Padding(
        padding: defaultPaddingHorizontal,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: defaultBorderRadius,
          ),
          child: Text(
            'Get Help',
            style: TextStyle(color: kcPrimaryColor),
          ),
        ),
      ),
    ),
  );
}

Widget headingContentSliver(context, {required heading}) {
  return SliverPersistentHeader(
    delegate: PersistentHeader(
      widget: Container(
        height: double.maxFinite,
        color: kcPrimaryColor,
        padding: defaultPaddingHorizontal,
        child: BoxText.headingTwo(
          heading,
          color: Colors.white,
        ),
      ),
    ),
  );
}

SliverStack mainBodySliver(context, model, {required sliverBodyContent}) {
  return SliverStack(
    children: [
      SliverPositioned.fill(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultBorderRadiusValue),
              topRight: Radius.circular(defaultBorderRadiusValue),
            ),
          ),
        ),
      ),
      sliverBodyContent,
    ],
  );
}

Container defaultSliverScreen(
  context,
  model, {
  required heading,
  required sliverBodyContent,
  required cancelButton,
  required goBack,
  goContinue,
}) {
  return Container(
    color: kcPrimaryColor,
    child: Stack(
      children: [
        CustomScrollView(
          slivers: [
            defaultAppBarSliver(
              cancelButton: cancelButton,
              actions: [
                getHelpAppBarButton(),
              ],
            ),
            headingContentSliver(context, heading: heading),
            mainBodySliver(
              context,
              model,
              sliverBodyContent: sliverBodyContent,
            ),
            emptyWhiteSpaceSliver(),
            emptyWhiteSpaceSliverBottom()
          ],
        ),
        defaultBackAndContinueSliver(
          context,
          model,
          goBack: goBack,
          goContinue: goContinue,
        ),
      ],
    ),
  );
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget? widget;

  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget!;
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
