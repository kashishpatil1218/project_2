
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Monday'),
      body: Column(
        children: [
          // Class title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              '11th Science-A',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2E435B),
                ),
              ),
            ),
          ),

          // Timetable
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: titleOfTable(title: 'Time'),
                          ),
                          Expanded(child: titleOfTable(title: 'Subject')),
                          SizedBox(
                            width: 100,
                            child: titleOfTable(title: 'Teacher'),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF3F4F6),
                    ),

                    // Table rows
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: const [
                          ScheduleRow(
                            time: '09:30 - 10:30',
                            subject: 'Chemistry',
                            teacher: 'Sachin Joshi',
                          ),
                          ScheduleRow(
                            time: '10:30 - 11:30',
                            subject: 'Maths',
                            teacher: 'Jayesh Aher',
                          ),
                          ScheduleRow(
                            time: '11:30 - 12:30',
                            subject: 'Science',
                            teacher: 'Sachin Joshi',
                          ),
                          ScheduleRow(
                            time: '12:30 - 13:30',
                            subject: 'Biology',
                            teacher: '--',
                          ),
                          ScheduleRow(
                            time: '13:30 - 14:30',
                            subject: 'Physics',
                            teacher: 'Cartlyn Joly',
                          ),
                          ScheduleRow(
                            time: '14:30 - 15:30',
                            subject: 'English',
                            teacher: 'Danish Don',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Action buttons
          Padding(
            padding:  EdgeInsets.only(bottom: 300.h,right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(image: AssetImage('asset/img/timeTableEdite.png'),),
                SizedBox(width: 15.w,),
                Image(image: AssetImage('asset/img/TimeTbaleShare.png'),),
                SizedBox(width: 15.w,),
                Image(image: AssetImage('asset/img/TimeTablePdf.png'),),
                SizedBox(width: 15.w,),
                Image(image: AssetImage('asset/img/TimeTableTrash.png'),),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Text titleOfTable({required String title}) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff45586A),
        ),
      ),
    );
  }
}

class ScheduleRow extends StatelessWidget {
  final String time;
  final String subject;
  final String teacher;

  const ScheduleRow({
    Key? key,
    required this.time,
    required this.subject,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration:  BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              time,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffACA9A9),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              subject,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffACA9A9),
                ),)
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              teacher,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffACA9A9),
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
