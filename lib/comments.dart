// child: ListWheelScrollView(
//   itemExtent: 350,
//   diameterRatio: 1,
//   children: img.map((e) {
//     return InkWell(
//       onTap: () {
//         print(e);
//       },
//       child: Container(
//         child: Image(
//           image: AssetImage(e),
//         ),
//       ),
//     );
//   }).toList(),
// ),

/* +++ PDF CODING +++ */

// import 'dart:io' show Platform;
// import 'dart:io';
// import 'package:printing/printing.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'package:downloads_path_provider/downloads_path_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
/* -------------------------------------------------------------------------*/
// String path;
// final pdf = pw.Document();
//
// writeOnPdf(index) async {
//   //  final Uint8List fontData =
//   //   File('${widget.fontFamily}.ttf').readAsBytesSync();
//   // final ttf = pw.Font.ttf(fontData.buffer.asByteData());
//   final PdfImage assetImage = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image: AssetImage('assets/c/$index.jpg'),
//   );
//   pdf.addPage(pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Stack(
//             children: [
//               pw.Image(assetImage),
//               pw.Positioned(
//                 top: 140,
//                 left: 130,
//                 child: pw.Text(
//                   widget.name,
//                   style: pw.TextStyle(
//                     fontSize: widget.fontSize.toDouble(),
//                     color: PdfColors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }));
// }
/* -------------------------------------------------------------------------*/
// Future savePdf(String name, id) async {
//   Directory _appDocDir = Platform.isAndroid
//       ? await DownloadsPathProvider.downloadsDirectory
//       : await getApplicationDocumentsDirectory();
//   // final Directory _appDocDirFolder =
//   //     Directory('${_appDocDir.path}/DSC_PdfCertificate/');
//   String appDocDirPath = _appDocDir.path;
//
//   File file = File("$appDocDirPath/$name-$id.pdf");
//   file.writeAsBytesSync(pdf.save());
//   setState(() {
//     path = file.path;
//   });
//   print('');
//   // if (await _appDocDirFolder.exists()) {
//   //   File file = File("$_appDocDirFolder/$name-$id.pdf");
//   //   file.writeAsBytesSync(pdf.save());
//   //   return _appDocDirFolder.path;
//   // } else {
//   //   final Directory _appDocDirNewFolder =
//   //       await _appDocDirFolder.create(recursive: true);
//   //   File file = File("$_appDocDirFolder/$name-$id.pdf");
//   //   file.writeAsBytesSync(pdf.save());
//   //   return _appDocDirNewFolder.path;
//   // }
// }
/* -------------------------------------------------------------------------*/
// handleSaveAsPDF(String name, id, index) async {
//   await writeOnPdf(index);
//   await savePdf(name, id);
// }
/* -------------------------------------------------------------------------*/

// class PdfPreviewScreen extends StatelessWidget {
//   final String path;
//
//   PdfPreviewScreen({this.path});
//
//   @override
//   Widget build(BuildContext context) {
//     return PDFViewerScaffold(
//       path: path,
//     );
//   }
// }
/* -------------------------------------------------------------------------*/
// Alert(
// context: context,
// type: AlertType.warning,
// title: "Choose Format",
// desc: "PNG or PDF",
// buttons: [
// DialogButton(
// child: Text(
// "PNG",
// style: TextStyle(color: Colors.white, fontSize: 20),
// ),
// onPressed: () async {
//
// },
// color: Color.fromRGBO(0, 179, 134, 1.0),
// ),
// DialogButton(
// child: Text(
// "PDF",
// style: TextStyle(color: Colors.white, fontSize: 20),
// ),
// onPressed: () async {
// await handleSaveAsPDF(widget.name, id, widget.index);
// Get.to(PdfPreviewScreen(
// path: path,
// ));
// },
// gradient: LinearGradient(colors: [
// Color.fromRGBO(116, 116, 191, 1.0),
// Color.fromRGBO(52, 138, 199, 1.0)
// ]),
// )
// ],
// ).show();
