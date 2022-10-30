// ignore_for_file: file_names

import 'dart:developer';
import 'dart:io';
import 'package:amina_ex/authorization/ui/pages/profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool flash = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Attendance QR",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          actions: <Widget>[
            Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 15,
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: _buildQrView(context),
            ),
            if (result != null)
              Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
            else
              const Text(
                '',
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    padding: const EdgeInsets.only(left: 30),
                    icon: Icon(
                      flash ? Icons.flash_on : Icons.flash_off,
                      color: Colors.yellow,
                      size: 27,
                    ),
                    onPressed: () {
                      setState(() {
                        flash = !flash;
                      });
                    }),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 30),
                  icon: const Icon(
                    Icons.camera,
                    size: 50,
                  ),
                  onPressed: () async {
                    await controller?.pauseCamera();
                  },
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 30),
                  icon: const Icon(
                    Icons.check_circle_outline,
                    size: 27,
                  ),
                  onPressed: () async {
                    await controller?.resumeCamera();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color.fromARGB(255, 10, 75, 60),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
