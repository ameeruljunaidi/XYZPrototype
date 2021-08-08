import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/category/category_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

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
    return ViewModelBuilder<CategoryViewModel>.reactive(
      onModelReady: (model) {
        model.getSubCategories();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              _appBarSliver(model),
              _whiteSpace(context, model, 0.15),
              _categoriesList(context, model),
            ],
          ),
        );
      },
      viewModelBuilder: () => CategoryViewModel(),
    );
  }

  SliverAppBar _appBarSliver(CategoryViewModel model) {
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
      title: Column(
        children: [
          Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  SliverToBoxAdapter _whiteSpace(
    BuildContext context,
    CategoryViewModel model,
    double pct,
  ) {
    return SliverToBoxAdapter(
      child: Container(
        height: screenHeight(context) * pct,
        width: double.infinity,
        color: _colorDebug[1],
      ),
    );
  }

  _categoriesList(BuildContext context, CategoryViewModel model) {
    final loadedCategories = model.categoriesList;

    if (loadedCategories != null) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, categoryIndex) {
            return Container(
              margin: defaultPaddingHorizontal,
              decoration: BoxDecoration(
                color: _colorDebug[0],
                border: Border.all(color: Colors.black),
              ),
              child: ListTile(
                contentPadding: defaultPaddingHorizontal,
                // tileColor: _colorDebug[2],
                title: Text(
                    loadedCategories[categoryIndex].serviceSubCategoryName!),
                onTap: () => model.selectCategory(categoryIndex),
              ),
            );
          },
          childCount: loadedCategories.length,
        ),
      );
    } else {
      return SliverToBoxAdapter(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: CircularProgressIndicator(
            color: kcPrimaryColor,
          ),
        ),
      );
    }
  }
}
