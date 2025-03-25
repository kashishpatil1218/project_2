
import 'package:flutter/material.dart';
import 'package:project_2/views/medium_sullybus.dart';

import '../views/Home_page.dart';
import '../views/OTP_page.dart';
import '../views/Time_table_page.dart';
import '../views/add_details.dart';
import '../views/add_event.dart';
import '../views/add_exam.dart';
import '../views/assignment_create.dart';
import '../views/attendance.dart';
import '../views/attendance_time.dart';
import '../views/chat_page.dart';
import '../views/create_table.dart';
import '../views/edite.dart';
import '../views/event.dart';
import '../views/exam_details.dart';
import '../views/exams.dart';
import '../views/fees.dart';
import '../views/fees_details.dart';
import '../views/i_phone_13.dart';
import '../views/mark_entry.dart';
import '../views/medium.dart';
import '../views/medium_attendance.dart';
import '../views/medium_exam.dart';
import '../views/medium_fees.dart';
import '../views/medium_students.dart';
import '../views/medium_time_table.dart';
import '../views/paper.dart';
import '../views/question.dart';
import '../views/result.dart';
import '../views/standard_2.dart';
import '../views/standard_3.dart';
import '../views/standerd.dart';
import '../views/student.dart';
import '../views/sulllyabus.dart';
import '../views/teacher.dart';
import '../views/time_table.dart';
import '../views/time_table_edite.dart';

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
  // '/': (context) => EventsScreen(), // 13      Events
  // '/': (context) => PaperScreen(), // 14      PaperScreen
  // '/': (context) => Attendance(), // 15      Attendance
  // '/': (context) => StandardScreen(), // 16      Standard
  // '/': (context) => AssignmentCreate(), // 17      AssignmentCreate
  // '/': (context) => Standard(), // 18      Standard2
  // '/': (context) => Standard3(), // 19      Standard3
  // '/': (context) => Sulllyabus(), // 20      Sulllyabus
  // '/': (context) => TimeTableScreen(), // 21      Time table
  // '/': (context) => Exams(), // 22    Exams
  // '/': (context) => Result(), // 23    result
  // '/': (context) => Fees(), // 24    fees
  // '/': (context) => AddEvent(), // 25    AddEvent
  // '/': (context) => QuestionPage(), // 26    QuestionPage
  // '/': (context) => StudentPage(), // 27    Student
  // '/': (context) => AttendanceTime(), // 28    Attendance Time
  // '/': (context) => TimeTableEdite(), // 29    TimeTableEdite
  // '/': (context) => TimeTablePage(), // 30    TimeTablePage
  // '/': (context) => AddExamScreen(), // 31    Add  Exam
  // '/': (context) => MarksEntryScreen(), // 32   Marks Entry
  // '/': (context) => AddDetailsScreen(), // 3   Add   Details
  // '/': (context) => ExamDetails(), // 34  Exam Details
  // '/': (context) => CreateTableScreen(), // 35   Create  Table
  // '/': (context) => FeesDetailsScreen(), // 36   Fees  Details
  '/': (context) => Edite(), // 37   edite
};