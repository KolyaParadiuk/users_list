import 'dart:ui';

import 'package:users_list/common/network/ui/gradients.dart';

class AppShaders {
  static final textGradientShager = AppGradients.textGradient.createShader(
    const Rect.fromLTWH(100.0, 0.0, 400.0, 0.0),
  );
}
