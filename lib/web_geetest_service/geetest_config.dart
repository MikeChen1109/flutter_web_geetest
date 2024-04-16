import 'package:js/js.dart';

@JS()
@anonymous
class GetestConfig {
  external factory GetestConfig({
    String captchaId,
    String product,
    String language,
  });
  external String get captchaId;
  external String get product;
  external String get language;
}
