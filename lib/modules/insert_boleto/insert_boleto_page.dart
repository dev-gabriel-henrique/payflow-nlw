import 'package:flutter/material.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';
import 'package:nlw_together/shared/widgets/input_text/input_text_widget.dart';

class InsertBoletoPage extends StatelessWidget {
  const InsertBoletoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      appBar: AppBar(
        leading: const BackButton(
          color: Appcolors.input,
        ),
        backgroundColor: Appcolors.background,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
            child: Text(
              "Preencha os dados do boleto",
              style: TextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
          InputTextWidget(),
        ],
      ),
    );
  }
}
