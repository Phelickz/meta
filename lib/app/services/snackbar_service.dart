// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:one_context/one_context.dart';
import '../utils/theme.dart';
// import 'package:toasty_snackbar/toasty_snackbar.dart';

@lazySingleton
class SnackBarService {
  void showSnackBar(String message) {
    // context.sh
    OneContext.instance.showSnackBar(
      builder: (context) => SnackBar(
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 5),
        content: Text(
          message,
          style: CustomThemeData.generateStyle(
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
