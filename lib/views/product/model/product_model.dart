import 'package:furniture_yt/cores/consts/image.dart';

// enum of category
enum ProductCategory {
  bed,
  chair,
  sofa,
  lamp,
}

extension ProductCategoryExtension on ProductCategory {
  String get imagePath {
    switch (this) {
      case ProductCategory.bed:
        return CommonImage.iBed2;
      case ProductCategory.chair:
        return CommonImage.iPr8;
      case ProductCategory.sofa:
        return CommonImage.iPr3;
      case ProductCategory.lamp:
        return CommonImage.iLamp2;
    }
  }
}

class ProductModel {
  final int id;
  final String title;
  final ProductCategory category;
  final double price;
  final double? rating;
  double? quantity;
  final String? description;
  final List<String> imagePath;
  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    this.rating,
    this.quantity = 1,
    this.description,
    required this.imagePath,
  });
}

class ProductLists {
  static final List<ProductModel> productListsModel = [
// beds
    ProductModel(
      id: 1,
      title: 'Wooden Bed',
      price: 3000,
      category: ProductCategory.bed,
      rating: 4.2,
      quantity: 10,
      description:
          'A sturdy and comfortable wooden bed perfect for any bedroom.',
      imagePath: [
        CommonImage.iBed1,
        CommonImage.iBed2,
      ],
    ),

    //sofas
    ProductModel(
      id: 2,
      title: 'Classic Black Sofa',
      category: ProductCategory.sofa,
      price: 300,
      rating: 4.0,
      quantity: 5,
      description:
          'A timeless black sofa that adds elegance to any living space.',
      imagePath: [
        CommonImage.iSofaBlack,
      ],
    ),
    ProductModel(
      id: 3,
      title: 'Vintage Blue Sofa',
      category: ProductCategory.sofa,
      price: 2000,
      rating: 4.3,
      quantity: 2,
      description:
          'A stylish blue sofa with vintage aesthetics and premium comfort.',
      imagePath: [
        CommonImage.iSofaBlue,
      ],
    ),
    ProductModel(
      id: 4,
      title: 'Comfort White Sofa',
      category: ProductCategory.sofa,
      price: 3000,
      rating: 4.5,
      quantity: 40,
      description:
          'A luxurious white sofa that provides ultimate relaxation and style.',
      imagePath: [
        CommonImage.iSofaRed,
      ],
    ),
    ProductModel(
      id: 14,
      title: 'Comfort Red Sofa',
      category: ProductCategory.sofa,
      price: 3500,
      rating: 4.5,
      quantity: 3,
      description:
          'A luxurious red sofa that provides ultimate relaxation and style.',
      imagePath: [
        CommonImage.iSofaRed,
      ],
    ),

    // chairs
    ProductModel(
      id: 5,
      title: 'Elegant Red Chair',
      category: ProductCategory.chair,
      price: 150,
      quantity: 23,
      rating: 4.1,
      description:
          'A bold red chair that adds a touch of sophistication to any room.',
      imagePath: [
        CommonImage.iChairRed,
      ],
    ),
    ProductModel(
      id: 6,
      title: 'Modern White Chair',
      category: ProductCategory.chair,
      price: 180,
      rating: 4.4,
      quantity: 19,
      description:
          'A sleek and comfortable white chair suitable for modern interiors.',
      imagePath: [
        CommonImage.iChairWhite,
      ],
    ),
    ProductModel(
      id: 10,
      title: 'Retro Sofa',
      category: ProductCategory.chair,
      price: 500,
      rating: 5.0,
      quantity: 31,
      description: 'A premium  black sofa with exceptional comfort.',
      imagePath: [
        CommonImage.iPr5,
      ],
    ),
    ProductModel(
      id: 11,
      title: 'Coconut Chair',
      category: ProductCategory.chair,
      price: 340,
      rating: 3.8,
      quantity: 6,
      description: 'A uniquely designed coconut-shaped chair.',
      imagePath: [
        CommonImage.iPr1,
      ],
    ),
    ProductModel(
      id: 12,
      title: 'Three Leg Chair',
      category: ProductCategory.chair,
      price: 200,
      rating: 3.5,
      quantity: 13,
      description: 'A creative three-legged chair that stands out.',
      imagePath: [
        CommonImage.iPr6,
      ],
    ),
    ProductModel(
      id: 13,
      title: 'Cushion Chair',
      category: ProductCategory.chair,
      price: 700,
      rating: 4.6,
      quantity: 9,
      description: 'A creative comfortable cushion chair that stands out.',
      imagePath: [
        CommonImage.iPr8,
        CommonImage.iPr9,
      ],
    ),
// lamps
    ProductModel(
      id: 7,
      title: 'Stylish Desk Lamp',
      category: ProductCategory.lamp,
      price: 75,
      rating: 4.6,
      quantity: 13,
      description: 'An energy-efficient desk lamp with a modern design.',
      imagePath: [
        CommonImage.iLamp1,
      ],
    ),
    ProductModel(
      id: 8,
      title: 'Vintage Lamp',
      category: ProductCategory.lamp,
      price: 90,
      rating: 4.2,
      quantity: 18,
      description: 'A vintage-style lamp that brings warmth to your space.',
      imagePath: [
        CommonImage.iLamp2,
      ],
    ),
    ProductModel(
      id: 9,
      title: 'Minimalist Lamp',
      category: ProductCategory.lamp,
      price: 65,
      rating: 4.0,
      quantity: 17,
      description: 'A simple yet elegant lamp perfect for bedside tables.',
      imagePath: [
        CommonImage.iLamp3,
      ],
    ),
  ];
}
