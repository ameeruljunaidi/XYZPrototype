import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:xyz_prototype/ui/calendar/data_selection_viewmodel.dart';

class DateSelectionView extends StatelessWidget {
  const DateSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DateSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.month,
          ),
        ),
      ),
      viewModelBuilder: () => DateSelectionViewModel(),
    );
  }
}
