
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class MediumStudents extends StatefulWidget {
  MediumStudents({super.key});

  @override
  _MediumStudentsState createState() => _MediumStudentsState();
}

class _MediumStudentsState extends State<MediumStudents> {
  final List<String> mediums = ["English medium", "Gujarati medium"];
  final TextEditingController _controller = TextEditingController();

  void _showAddMediumDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          title: Text(
            "Add Medium",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16.sp,
               color:  Color(0xff2E435B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          content: Card(
            elevation: 2,
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.all(4.r),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "  Enter medium",
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.only(top: 5.h,right: 5.w,left: 10.w),
              child: Row(
               
                children: [
                  cancelButton(),
                  SizedBox(width: 5.w,),
                  doneButton(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }


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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2E435B),
        onPressed: _showAddMediumDialog,
        child: Icon(Icons.add, color: Colors.white, size: 20.sp),
      ),
    );
  }
}