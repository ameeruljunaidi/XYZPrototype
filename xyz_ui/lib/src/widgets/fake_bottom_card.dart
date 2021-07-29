// Default draggableBottomSheet
import 'package:flutter/material.dart';
import 'package:xyz_ui/xyz_ui.dart';

// Default modal bar
Widget _defaultModalBar(model, {onPressed}) {
  return Container(
    child: Stack(
      children: [
        if (onPressed != null)
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.close,
              size: 16.0,
            ),
          ),
        Align(
          alignment: Alignment.topCenter,
          child: Icon(Icons.drag_handle),
        ),
      ],
    ),
  );
}

DraggableScrollableSheet _defaultDraggableBottomSheet(context, model,
    {child, initialPercentage, minPercentage}) {
  final _sheetHeight = screenHeightPercentage(context, percentage: 1);
  final _sheetHeighPercentage = _sheetHeight / screenHeight(context);

  return DraggableScrollableSheet(
    initialChildSize: _sheetHeighPercentage * initialPercentage,
    minChildSize: _sheetHeighPercentage * minPercentage,
    maxChildSize: _sheetHeighPercentage,
    builder: (context, scrollController) {
      return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        child: Container(
          height: _sheetHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
            ),
          ),
          child: child,
        ),
      );
    },
  );
}

Widget _defaultFakeCardBodyContent(context, model, {children, goBack}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        _defaultModalBar(model, onPressed: goBack),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: children,
          ),
        ),
      ],
    ),
  );
}

// Default body for fake card
Widget defaultFakeCardBody(
  context,
  model, {
  required initialPercentage,
  required minPercentage,
  required heading,
  required children,
  subheading,
  goBack,
}) {
  return Container(
    color: kcPrimaryColor,
    child: Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxText.headingTwo(
                  heading,
                  color: Colors.white,
                ),
                if (subheading != null) verticalSpaceSmall,
                if (subheading != null)
                  BoxText.body(
                    subheading,
                    color: Colors.white,
                  ),
              ],
            ),
          ),
        ),
        _defaultDraggableBottomSheet(
          context,
          model,
          initialPercentage: initialPercentage,
          minPercentage: minPercentage,
          child: _defaultFakeCardBodyContent(
            context,
            model,
            children: children,
            goBack: goBack,
          ),
        )
      ],
    ),
  );
}

// Go back and continue on modal
Widget defaultBackAndContinue({required goBack, goContinue}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: goBack,
        child: Row(
          children: [
            Icon(Icons.arrow_left),
            BoxText.body('Previous'),
          ],
        ),
      ),
      if (goContinue != null)
        ElevatedButton(
          onPressed: goContinue,
          child: Text('Continue'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kcPrimaryColor),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
    ],
  );
}
