import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/search/search_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:intl/intl.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

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

  final double _avatarSize = 64.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: false,
      onModelReady: (model) {
        model.getGigOrders();
        model.getGigs();
        model.getVendors();
        model.getAppointments();
      },
      builder: (context, model, child) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceRegular,
                  _screenHeading(context),
                  _pageSelector(context, model),
                  verticalSpaceRegular,
                  _pagesBuilder(context, model),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<SearchViewModel>(),
    );
  }

  Widget _pagesBuilder(BuildContext context, SearchViewModel model) {
    return ExpandablePageView.builder(
      controller: model.pageController,
      itemCount: model.pages!.length,
      onPageChanged: (page) => model.updateSelectedPricePage(page),
      itemBuilder: (context, pageIndex) {
        return _gigListBuilder(context, model);
      },
    );
  }

  Widget _pageSelector(BuildContext context, SearchViewModel model) {
    return Container(
      margin: defaultPaddingHorizontal,
      height: 32,
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: _colorDebug[2],
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.pages!.length,
        itemBuilder: (context, pageIndex) {
          final _selected = pageIndex == model.selectedActivitiesPage;

          return _pageButton(
            model,
            text: model.pages![pageIndex],
            pageIndex: pageIndex,
            fontWeight: _selected ? FontWeight.bold : null,
            bottomBorder: _selected,
          );
        },
      ),
    );
  }

  Widget _pageButton(
    SearchViewModel model, {
    required text,
    bottomBorder = false,
    fontWeight = FontWeight.normal,
    required pageIndex,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => model.goToPageIndex(pageIndex),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 12.0),
        padding: EdgeInsets.symmetric(
          vertical: defaultPaddingValueSmall / 2,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: fontWeight,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: _colorDebug[1],
          border: bottomBorder
              ? Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                )
              : null,
        ),
      ),
    );
  }

  Container _screenHeading(BuildContext context) {
    return Container(
      padding: defaultPaddingHorizontal,
      width: screenWidth(context),
      color: _colorDebug[2],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoxText.headline('Activities'),
          TextButton(
            child: Text(
              'See All',
              style: TextStyle(
                color: kcPrimaryColor,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: BoxInputField(
        controller: TextEditingController(),
        placeholder: 'Search',
        textAlign: TextAlign.center,
        leading: Icon(Icons.search),
      ),
    );
  }

  Widget _gigListBuilder(BuildContext context, SearchViewModel model) {
    final List<GigOrder>? _gigOrderList = model.gigOrders;
    final List<Gig?>? _gigList = model.gigList;
    final List<Client>? _vendorList = model.vendorList;
    final List<Appointment>? _appointmentList = model.appointmentList;

    final bool _gigOderListExist = _gigOrderList != null;
    final bool _gigListExist = _gigList != null;
    final bool _gigVendorListExist = _vendorList != null;
    final bool _gigAppointmentListExist = _appointmentList != null;

    if (_gigOderListExist &&
        _gigListExist &&
        _gigVendorListExist &&
        _gigAppointmentListExist) {
      return _gigListView(
        _gigOrderList,
        _gigList,
        _vendorList,
        _appointmentList,
        model,
      );
    } else {
      return CircularProgressIndicator(color: kcPrimaryColor);
    }
  }

  ListView _gigListView(
    List<GigOrder> _gigOrderList,
    List<Gig?> _gigList,
    List<Client> _vendorList,
    List<Appointment> _appointmentList,
    SearchViewModel model,
  ) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, gigOrderIndex) {
        final _gigOrder = _gigOrderList[gigOrderIndex];

        final _gigOrderGigId = _gigOrder.gigOrderGigId;
        final _gigOrderGigVendorId = _gigOrder.gigOrderVendorId;
        final _gigOrderGigAppointment = _gigOrder.gigOrderAppointment;

        final _gigAtIndex =
            _gigList.firstWhere((e) => e!.gigId == _gigOrderGigId);
        final _vendorAtIndex = _vendorList
            .firstWhere((e) => e.clientVendorId == _gigOrderGigVendorId);
        final _appointmentAtIndex =
            _appointmentList.firstWhere((e) => e.id == _gigOrderGigAppointment);

        final DateFormat formatter = DateFormat('MMM-dd');
        final _dateAtIndex = formatter.format(_appointmentAtIndex.startTime);

        return _activitiesCard(
          context,
          model,
          listingTitle: _gigAtIndex!.gigTitle ?? 'No Title',
          listingDescription: _gigAtIndex.gigDescription ?? 'No Description',
          vendorName: _vendorAtIndex.clientName ?? 'No Vendor',
          bookedDate: _dateAtIndex,
        );
      },
      separatorBuilder: (context, gigOrderIndex) {
        return verticalSpaceRegular;
      },
      itemCount: _gigOrderList.length,
    );
  }

  Widget _activitiesCard(
    BuildContext context,
    SearchViewModel model, {
    required String listingTitle,
    required String listingDescription,
    required String vendorName,
    required String bookedDate,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: _avatarSize * 1.5,
        width: screenWidth(context),
        color: _colorDebug[3],
        child: Padding(
          padding: defaultPaddingHorizontal,
          child: Stack(
            children: <Widget>[
              _activitiesDetails(
                context,
                bookedDate: bookedDate,
                listingDescription: listingDescription,
                listingTitle: listingTitle,
                vendorName: vendorName,
              ),
              _activitiesAvatar(),
            ],
          ),
        ),
      ),
    );
  }

  Align _activitiesDetails(
    BuildContext context, {
    required String listingTitle,
    required String listingDescription,
    required String vendorName,
    required String bookedDate,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: _avatarSize / 2),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: _colorDebug[0] != null ? _colorDebug[0] : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: _avatarSize / 1.5,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: _colorDebug[1],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          listingTitle,
                          style: subheadingStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpaceTiny,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          listingDescription,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpaceTiny,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'with $vendorName',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: _colorDebug[2],
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BoxText.body(
                    bookedDate,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _activitiesAvatar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: defaultBoxDecoration(
          color: Colors.white,
          shadow: true,
        ),
        height: _avatarSize,
        width: _avatarSize,
        child: Placeholder(),
      ),
    );
  }
}
