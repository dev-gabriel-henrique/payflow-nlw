class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.stopScanner = false,
    this.error = '',
    this.barcode = '',
  });

  factory BarcodeScannerStatus.available() => BarcodeScannerStatus(isCameraAvailable: true, stopScanner: false);

  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(error: message, stopScanner: true);

  factory BarcodeScannerStatus.barcode(String message) => BarcodeScannerStatus(barcode: message, stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
