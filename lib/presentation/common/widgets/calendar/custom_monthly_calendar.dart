import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomMonthlyCalendar extends StatelessWidget {
  //const CustomMonthlyCalendar({super.key});
  const CustomMonthlyCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Monthly'),
        ),
        body: TableCalendar(
            firstDay: DateTime.utc(1900, 1, 1),
            lastDay: DateTime.utc(3000, 12, 31),
            focusedDay: DateTime.now(),
            calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.rectangle)),
            //calendarbuilders 활용 //color값 받으면 됨
            calendarBuilders:
                CalendarBuilders(defaultBuilder: (context, day, bool) {
              if (day.day == 15 || day.day == 16) {
                return Container(color: Colors.blue);
              }
            }

                    // eventLoader: (d) {
                    //   if (d.day.toString() == "13") {
                    //     return [
                    //       const BoxDecoration(
                    //           color: Colors.red, shape: BoxShape.rectangle)
                    //     ];
                    //   }
                    //   return [];
                    // },
                    )));
  }
}
