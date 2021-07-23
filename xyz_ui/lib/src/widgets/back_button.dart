import 'package:flutter/material.dart';

Widget backButton(model) {
  return Align(
    alignment: Alignment.centerLeft,
    child: IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: model.goBack,
    ),
  );
}
