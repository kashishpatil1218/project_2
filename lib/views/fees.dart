import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';

class Fees extends StatelessWidget {
  Fees({super.key});

  final List<Map<String, String>> teachers = [
    {
      "name": "Ashley",
      "sub": "Roll No : 08",
      "image": "assets/ashley.jpg",
    },
    {"name": "Nick", "subject": "Science Teacher", "image": "assets/nick.jpg"},
    {
      "name": "Arfa Salem",
      "sub": "Roll No : 08",
      "image": "assets/melanie.jpg",
    },
    {
      "name": "Mohammed Bin Safi",
      "sub": "Roll No : 08",
      "image": "assets/samantha.jpg",
    },
    {"name": "Mubark Al-Amri", "sub": "Roll No : 08", "image": "assets/tom.jpg"},
    {
      "name": "Mouza behind",
      "sub": "Roll No : 08",
      "image": "assets/samantha.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Fees'),
      body: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(6.r),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        value: "Standard - 6",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff45586A),
                          ),
                        ),
                        items:
                        ["Standard - 6", "Standard - 7"].map((
                            String value,
                            ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(6.r),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        value: "Division B",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff45586A),
                          ),
                        ),
                        items:
                        ["Division A", "Division B"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Container(
                height: 49.h,
                width: 334.w,
                decoration: BoxDecoration(
                  color: Color(0xff45586A),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Search',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 75.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        title: Text(
                          teachers[index]['name']!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: Color(0xff45586A),
                          ),
                        ),
                        subtitle: Text(
                          "${teachers[index]['sub']}",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffACA9A9),
                          ),
                        ),

                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
