import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, String>> menuItems = [
    {"title": "Students", "icon": "asset/img/student.png"},
    {"title": "Teachers", "icon": "asset/img/teacher.png"},
    {"title": "Attendance", "icon": "asset/img/attendance.png"},
    {"title": "Syllabus", "icon": "asset/img/sylubs.png"},
    {"title": "Time-Table", "icon": "asset/img/time table.png"},
    {"title": "Home Work", "icon": "asset/img/HomeWork.png"},
    {"title": "Exams", "icon": "asset/img/exam.png"},
    {"title": "Result", "icon": "asset/img/result.png"},
    {"title": "Fees", "icon": "asset/img/fees.png"},
    {"title": "Inbox", "icon": "asset/img/inbox.png"},
    {"title": "Events", "icon": "asset/img/event.png"},
    {"title": "Paper", "icon": "asset/img/paper.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 38.h),
            decoration: BoxDecoration(
              color: Color(0xFF3E4B5B),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffACA9A9),
                          ),
                        ),
                      ),
                      Text(
                        "Michael Smith",
                        style: GoogleFonts.ptSansCaption(
                          textStyle: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(radius: 33.r),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: Text(
              "Academics",
              style: GoogleFonts.pragatiNarrow(
                textStyle: TextStyle(
                  color: Color(0xff45586A),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.r),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.r,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(menuItems[index]["icon"]!, height: 40.h),
                         SizedBox(height: 8.h),
                        Text(
                          menuItems[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff45586A),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
