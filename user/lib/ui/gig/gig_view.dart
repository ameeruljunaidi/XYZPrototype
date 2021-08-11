import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/dumb_widgets/carousel_image.dart';
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
      onModelReady: (model) {
        model.getNextGigs();
        model.addScrollListener();
      },
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          controller: model.scrollController,
          slivers: [
            _whiteSpace(context, model),
            _appBarSliver(context, model),
            _whiteSpace(context, model),
            _listOfGigs(context, model),
            if (model.isBusy) _progressIndicator(),
            if (model.hasNext) _getNextGigButton(context, model),
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

  SliverAppBar _appBarSliver(BuildContext context, GigListViewModel model) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor:
          // ignore: dead_code
          _colorDebug[0] != null ? _colorDebug[0] : kcBackgroundColor(context),
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

  Widget _listOfGigs(BuildContext context, GigListViewModel model) {
    final _loadedGigs = model.gigList;

    if (_loadedGigs != null && _loadedGigs.length != 0) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, gigIndex) {
            final _gigAtIndex = _loadedGigs[gigIndex];
            final _gigTitle = _gigAtIndex.gigTitle;
            final _gigDescription = _gigAtIndex.gigDescription;
            final _gigRating = _gigAtIndex.gigRating;
            final _gigReviewCount = _gigAtIndex.gigReviews!.isNotEmpty
                ? _gigAtIndex.gigReviews!.length
                : 'No';

            return GestureDetector(
              onTap: () => model.goToGigProfile(gigIndex),
              child: Container(
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
                child: _cardContent(
                  _gigTitle!,
                  _gigDescription!,
                  _gigRating!,
                  _gigReviewCount,
                  _gigAtIndex,
                ),
              ),
            );
          },
          childCount: _loadedGigs.length,
        ),
      );
    }
    return SliverToBoxAdapter(
      child: Container(
        margin: defaultPaddingHorizontal,
        color: _colorDebug[0],
        child: Text('No gigs to show yet, please come back later!'),
      ),
    );
  }

  Widget _carouselSlider(Gig _gigAtIndex) {
    return CarouselImages(
      listImages: _gigAtIndex.gigPhotos!,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(defaultBorderRadiusValue),
        bottomLeft: Radius.circular(defaultBorderRadiusValue),
      ),
      height: double.infinity,
      cachedNetworkImage: true,
      verticalAlignment: Alignment.topCenter,
    );
  }

  Widget _cardContent(
    String _gigTitle,
    String _gigDescription,
    double _gigRating,
    Object _gigReviewCount,
    Gig _gigAtIndex,
  ) {
    return Row(
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
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultBorderRadiusValue),
                bottomLeft: Radius.circular(defaultBorderRadiusValue),
              ),
              child: CachedNetworkImage(
                imageUrl: _gigAtIndex.gigPhotos![0],
                fit: BoxFit.cover,
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
                              _gigTitle,
                              style: heading3Style,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            verticalSpaceTiny,
                            Text(
                              _gigDescription,
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
                      child: InkWell(
                        child: Icon(Icons.favorite_outline),
                        onTap: () {
                          // TODO: Allow users to add favorites
                        },
                      ),
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
                        '$_gigRating ($_gigReviewCount reviews)',
                      ),
                      Spacer(),
                      Text(
                          'from \$${_gigAtIndex.gigPrice!['package1']!['price']}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter _progressIndicator() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: defaultPaddingAllSmallVertical,
            color: _colorDebug[0],
            child: CircularProgressIndicator(
              color: kcPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _getNextGigButton(
      BuildContext context, GigListViewModel model) {
    return SliverToBoxAdapter(
      child: TextButton(
        onPressed: () => model.getNextGigs(),
        child: Text(
          'See More',
          style: TextStyle(
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }
}
