import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/views/components/FBA.dart';
import 'package:project_2/views/components/app_bar_component.dart';

class StudentPage extends StatelessWidget {
  StudentPage({super.key});

  final List<Map<String, String>> students = [
    {
      "name": "Ashley",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
    },
    {
      "name": "Sarah Salmin",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
    },
    {
      "name": "Afra Salem",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/women/3.jpg",
    },
    {
      "name": "Mohammed bin Shafi",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/men/4.jpg",
    },
    {
      "name": "Mubarak Al-Amri",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/men/5.jpg",
    },
    {
      "name": "Mouza behind",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/women/6.jpg",
    },
    {
      "name": "Rashid Rashid",
      "roll": "08",
      "image": "https://randomuser.me/api/portraits/men/7.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: '8th - English medium'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return StudentCard(
              name: students[index]["name"]!,
              rollNo: students[index]["roll"]!,
              imageUrl: students[index]["image"]!,
            );
          },
        ),
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }
}

class StudentCard extends StatelessWidget {
  final String name;
  final String rollNo;
  final String imageUrl;

  const StudentCard({
    super.key,
    required this.name,
    required this.rollNo,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            image: DecorationImage(image: NetworkImage(imageUrl)),
          ),
        ),

        title: Text(
          name,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff2E435B),
            ),
          ),
        ),
        subtitle: Text(
          "Roll No : $rollNo",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xffACA9A9),
            ),
          ),
        ),
      ),
    );
  }
}
