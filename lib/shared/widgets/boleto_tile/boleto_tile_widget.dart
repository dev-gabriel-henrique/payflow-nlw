import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_together/shared/models/boleto_model.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;
  const BoletoTileWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      duration: const Duration(milliseconds: 500),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence em ${data.dueDate}",
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(text: "R\$ ", style: TextStyles.trailingRegular, children: [
          TextSpan(
            text: data.value?.toStringAsFixed(2),
            style: TextStyles.trailingBold,
          )
        ])),
      ),
    );
  }
}
