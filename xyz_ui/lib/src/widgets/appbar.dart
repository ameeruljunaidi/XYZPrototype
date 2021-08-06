// Default appbar
import 'package:flutter/material.dart';
import 'package:xyz_ui/xyz_ui.dart';

AppBar defaultAppbar(
  context,
  model, {
  appBarColor = Colors.transparent,
  iconColor = Colors.black,
  cancelButton,
  actions,
}) {
  return AppBar(
    backgroundColor: appBarColor,
    bottomOpacity: 0.0,
    elevation: 0.0,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: iconColor, //change your color here
    ),
    leading: cancelButton != null
        ? IconButton(
            onPressed: cancelButton,
            icon: Icon(Icons.cancel),
          )
        : null,
    actions: actions,
  );
}

SliverAppBar defaultAppBarSliver({
  required cancelButton,
  backgroundColor = kcPrimaryColor,
  backIcon = const Icon(Icons.cancel),
  actions,
}) {
  return SliverAppBar(
    floating: true,
    pinned: true,
    leading: IconButton(
      onPressed: cancelButton,
      icon: backIcon,
    ),
    actions: actions,
    backgroundColor: backgroundColor,
  );
}
