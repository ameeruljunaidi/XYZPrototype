import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:xyz_ui/xyz_ui.dart';

class CarouselImages extends StatefulWidget {
  ///List with assets path or url. Required
  final List<String> listImages;

  ///OnTap function. Index = index of active page. Optional
  final Function(int index)? onTap;

  ///Height of whole carousel. Required
  final double height;

  ///Possibility to cached images from network. Optional
  final bool cachedNetworkImage;

  ///Height of nearby images. From 0.0 to 1.0. Optional
  final double scaleFactor;

  ///Border radius of image. Optional
  final double? borderRadius;

  ///Vertical alignment of nearby images. Optional
  final Alignment? verticalAlignment;

  ///ViewportFraction. From 0.5 to 1.0. Optional
  final double viewportFraction;

  const CarouselImages({
    Key? key,
    required this.listImages,
    required this.height,
    this.onTap,
    this.cachedNetworkImage: false,
    this.scaleFactor = 1.0,
    this.borderRadius,
    this.verticalAlignment,
    this.viewportFraction = 0.9,
  })  : assert(scaleFactor > 0.0),
        assert(scaleFactor <= 1.0),
        super(key: key);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  late PageController _pageController;
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: widget.viewportFraction.clamp(0.5, 1.0));
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        return PageView.builder(
          itemCount: widget.listImages.length,
          itemBuilder: (context, position) {
            return ClipRRect(
              borderRadius: defaultBorderRadius,
              child: widget.listImages[position].startsWith('http')
                  ? widget.cachedNetworkImage
                      ? CachedNetworkImage(
                          imageUrl: widget.listImages[position],
                          imageBuilder: (context, image) => GestureDetector(
                            onTap: () => widget.onTap != null
                                ? widget.onTap!(position)
                                : () {},
                            child: Image(
                              image: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () => widget.onTap != null
                              ? widget.onTap!(position)
                              : () {},
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: widget.listImages[position],
                            fit: BoxFit.cover,
                          ),
                        )
                  : GestureDetector(
                      onTap: () => widget.onTap != null
                          ? widget.onTap!(position)
                          : () {},
                      child: Image.asset(
                        widget.listImages[position],
                        fit: BoxFit.cover,
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
