import 'package:flutter/material.dart';
import 'package:xyz_ui/xyz_ui.dart';

Widget addGigButton(model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Center(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BoxButton(
          busy: model.isBusy,
          title: 'Confirm Add Gig',
          onTap: () => model.addGig(),
        ),
      ),
    ),
  );
}
