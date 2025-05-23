import 'package:flutter/material.dart';
import 'package:users_list/common/network/ui/assets.dart';

class PageColorBox extends StatelessWidget {
  const PageColorBox({
    this.child,
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.userDetailsBg),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
