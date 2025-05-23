import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:users_list/common/network/ui/colors.dart';

class AppTextStyles {
  static final TextStyle title34Semibold = GoogleFonts.poppins(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.white,
  );

  static final TextStyle title26Regular = GoogleFonts.poppins(
    fontSize: 26,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final TextStyle subtitle18Semibold = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final TextStyle body16Regular = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static final TextStyle body14Regular = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static final TextStyle body12Regular = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}

extension TextStyleX on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}
