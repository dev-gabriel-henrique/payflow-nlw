import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InputTextWidget({
    super.key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
                controller: controller,
                onChanged: onChanged,
                initialValue: initialValue,
                validator: validator,
                style: TextStyles.input,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    labelText: label,
                    labelStyle: TextStyles.input,
                    border: InputBorder.none,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Icon(
                            icon,
                            color: Appcolors.primary,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 48,
                          color: Appcolors.stroke,
                        ),
                      ],
                    ))),
            const Divider(
              height: 1,
              thickness: 1,
              color: Appcolors.stroke,
            )
          ],
        ),
      ),
    );
  }
}
