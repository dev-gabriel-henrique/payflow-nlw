import 'package:flutter/material.dart';
import 'package:nlw_together/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:nlw_together/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:nlw_together/shared/bottom_sheet/bottom_sheet_widget.dart';
import 'package:nlw_together/shared/themes/app_colors.dart';
import 'package:nlw_together/shared/themes/app_text_styles.dart';
import 'package:nlw_together/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCamera();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(
          context,
          "/insert_boleto",
          arguments: controller.status.barcode,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    "Escaneie o código de barras do boleto",
                    style: TextStyles.buttonBackground,
                  ),
                  centerTitle: true,
                  leading: const BackButton(
                    color: Appcolors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black.withValues(alpha: 0.6),
                    )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                        )),
                    Expanded(
                        child: Container(
                      color: Colors.black.withValues(alpha: 0.6),
                    )),
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: "Inserir Código de Barras",
                  primaryOnPressed: () {
                    Navigator.pushReplacementNamed(context, "/insert_boleto");
                  },
                  secondaryLabel: "Adicionar da galeria",
                  secondaryOnPressed: () {},
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  primaryLabel: "Escanear Novamente",
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  },
                  secondaryLabel: "Digitar Código",
                  secondaryOnPressed: () {
                    Navigator.pushReplacementNamed(context, "/insert_boleto");
                  },
                  title: "Não foi possivel identificar um código de barras.",
                  subTitle: "Tente escanear novamente ou digite o código do boleto",
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
