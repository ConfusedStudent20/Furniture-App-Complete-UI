import 'package:carousel_slider/carousel_slider.dart';
import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/cart_page/model/cart_model.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';
import 'package:furniture_yt/views/saved/model/saved_product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(context,
                text: 'Welcome', themeSelect: (t) => t.bodySmall!),
            buildText(context,
                text: 'Confused Student', themeSelect: (t) => t.bodyMedium!),
          ],
        ),
        leading: PrimaryPadding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(CommonImage.iProfile),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteName.rCart);
            },
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: PrimaryPadding(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            spacing: 10.0,
            children: [
              _buildSliderCard(context),
              _buildTitleRow(context, text1: 'Best Selling', text2: 'See All',
                  onTap: () {
                Navigator.of(context).pushNamed(RouteName.rBestSelling);
              }),
              // best selling ui
              _buildProductCard(CommonImage.iPr1),
              _buildTitleRow(context,
                  text1: 'Recommended For You', text2: 'See All', onTap: () {
                Navigator.of(context).pushNamed(RouteName.rRecommended);
              }),

              // recommended for you ui
              _buildProductCard(CommonImage.iPr4),
            ],
          ),
        ),
      ),
    );
  }

// slider card
  Widget _buildSliderCard(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, pageIndex) {
          return Container(
            decoration: BoxDecoration(
              color: CommonColor.cContainerColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: getScreenSize(context).width * 0.4,
                  child: PrimaryPadding(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildText(
                          context,
                          text: 'Get your \nSpecial Offers',
                          themeSelect: (t) => t.bodyMedium!,
                        ),
                        PrimaryOutlinedButton(
                          buttonName: 'Shop Now',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: PrimaryImage(
                    path: [CommonImage.iPr4],
                  ),
                )
              ],
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 20 / 9,
          autoPlay: true,
          enlargeCenterPage: true,
        ));
  }

// title row
  Widget _buildTitleRow(
    BuildContext context, {
    required String text1,
    required String text2,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(
          context,
          text: text1,
          themeSelect: (t) =>
              t.titleSmall!.copyWith(color: CommonColor.cBlackColor),
        ),
        InkWell(
          onTap: onTap,
          child: buildText(
            context,
            text: text2,
            themeSelect: (t) =>
                t.titleSmall!.copyWith(color: CommonColor.cOrangeColor),
          ),
        )
      ],
    );
  }

// build Product Card
  Widget _buildProductCard(String iName) {
    return SizedBox(
      height: 276,
      child: ListView.separated(
        itemCount: ProductLists.productListsModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = ProductLists.productListsModel[index];
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RouteName.rProductDetail, arguments: data);
            },
            child: Container(
              width: getScreenSize(context).width * 0.5,
              decoration: BoxDecoration(
                color: CommonColor.cContainerColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: PrimaryImage(
                          path: data.imagePath,
                          height: getScreenSize(context).height * 0.185,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              toggleProductSaved(data);
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isProductsSaved(data)
                                ? CommonColor.cRedColor
                                : null,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  PrimaryPadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildText(context,
                            text: data.title,
                            themeSelect: (t) => t.bodyMedium!),
                        buildText(context,
                            text: data.category.name[0].toUpperCase() +
                                data.category.name.substring(1),
                            themeSelect: (t) => t.bodySmall!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildText(context,
                                text: '\$ ${data.price.toString()}',
                                themeSelect: (t) => t.bodySmall!),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  toggleCartProduct(data);
                                });
                              },
                              icon: Icon(Icons.shopping_basket,
                            color: isCartAdded(data)
                                ? CommonColor.cBlueColor
                                : null,
                            size: 30,),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 10.0,
        ),
      ),
    );
  }
}
