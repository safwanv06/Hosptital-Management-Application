import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../custom_flushbar/custom_flushbar.dart';
import '../custom_flushbar/model/flushbar_type.dart';

apiErrorHandling(
    {required BuildContext context, required error, String? errorMessage}) {
  if (error is DioException) {
    flushBarNotification(
        context: context,
        message: error.response?.data["message"] ??
            errorMessage ??
            "Something went wrong, please try again.",
        type: FlushBarType.error);
  } else {
    flushBarNotification(
        context: context,
        message: errorMessage ?? "Something went wrong, please try again.",
        type: FlushBarType.error);
  }
}
