// Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:un1que_new/core/theme/constants.dart';

// Project imports:

class ToastUtil {
  static void error([String? msg]) {
    msg = msg?.trim() ?? '';
    //if (msg.isEmpty || msg.length > 150) msg = kError;

    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 8,
      backgroundColor: ThemeColors.danger,
      textColor: ThemeColors.white,
    );
  }

  static void success(String msg) {
    msg = msg.trim();
    if (msg.isEmpty || msg.length > 150) msg = 'Successful.';

    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 8,
      backgroundColor: ThemeColors.primary,
      textColor: ThemeColors.white,
    );
  }
}
