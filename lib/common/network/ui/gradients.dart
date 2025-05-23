import 'package:flutter/material.dart';
import 'package:users_list/common/network/ui/colors.dart';

class AppGradients {
  static const LinearGradient textGradient = LinearGradient(
    colors: <Color>[
      AppColors.white,
      AppColors.titleGradientPink,
    ],
  );

  static const LinearGradient borderGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.borderGradientYellow,
      AppColors.borderGradientPink,
    ],
  );

  static final LinearGradient bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.bgGradient1,
      AppColors.bgGradient2.withValues(alpha: 0.0),
    ],
  );
}
