

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;
  final String timeRange;
  final String location;
  final Color color;

  Event({
    required this.title,
    required this.timeRange,
    required this.location,
    required this.color,
  });
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  final DateTime _initialDay = DateTime(2021, 3, 13);

  final Map<DateTime, List<Event>> _events = {
    DateTime(2021, 3, 13): [
      Event(
        title: 'Outdoor Education Day',
        timeRange: '8:00 AM to 4:00 PM',
        location: 'Abc Nagar Jivan jyoti Dindoli Surat',
        color: Colors.amber,
      ),
    ],
    DateTime(2021, 3, 25): [
      Event(
        title: 'Cricket Match Tournament',
        timeRange: '8:00 AM to 10:00 PM',
        location: 'Ashok Nagar Ground Dindoli Surat',
        color: Colors.green,
      ),
      Event(
        title: 'Football Match Tournament',
        timeRange: '8:00 AM to 10:30 PM',
        location: '12520 Jivan jyoti Dindoli Surat',
        color: Colors.red,
      ),
    ],
  };

  @override
  void initState() {
    super.initState();
    _focusedDay = _initialDay;
    _selectedDay = _initialDay;
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:appBarr(title: "Events"),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
            child: _buildCalendar(),
          ),
           SizedBox(height: 18.h),
          Expanded(
            child: _buildEventsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:Color(0xff2E435B),
        child:  Icon(Icons.add,color: Colors.white,),
      ),
    );
  }

  Widget _buildCalendar() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding:  EdgeInsets.all(4.0.r),
        child: TableCalendar(
          firstDay: DateTime.utc(2021, 1, 1),
          lastDay: DateTime.utc(2021, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle:  GoogleFonts.poppins(textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),),
            leftChevronIcon:  Icon(Icons.chevron_left, size: 20.sp),
            rightChevronIcon:  Icon(Icons.chevron_right, size: 20.sp),
            headerPadding:  EdgeInsets.symmetric(vertical: 8.0.h),
            titleTextFormatter: (date, locale) {
              return 'March 2021';
            },
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          calendarStyle: CalendarStyle(
            outsideDaysVisible: true,
            defaultTextStyle: const TextStyle(color: Colors.black),
            weekendTextStyle: const TextStyle(color: Colors.black),
            selectedDecoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            markersMaxCount: 3,
            markersAlignment: Alignment.bottomCenter,
          ),
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              final text = DateFormat.E().format(day);
              return Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black54),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEventsList() {
    final selectedEvents = _getEventsForDay(_selectedDay);

    if (selectedEvents.isEmpty) {
      // Show all events if no events for selected day
      List<Widget> allEventWidgets = [];

      // Add date headers and events
      _events.forEach((date, events) {
        final dateWidget = _buildDateWidget(date);
        final eventWidgets = events.map((event) => _buildEventCard(event)).toList();

        allEventWidgets.add(dateWidget);
        allEventWidgets.addAll(eventWidgets);
      });

      return ListView(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        children: allEventWidgets,
      );
    } else {
      // Show events for selected day
      return ListView(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        children: [
          _buildDateWidget(_selectedDay),
          ...selectedEvents.map((event) => _buildEventCard(event)).toList(),
        ],
      );
    }
  }

  Widget _buildDateWidget(DateTime date) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 4.h, top: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date.day.toString(),
            style:  GoogleFonts.poppins(textStyle: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff45586A),
            ),)
          ),
           SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('MMMM').format(date),
                style: GoogleFonts.poppins(textStyle: TextStyle(
                  fontSize: 13.sp,
                  color: Color(0xff45586A),
                ),)
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Card(
      margin:  EdgeInsets.only(bottom: 12.0.h, left: 8.0.w),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: event.color, width: 1.w),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border(
            left: BorderSide(color: event.color, width: 6.w),
          ),
        ),
        padding:  EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style:  GoogleFonts.poppins(textStyle: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff45586A),
                fontWeight:FontWeight.w700,
              ),)
            ),
             SizedBox(height: 8.h),
            Text(
              event.timeRange,
              style: GoogleFonts.poppins(textStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffACA9A9),
              ),)
            ),
             SizedBox(height: 4.h),
            Text(
              event.location,
              style:GoogleFonts.poppins(textStyle:  TextStyle(
                fontSize: 13.sp,
                color: Color(0xff259C1D),
              ),)
            ),
          ],
        ),
      ),
    );
  }
}

