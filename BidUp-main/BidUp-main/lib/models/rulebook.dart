import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class rulebook extends StatefulWidget {
  const rulebook({Key? key}) : super(key: key);

  @override
  State<rulebook> createState() => _rulebookState();
}

class _rulebookState extends State<rulebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfPdfViewer.asset(
            'Assets/rulebook.pdf'));
  }
}
