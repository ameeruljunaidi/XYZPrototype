import 'package:xyz_prototype/models/application_models.dart';

class SubCategory {
  String? subCategory;
  int? subCategoryCount;
  String? subCategoryDescription;
  String? subCategoryImgUrl;
  List<Gig>? gigs;

  SubCategory({
    this.subCategory,
    this.subCategoryCount,
    this.subCategoryDescription,
    this.subCategoryImgUrl,
    this.gigs,
  });
}

final List<SubCategory> subCategoryFaker = [
  SubCategory(
    subCategory: 'Yoga',
    subCategoryCount: 24,
    subCategoryDescription: 'Get a yoga instructor to do yoga with',
    subCategoryImgUrl: 'assets/images/yoga-image.jpeg',
  ),
  SubCategory(
    subCategory: 'Performance',
    subCategoryCount: 45,
    subCategoryDescription: 'A performance coach can help you with your goals',
    subCategoryImgUrl: 'assets/images/performance-image.jpeg',
  ),
  SubCategory(
    subCategory: 'Photography',
    subCategoryCount: 12,
    subCategoryDescription: 'Get a photographer for any event',
    subCategoryImgUrl: 'assets/images/photography-image.jpeg',
  ),
  SubCategory(
    subCategory: 'Hair Cut',
    subCategoryCount: 55,
    subCategoryDescription: 'Professional haircut you would enjoy',
    subCategoryImgUrl: 'assets/images/haircut-image.jpeg',
  ),
  SubCategory(
    subCategory: 'Nail Salon',
    subCategoryCount: 75,
    subCategoryDescription: 'Get a fresh new manicure with us',
    subCategoryImgUrl: 'assets/images/nailsalon-image.jpeg',
  ),
  SubCategory(
      subCategory: 'Fitness',
      subCategoryCount: 10,
      subCategoryDescription: 'New years resolultion, all year round',
      subCategoryImgUrl: 'assets/images/fitness-image.jpeg'),
];
