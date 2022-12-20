import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:toure_app/const/AppColor.dart';
import 'package:toure_app/ui/route/route.dart';
import 'package:toure_app/ui/widget/appButton/AppButton.dart';

class Privacy_Policy extends StatelessWidget {
  PdfViewerController? _dfViewerController;
  RxBool _loaded=false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.only(
                top: 10.r, bottom: 10.r, left: 30.r, right: 30.r),
            child: Column(
              children: [
                Expanded(
                  child: SfPdfViewer.network(
                    'https://firebasestorage.googleapis.com/v0/b/it-s-a-practice-project.appspot.com/o/privacy-policy-Tour%20App%2FAdobe%20Pdf2%20for%20App.pdf?alt=media&token=fc8f76c6-7a82-4cba-87a1-c646e3c0ede0',
                  onDocumentLoaded: (PdfDocumentLoadedDetails details){
                    _loaded.value=true;
                  },
                  ),
                ),
                Obx(()=>_loaded==true?VioletButton("Agree", ()=>Get.toNamed(main_homeScreen),
                ):Text('Still Loading')
                ),
                SizedBox(height: 10.h,)
              ],
            )),
      ),
    );
  }
}
