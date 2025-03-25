import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/FBA.dart';
import 'package:project_2/views/components/app_bar_component.dart';

class TimeTableScreen extends StatefulWidget {
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  String? selectedStandard;
  String? selectedDivision;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Time Table'),
      body: Padding(
        padding:  EdgeInsets.all(14.0.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.all(4.r),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        value: selectedStandard,
                        items: [
                          DropdownMenuItem(
                            value: "11 sci",
                            child: Text(
                              "Standard - 11 sci",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff45568A),
                                ),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedStandard = value as String?;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.all(4.r),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        value: selectedDivision,
                        items: [
                          DropdownMenuItem(
                            child: Text("Division B",  style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff45568A),
                              ),
                            ),),
                            value: "B",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedDivision = value as String?;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
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
            SizedBox(height: 16.h),
            Expanded(
              child: Card(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(days[index],  style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff45568A),
                          ),
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios,size: 12.sp,),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }
}
