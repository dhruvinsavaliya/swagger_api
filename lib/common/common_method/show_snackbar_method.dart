import 'package:flutter/material.dart';

ScaffoldFeatureController showSnackBarWidget(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
    ),
  );
}
