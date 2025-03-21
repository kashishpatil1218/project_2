import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


// var appBar =  AppBar(
//   backgroundColor: Colors.white,
//   leading: Padding(
//     padding: EdgeInsets.all(8.0.r),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Color(0xff2E435B),
//         shape: BoxShape.circle,
//       ),
//       child: Image.asset('asset/img/menu.png'),
//     ),
//   ),
//   centerTitle: true,
//   title: Text(
//     'Medium',
//     style: GoogleFonts.poppins(
//       textStyle: TextStyle(
//         fontSize: 18.sp,
//         color: Color(0xff2E435B),
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// );


AppBar appBarr({required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2E435B),
          shape: BoxShape.circle,
        ),
        child: Image.asset('asset/img/menu.png'),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 18.sp,
          color: Color(0xff2E435B),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}