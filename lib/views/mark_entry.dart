import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_2/views/components/app_bar_component.dart';
import 'package:project_2/views/components/cancle_button_done_button.dart';


class MarksEntryScreen extends StatefulWidget {
  const MarksEntryScreen({super.key});

  @override
  _MarksEntryScreenState createState() => _MarksEntryScreenState();
}

class _MarksEntryScreenState extends State<MarksEntryScreen> {
  List<Map<String, dynamic>> students = [
    {"name": "name", "marks": "20"},
  ];

  void _addNewRow() {
    setState(() {
      students.add({"name": "", "marks": ""});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:appBarr(title: 'Marks Entry'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Table(
                border: TableBorder.all(color: Colors.grey.shade300),
                columnWidths: const {
                  0: FixedColumnWidth(40),
                  1: FlexColumnWidth(),
                  2: FixedColumnWidth(80),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xff9747ff)),
                    children: const [
                      TableCell(child: SizedBox()),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Round Test -1", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TableCell(child: SizedBox()),
                    ],
                  ),
                  ...students.asMap().entries.map((entry) {
                    int index = entry.key + 1;
                    var student = entry.value;
                    return TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(index.toString()),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(border: InputBorder.none),
                              controller: TextEditingController(text: student["name"]),
                              onChanged: (value) => student["name"] = value,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(border: InputBorder.none),
                              controller: TextEditingController(text: student["marks"]),
                              onChanged: (value) => student["marks"] = value,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
             SizedBox(height: 300.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: Color(0xff2e435b),
                  onPressed: _addNewRow,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(width: 20),
                doneButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
