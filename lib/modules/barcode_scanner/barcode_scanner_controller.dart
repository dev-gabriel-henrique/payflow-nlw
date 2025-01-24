import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nlw_together/modules/barcode_scanner/barcode_scanner_status.dart';

class BarcodeScannerController {
  final statusNotifier = ValueNotifier<BarcodeScannerStatus>(BarcodeScannerStatus());

  BarcodeScannerStatus get status => statusNotifier.value;
  set status(BarcodeScannerStatus status) => statusNotifier.value = status;

  final barcodeScanner = BarcodeScanner();

  CameraController? cameraController;

  void getAvailableCamera() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );

      cameraController = CameraController(
        camera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();

      scanWithCamera();
      listenCamera();
    } catch (error) {
      status = BarcodeScannerStatus.error(error.toString());
    }
  }

  void scanWithCamera() {
    status = BarcodeScannerStatus.available();
    Future.delayed(const Duration(seconds: 20)).then((value) {
      if (status.hasBarcode == false) {
        status = BarcodeScannerStatus.error("Timeout de leitura do boleto");
      }
    });
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      String? barcode;

      for (Barcode item in barcodes) {
        barcode = item.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeScannerStatus.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
      }
      return;
    } catch (e) {
      debugPrint("ERRO DE LEITURA ${e.toString()}");
    }
  }

  void scanWithImagePicker() async {
    final response = await ImagePicker().pickImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
  }

  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false) {
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
              cameraImage.width.toDouble(),
              cameraImage.height.toDouble(),
            );
            const InputImageRotation imageRotation = InputImageRotation.rotation0deg;
            const InputImageFormat inputImageFormat = InputImageFormat.nv21;

            final planeData = cameraImage.planes.first;

            final inputImageData = InputImageMetadata(
              size: imageSize,
              rotation: imageRotation,
              format: inputImageFormat,
              bytesPerRow: planeData.bytesPerRow,
            );

            final inputImage = InputImage.fromBytes(bytes: bytes, metadata: inputImageData);

            scannerBarCode(inputImage);
          } catch (e) {
            debugPrint(e.toString());
          }
        }
      });
    }
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
