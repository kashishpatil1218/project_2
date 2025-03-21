

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cancelButton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xff2E435B)),
      ),
      child: Center(
        child: Text(
          "Cancle",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Color(0xff2E435B),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}



Widget doneButton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Color(0xff2E435B),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "Done",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}