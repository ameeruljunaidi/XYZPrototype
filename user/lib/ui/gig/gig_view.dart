import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/ui/gig/gig_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigListView extends StatelessWidget {
  GigListView({Key? key}) : super(key: key);

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

  final double _avatarSize = 112.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            _whiteSpace(context, model),
            _appBarSliver(model),
            _whiteSpace(context, model),
            _testPagination(context, model),
            // _listOfGigs(context, model),
          ],
        ),
      ),
      viewModelBuilder: () => GigListViewModel(),
    );
  }

  SliverToBoxAdapter _whiteSpace(
    BuildContext context,
    GigListViewModel model,
  ) {
    return SliverToBoxAdapter(
      child: Container(
        height: 16.0,
        width: double.infinity,
        color: _colorDebug[1],
      ),
    );
  }

  SliverAppBar _appBarSliver(GigListViewModel model) {
    return SliverAppBar(
      pinned: true,
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
            Icons.filter_list,
            color: Colors.black,
          ),
        )
      ],
      title: BoxInputField(
        controller: TextEditingController(),
        placeholder: 'Search',
      ),
      centerTitle: true,
    );
  }

  _listOfGigs(BuildContext context, GigListViewModel model) {
    final _testList = [
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight'
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, gigIndex) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultPaddingValue,
              vertical: 8.0,
            ),
            height: _avatarSize,
            width: _avatarSize * 1.25,
            decoration: defaultBoxDecoration(
              color: _colorDebug[0] != null ? _colorDebug[0] : Colors.white,
              shadow: true,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(defaultBorderRadiusValue),
                        bottomLeft: Radius.circular(defaultBorderRadiusValue),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _colorDebug[1],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(defaultBorderRadiusValue),
                        bottomRight: Radius.circular(defaultBorderRadiusValue),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 8.0, left: 8.0),
                                color: _colorDebug[0],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: heading3Style,
                                    ),
                                    verticalSpaceTiny,
                                    Text(
                                      LoremIpsum,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: _colorDebug[2],
                              margin: EdgeInsets.only(
                                top: 8.0,
                                right: 8.0,
                                left: 8.0,
                              ),
                              child: Icon(Icons.favorite_outline),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 8.0,
                            left: 8.0,
                            right: 8.0,
                          ),
                          color: _colorDebug[2],
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 16.0,
                              ),
                              horizontalSpaceTiny,
                              Text(
                                '5.0 (3 reviews)',
                              ),
                              Spacer(),
                              Text('from \$800)'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _testList.length,
      ),
    );
  }

  SliverToBoxAdapter _testPagination(
      BuildContext context, GigListViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        child: Center(
          child: Text('Test Pagination'),
        ),
      ),
    );
  }
}
