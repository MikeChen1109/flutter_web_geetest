import 'package:flutter/material.dart';
import 'package:js_integration/web_geetest_service/geetest_config.dart';
import 'package:js_integration/web_geetest_service/js_helper.dart';

abstract class GeetestService {
  void showCaptcha({
    required VoidCallback onReady,
    required VoidCallback onSuccess,
    required void Function(Object reason) onFail,
    required void Function(Object error) onError,
  });
}

class GeetestServiceImpl implements GeetestService {
  final JSHelper _jsHelper;
  final GetestConfig _config;

  GeetestServiceImpl({
    required JSHelper jsHelper,
    required GetestConfig config,
  })  : _jsHelper = jsHelper,
        _config = config;

  @override
  void showCaptcha({
    required VoidCallback onReady,
    required VoidCallback onSuccess,
    required void Function(Object reason) onFail,
    required void Function(Object error) onError,
  }) {
    _jsHelper.geetestValidate(_config, onReady, onSuccess, onFail, onError);
  }
}
