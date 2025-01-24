import 'package:flutter/material.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            decoration: const InputDecoration(
          border: InputBorder.none,
        )),
        const Divider(
          height: 1,
          thickness: 1,
          color: Appcolors.stroke,
        )
      ],
    );
  }
}
