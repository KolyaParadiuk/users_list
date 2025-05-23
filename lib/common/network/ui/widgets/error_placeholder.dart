import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:users_list/common/network/ui/topography.dart';
import 'package:users_list/gen/locale_keys.g.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Text(
          LocaleKeys.errorText.tr(),
          style: AppTextStyles.body16Regular,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
