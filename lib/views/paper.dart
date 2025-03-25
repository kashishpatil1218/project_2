import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/app_bar_component.dart';

class PaperScreen extends StatefulWidget {
  @override
  _PaperScreenState createState() => _PaperScreenState();
}

class _PaperScreenState extends State<PaperScreen> {
  String selectedStandard = "Standard - 6";
  String selectedDivision = "Division B";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: 'Paper'),
      body: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 12),
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
            SizedBox(height: 12),
            SubjectCard(title: "Social Science"),
            ExpandableSubject(
              title: "Maths",
              chapters: [
                "Chapter 1  Knowing Our Numbers",
                "Chapter 2  Integers",
                "Chapter 3  Playing with Numbers",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String title;

  SubjectCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff45586A),
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 14.sp),
      ),
    );
  }
}

class ExpandableSubject extends StatefulWidget {
  final String title;
  final List<String> chapters;

  ExpandableSubject({required this.title, required this.chapters});

  @override
  _ExpandableSubjectState createState() => _ExpandableSubjectState();
}

class _ExpandableSubjectState extends State<ExpandableSubject> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff45586A),
          ),
        ),
        children:
            widget.chapters
                .map(
                  (chapter) => ListTile(
                    title: Text(
                      chapter,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff45586A),
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.sp),
                  ),
                )
                .toList(),
      ),
    );
  }
}
