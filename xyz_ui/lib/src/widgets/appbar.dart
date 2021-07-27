// Default appbar
import 'package:flutter/material.dart';

AppBar defaultAppbar(context, model, {actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    bottomOpacity: 0.0,
    elevation: 0.0,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    actions: actions,
  );
}
