import 'package:flutter/foundation.dart';
import 'package:js/js.dart';
import 'package:js_integration/web_geetest_service/geetest_config.dart';

@JS()
external _popupValidate(
  GetestConfig config,
  Function onReady,
  Function onSuccess,
  Function(Object reason) onFail,
  Function(Object error) onError,
);

class JSHelper {
  geetestValidate(
    GetestConfig config,
    VoidCallback onReady,
    VoidCallback onSuccess,
    void Function(Object reason) onFail,
    void Function(Object error) onError,
  ) {
    _popupValidate(
      config,
      allowInterop(onReady),
      allowInterop(onSuccess),
      allowInterop(onFail),
      allowInterop(onError),
    );
  }
}
