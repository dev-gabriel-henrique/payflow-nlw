import 'package:flutter/material.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';
import 'package:nlw_together/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subTitle;
  const BottomSheetWidget(
      {super.key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: SafeArea(
        child: Material(
          child: Container(
            color: Appcolors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(text: "\n$subTitle", style: TextStyles.buttonHeading),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Appcolors.stroke,
                    ),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPressed: secondaryOnPressed,
                    ),
                    const SizedBox(
                      height: 2,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
