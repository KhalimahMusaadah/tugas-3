import 'package:flutter/material.dart';
import 'package:tugas3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  var namauser;
  List<Map<String, dynamic>> schedule = [
    {
      "day": "Monday",
      "schedules": [
        {"time": "07:55 AM - 10:35 AM", "class": "Information Security"},
        {"time": "02:50 PM - 04:50 PM", "class": "Entrepreneurship"},
      ]
    },
    {
      "day": "Tuesday",
      "schedules": [
        {"time": "07:00 AM - 09:40 AM", "class": "Enterprise Resources Planing (ERP)"},
        {"time": "09:45 AM - 12:25 PM", "class": "Text Mining"},
      ]
    },
    {
      "day": "Thursday",
      "schedules": [
        {"time": "07:00 AM - 09:40 AM", "class": "Software Quality Assurance and Testing"},
        {"time": "09:45 AM - 12:25 PM", "class": "Data Warehouse"},
        {"time": "01:00 PM - 03:40 PM", "class": "nformation Technology Project Management"},
      ]
    },
    {
      "day": "Friday",
      "schedules": [
        {"time": "07:00 AM - 08:45 AM", "class": "Mobile Programming"},
        {"time": "02:50 PM - 05:45 PM", "class": "Mobile Programming Practicum"},
      ]
    },
  ];

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('Username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Schedule'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Day')),
              DataColumn(label: Text('Time')),
              DataColumn(label: Text('Class')),
            ],
            rows: schedule
                .map(
                  (entry) {
                    return DataRow(
                      cells: [
                        DataCell(Text(entry['day'] ?? '')),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: entry['schedules']
                                .map<Widget>(
                                  (schedule) => Text(schedule['time'] ?? ''),
                                )
                                .toList(),
                          ),
                        ),
                        DataCell(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: entry['schedules']
                                .map<Widget>(
                                  (schedule) => Text(schedule['class'] ?? ''),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    );
                  },
                )
                .toList(),
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
