import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_service_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class AddGigServiceView extends StatelessWidget {
  const AddGigServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigServiceViewModel>.reactive(
      onModelReady: (model) => model.getServicesFromSubCategory(),
      builder: (context, model, child) => Scaffold(
        body: defaultSliverScreen(
          context,
          model,
          cancelButton: () => model.cancelAddGig(),
          goBack: model.goBack,
          goContinue: model.goToAddTitle,
          heading: 'Choose a Service',
          sliverBodyContent: _listOfServices(context, model),
        ),
      ),
      viewModelBuilder: () => AddGigServiceViewModel(),
    );
  }

  Widget _listOfServices(context, model) {
    if (model.servicesList != null) {
      return SliverPadding(
        padding: EdgeInsets.only(
          bottom: 16.0,
          left: 24.0,
          right: 24.0,
          top: 24.0,
        ),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              bool _selectedIndex = index == model.selectedService;

              return ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                title: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: _selectedIndex ? kcVeryLightGreyColor : Colors.white,
                    borderRadius: defaultBorderRadius,
                    border: Border.all(
                      color: _selectedIndex ? Colors.black : kcMediumGreyColor,
                      width: _selectedIndex ? 2 : 1,
                    ),
                  ),
                  padding: defaultPaddingAll,
                  child: Text(
                    model.servicesList![index],
                    style: TextStyle(
                        fontWeight: _selectedIndex
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
                onTap: () => model.changeSelectedService(index),
              );
            },
            childCount: model.servicesList!.length,
          ),
        ),
      );
    } else {
      SliverFillRemaining(
        child: Container(
          height: screenHeight(context) / 2,
          child: Center(
            child: CircularProgressIndicator(
              color: kcPrimaryColor,
            ),
          ),
        ),
      );
    }

    return SliverFillRemaining(
      child: Container(
        height: screenHeight(context) / 2,
        child: Center(
          child: CircularProgressIndicator(
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }
}
