import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';

class AttendanceTime extends StatefulWidget {
  const AttendanceTime({Key? key}) : super(key: key);

  @override
  State<AttendanceTime> createState() => _AttendanceTimeState();
}

class _AttendanceTimeState extends State<AttendanceTime> {
  int selectedDate = 24;
  Map<String, bool> attendanceStatus = {
    'Ashley': false,
    'Sarah Salmin': false,
    'Afra Salem': false,
    'Mohammed bin Shafi': false,
    'Mubarak Al-Amri': false,
    'Aisha Khalid': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: '11th commerce - B'),
      body: Column(
        children: [
          // App Bar
          Padding(padding: const EdgeInsets.all(16.0)),

          // Date Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  final date = 21 + index;
                  final isSelected = date == selectedDate;
                  final dayLabel = _getDayLabel(date);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      width: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isSelected)
                            Text(
                              dayLabel,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          Text(
                            date.toString(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Student List
          Expanded(
            child: ListView.builder(
              itemCount: attendanceStatus.length,
              itemBuilder: (context, index) {
                final studentName = attendanceStatus.keys.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://i.pravatar.cc/150?img=${index + 10}',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  studentName,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff45586A),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Roll No: 08',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffACA9A9),
                                    ),)
                                ),
                              ],
                            ),
                          ),
                          Checkbox(
                            value: attendanceStatus[studentName],
                            onChanged: (value) {
                              setState(() {
                                attendanceStatus[studentName] = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               cancelButton(),
                 SizedBox(width: 16.w),
                doneButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDayLabel(int date) {
    switch (date) {
      case 21:
        return 'S';
      case 22:
        return 'M';
      case 23:
        return 'T';
      case 24:
        return 'W';
      case 25:
        return 'T';
      case 26:
        return 'F';
      case 27:
        return 'S';
      default:
        return '';
    }
  }
}
