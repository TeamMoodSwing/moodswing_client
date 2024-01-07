import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:moodswing_client/presentation/common/widgets/calendar/custom_monthly_calendar.dart';
import 'package:moodswing_client/presentation/common/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: CustomMonthlyCalendar());
  }
}
