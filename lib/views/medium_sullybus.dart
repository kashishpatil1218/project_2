
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class MediumSullybus extends StatefulWidget {
  MediumSullybus({super.key});

  @override
  _MediumSullybusState createState() => _MediumSullybusState();
}

class _MediumSullybusState extends State<MediumSullybus> {
  final List<String> mediums = ["English medium", "Gujarati medium"];
  final TextEditingController _controller = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Medium'),
      body: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: Column(
          children: [
            ...mediums.map(
                  (medium) => Padding(
                padding: EdgeInsets.only(bottom: 12.0.h),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ListTile(
                    title: Text(
                      medium,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xff2E435B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: Color(0xff2E435B),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}