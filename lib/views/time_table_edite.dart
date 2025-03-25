import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class TimeTableEdite extends StatefulWidget {
  const TimeTableEdite({super.key});

  @override
  _TimeTableEditeState createState() => _TimeTableEditeState();
}

class _TimeTableEditeState extends State<TimeTableEdite> {
  final TextEditingController dayController = TextEditingController(
    text: "Monday",
  );
  final TextEditingController teacherController = TextEditingController(
    text: "Ali Al Ghafli",
  );

  String selectedSubject = "Science";
  TimeOfDay? selectedTime;

  final List<String> subjects = ["Science", "Math", "English", "History"];

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Add Details'),
      body: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleMethod(title: "Day"),

            SizedBox(height: 6.h),
            Card(
              color: Colors.white,
              child: TextField(
                controller: dayController,
                readOnly: true,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff070707),
                  ),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 14.h),

            titleMethod(title: 'Subject'),
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSubject,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSubject = newValue!;
                          });
                        },
                        items:
                            subjects.map<DropdownMenuItem<String>>((
                              String value,
                            ) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff070707),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.access_time, color: Colors.grey[800]),
                  onPressed: () => _selectTime(context),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.grey[800]),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 14.h),

            titleMethod(title: 'Teacher Name'),
            SizedBox(height: 4.h),
            Card(
              color: Colors.white,
              child: TextField(
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff070707),
                  ),
                ),
                controller: teacherController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 12.h,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 270.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [cancelButton(), SizedBox(width: 15.w), doneButton()],
            ),
          ],
        ),
      ),
    );
  }

  Text titleMethod({required String title}) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xff2E435B),
        ),
      ),
    );
  }
}
