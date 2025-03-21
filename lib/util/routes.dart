
import 'package:flutter/material.dart';
import 'package:project_2/views/medium_sullybus.dart';

import '../views/Home_page.dart';
import '../views/OTP_page.dart';
import '../views/assignment_create.dart';
import '../views/attendance.dart';
import '../views/chat_page.dart';
import '../views/event.dart';
import '../views/i_phone_13.dart';
import '../views/medium.dart';
import '../views/medium_attendance.dart';
import '../views/medium_exam.dart';
import '../views/medium_fees.dart';
import '../views/medium_students.dart';
import '../views/medium_time_table.dart';
import '../views/paper.dart';
import '../views/standard_2.dart';
import '../views/standard_3.dart';
import '../views/standerd.dart';
import '../views/sulllyabus.dart';

Map<String, Widget Function(BuildContext)> routes={

  // '/': (context) => iPhone(), // 1       iPhone 13 mini 1
  // '/': (context) => OtpPage(), // 2       OTP
  // '/': (context) => HomePage(), // 3       Homepage
  // '/': (context) => MediumStudents(), // 4       MediumStudents
  // '/': (context) => Teacher(), // 5       teacher
  // '/': (context) => MediumAttendance(), // 6       MediumAttendance
  // '/': (context) => MediumSullybus(), // 7       MediumSullybus
  // '/': (context) => MediumTimeTable(), // 8       MediumTimeTable
  // '/': (context) => ChatPage(), // 9       ChatPage
  // '/': (context) => MediumExam(), // 10      MediumExam
  // '/': (context) => Medium(), // 11      Medium
  // '/': (context) => MediumFees(), // 12      MediumFees
  // '/': (context) => EventsScreen(), // 13      EventsScreen
  // '/': (context) => PaperScreen(), // 14      PaperScreen
  // '/': (context) => Attendance(), // 15      Attendance
  // '/': (context) => StandardScreen(), // 16      Standard
  // '/': (context) => AssignmentCreate(), // 17      AssignmentCreate
  // '/': (context) => Standard(), // 18      Standard2
  // '/': (context) => Standard3(), // 19      Standard3
  '/': (context) => Sulllyabus(), // 20      Sulllyabus
};