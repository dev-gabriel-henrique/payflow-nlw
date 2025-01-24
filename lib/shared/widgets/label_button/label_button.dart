import 'package:flutter/material.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  const LabelButton({super.key, required this.label, required this.onPressed, this.style});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: style ?? TextStyles.buttonHeading,
      ),
    );
  }
}
