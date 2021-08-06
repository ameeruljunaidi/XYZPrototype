import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_category_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class AddGigCategoryView extends StatelessWidget {
  const AddGigCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigSubCategoryViewModel>.reactive(
      onModelReady: (model) => model.getSubCategories(),
      builder: (context, model, child) => Scaffold(
        body: defaultSliverScreen(
          context,
          model,
          heading: 'Choose a Category',
          sliverBodyContent: _serviceSubCategoriesGrid(context, model),
          cancelButton: () => model.cancelAddGig(),
          goBack: model.goBack,
          goContinue: model.goToAddService,
        ),
      ),
      viewModelBuilder: () => AddGigSubCategoryViewModel(),
    );
  }

  Widget _serviceSubCategoriesGrid(context, model) {
    if (model.subCategoriesList != null) {
      return SliverPadding(
        padding: EdgeInsets.only(
          bottom: 16.0,
          left: 24.0,
          right: 24.0,
          top: 24.0,
        ),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              bool _selectedIndex = index == model.selectedSubCategory;

              return InkWell(
                borderRadius: defaultBorderRadius,
                onTap: () => model.changeSelectedCategory(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: _selectedIndex ? kcVeryLightGreyColor : Colors.white,
                    borderRadius: defaultBorderRadius,
                    border: Border.all(
                      color: _selectedIndex ? Colors.black : kcMediumGreyColor,
                      width: _selectedIndex ? 2 : 1,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.subCategoriesList![index].serviceSubCategoryName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: _selectedIndex
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: model.subCategoriesList!.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 24.0,
            mainAxisSpacing: 24.0,
          ),
        ),
      );
    } else {
      return SliverFillRemaining(
        child: Container(
          height: screenHeight(context) / 2,
          child: Center(
            child: CircularProgressIndicator(color: kcPrimaryColor),
          ),
        ),
      );
    }
  }
}
