import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/ui/services/service_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

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
    return ViewModelBuilder<ServicesViewModel>.reactive(
      onModelReady: (model) {
        model.getServicesFromSubCategory();
        model.getCategoryName();
      },
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBarSliver(model),
            _serviceIcon(context, model),
            _categoriesList(context, model),
          ],
        ),
      ),
      viewModelBuilder: () => ServicesViewModel(),
    );
  }

  SliverAppBar _appBarSliver(ServicesViewModel model) {
    return SliverAppBar(
      // pinned: true,
      floating: true,
      backgroundColor:
          // ignore: dead_code
          _colorDebug[0] != null ? _colorDebug[0] : Colors.transparent,
      leading: IconButton(
        onPressed: model.goBack,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: defaultPaddingValue),
          child: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  SliverToBoxAdapter _serviceIcon(
    BuildContext context,
    ServicesViewModel model,
  ) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        width: double.infinity,
        color: _colorDebug[1],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 48.0,
            ),
            verticalSpaceSmall,
            Text(
              model.categoryName ?? 'No Category',
              style: heading2Style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpaceSmall,
            Container(
              width: screenWidth(context) * 0.8,
              child: Text(
                LoremIpsum,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _categoriesList(BuildContext context, ServicesViewModel model) {
    final loadedServices = model.servicesList;

    if (loadedServices != null) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, categoryIndex) {
            return GestureDetector(
              onTap: model.goToGigView,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: defaultPaddingValue,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: _colorDebug[0],
                  border: Border.all(color: Colors.black),
                  borderRadius: defaultBorderRadius,
                ),
                child: ListTile(
                  contentPadding: defaultPaddingHorizontal,
                  // tileColor: _colorDebug[2],
                  title: Text(loadedServices[categoryIndex]),
                ),
              ),
            );
          },
          childCount: loadedServices.length,
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: Container(
          height: 120,
          width: screenWidth(context),
          child: CircularProgressIndicator(
            color: kcPrimaryColor,
          ),
        ),
      );
    }
  }
}
