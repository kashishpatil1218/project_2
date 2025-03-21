import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class iPhone extends StatelessWidget {
  const iPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('asset/img/Logo.png'),
          height: 238.h,
          width: 238.w,
        ),
      ),
    );
  }
}
