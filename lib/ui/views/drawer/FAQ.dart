import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:toure_app/const/AppColor.dart';


class FAQ_Screen extends StatelessWidget {
PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;

  faq(data) {
    return SfPdfViewer.network(
      'https://firebasestorage.googleapis.com/v0/b/it-s-a-practice-project.appspot.com/o/FAQ%2Fcovid_faq.pdf?alt=media&token=0c3bfbd6-88cb-4066-8e79-807ddb435253',
      onDocumentLoaded: (PdfDocumentLoadedDetails details) {
        _loaded.value = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("FAQ",selectionColor: AppColor.black,),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("FAQ")
            .doc("00002222")
            .snapshots(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return faq(data);
          }
        },
      ),
    );
  }
}