import 'package:flutter/material.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: Appcolors.stroke,
    );
  }
}
