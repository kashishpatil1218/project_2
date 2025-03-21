import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';

import 'components/FBA.dart';

class StandardController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}

class Standard3 extends StatelessWidget {
  final StandardController controller = Get.put(StandardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarr(title: 'Standard'),
      body: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Column(
          children: [
            _buildCard('Pre-Primary'),
            _buildCard('Primary'),
            _buildCard('Secondary'),
            Obx(
                  () => Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Higher Secondary',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Color(0xff45586A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          controller.isExpanded.value
                              ? Icons.remove
                              : Icons.add,
                          color: Colors.black,
                        ),
                        onPressed: controller.toggleExpansion,
                      ),
                    ),
                    if (controller.isExpanded.value) ...[
                      Divider(),
                      _buildSubItem('11th commerce'),
                      _buildSubItem('12th commerce'),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }



  Widget _buildCard(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0.h),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListTile(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: Color(0xff45586A),
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
            color: Colors.black,
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildSubItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Stander',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff45586A),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff45586A),
            ),
          ),
        ],
      ),
    );
  }
}
