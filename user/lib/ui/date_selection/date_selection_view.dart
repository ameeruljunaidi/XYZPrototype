import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/date_selection/date_selection_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DateSelectionView extends StatelessWidget {
  const DateSelectionView({Key? key}) : super(key: key);

  final _avatarHeightWidth = 48.0;
  final _bottomBarHeight = 64.0;

  static const _colorDebug = [
    // Colors.red,
    // Colors.blue,
    // Colors.green,
    // Colors.grey,
    null,
    null,
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DateSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: _pageBody(context, model),
        ),
      ),
      viewModelBuilder: () => DateSelectionViewModel(),
    );
  }

  Stack _pageBody(BuildContext context, DateSelectionViewModel model) {
    final DateFormat timeOptionFormat = DateFormat('jm');

    final List<String> _timeOptions = [
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
      timeOptionFormat.format(DateTime.now()),
    ];

    return Stack(
      children: [
        CustomScrollView(slivers: [
          _appBarSliver(context, model),
          _listingPreview(context, model),
          _chosenDateHeader(context, model),
          _dateSelectorBody(context, model),
          _whiteSpace(_bottomBarHeight),
        ]),
        _timeSelectorBody(
          context,
          model,
          timeOptions: _timeOptions,
        ),
        _bottomBar(context, model),
      ],
    );
  }

  SliverToBoxAdapter _whiteSpace(height) {
    return SliverToBoxAdapter(
      child: Container(
        color: _colorDebug[0],
        height: height,
      ),
    );
  }

  SliverAppBar _appBarSliver(
      BuildContext context, DateSelectionViewModel model) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor:
          // ignore: dead_code
          _colorDebug[0] != null ? _colorDebug[0] : kcBackgroundColor(context),
      leading: IconButton(
        onPressed: model.goBack,
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
      actions: [
        Container(
          color: _colorDebug[2],
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: defaultPaddingValue),
          child: Text(
            'Clear Dates',
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  SliverToBoxAdapter _listingPreview(
      BuildContext context, DateSelectionViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: _colorDebug[1],
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.black),
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: defaultPaddingValue),
              decoration: defaultBoxDecoration(
                color: Colors.white,
                shadow: true,
              ),
              height: _avatarHeightWidth,
              width: _avatarHeightWidth,
              child: Placeholder(), // TODO: Change this later
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: defaultPaddingValue),
                padding: EdgeInsets.only(left: defaultPaddingValueSmall),
                color: _colorDebug[3],
                height: _avatarHeightWidth + 16.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BoxText.subheading('Listing Name'),
                    ),
                    verticalSpaceTiny,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Listing Details',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _chosenDateHeader(
      BuildContext context, DateSelectionViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        color: _colorDebug[2],
        padding: defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mon, Jul 16',
              style: heading2Style,
            ),
            verticalSpaceTiny,
            Text(
              '8:30 - 9:30 AM',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context, DateSelectionViewModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _bottomBarHeight,
        width: double.infinity,
        padding: defaultPaddingHorizontal,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            )
          ],
          color: _colorDebug[0] != null
              ? _colorDebug[0]
              : kcBackgroundColor(context),
        ),
        // TODO: Only show when a date is already selected
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: defaultPaddingValueSmall,
          ),
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            borderRadius: defaultBorderRadius,
          ),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: model.goToBookingSummary,
            child: Text(
              'Request Availability',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _dateSelectorBody(
      BuildContext context, DateSelectionViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        color: _colorDebug[3],
        child: SfDateRangePicker(
          selectionColor: kcPrimaryColor,
          todayHighlightColor: kcPrimaryColor,
        ),
      ),
    );
  }

  Widget _timeSelectorBody(
    BuildContext context,
    DateSelectionViewModel model, {
    required List<String> timeOptions,
  }) {
    return Positioned(
      bottom: _bottomBarHeight,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
          color: _colorDebug[1],
        ),
        height: _bottomBarHeight,
        width: screenWidth(context),
        child: ListView.separated(
            padding: defaultPaddingHorizontal,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, timeIndex) {
              final int? _currentTimeSelected = model.currentTimeSelected;
              final bool _selectedTime = timeIndex == _currentTimeSelected;

              return InkWell(
                onTap: () => model.selectTime(timeIndex),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: defaultPaddingValueSmall,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPaddingValueSmall,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: kcPrimaryColor, width: _selectedTime ? 2 : 1),
                    borderRadius: defaultBorderRadius,
                  ),
                  child: Row(
                    children: [
                      if (_selectedTime)
                        Icon(
                          Icons.check,
                          size: 16.0,
                        ),
                      if (_selectedTime) horizontalSpaceTiny,
                      Text(
                        timeOptions[timeIndex],
                        style: TextStyle(
                          fontWeight: _selectedTime
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, timeIndex) {
              return horizontalSpaceSmall;
            },
            itemCount: timeOptions.length),
      ),
    );
  }
}
