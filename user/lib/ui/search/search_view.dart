import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/search/search_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                verticalSpaceRegular,
                BoxInputField(
                  controller: TextEditingController(),
                  placeholder: 'Search for Service Around You',
                  textAlign: TextAlign.center,
                ),
                verticalSpaceRegular,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<SearchViewModel>(),
    );
  }
}
