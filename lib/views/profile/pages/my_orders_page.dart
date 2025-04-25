import 'package:furniture_yt/cores/consts/const.dart';
import 'package:furniture_yt/views/product/model/product_model.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildText(
          context,
          text: 'My Orders',
          themeSelect: (t) => t.titleMedium!,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: [
            Tab(text: 'Ongoing'),
            Tab(text: 'Completed'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: PrimaryPadding(
        child: TabBarView(controller: _controller, children: [
          _buildTabContent(
              iName: CommonImage.iPr1, text1: 'Cancel', text2: 'Track Order'),
          _buildTabContent(
              iName: CommonImage.iPr4, text1: 'Cancel', text2: 'Track Order'),
          _buildTabContent(
            iName: CommonImage.iPr7,
          ),
        ]),
      ),
    );
  }

  // tar bar content
  Widget _buildTabContent({
    required String iName,
    String? text1,
    String? text2,
  }) {
    return ListView.separated(
      itemCount: ProductLists.productListsModel.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final data = ProductLists.productListsModel[index];
        return Container(
          width: getScreenSize(context).width * 0.95,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 188, 221, 248),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.0,
            children: [
              Row(
                spacing: 10.0,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: PrimaryImage(
                      path: data.imagePath,
                      height: getScreenSize(context).height * 0.15,
                      width: getScreenSize(context).width * 0.4,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildText(context,
                          text: data.title, themeSelect: (t) => t.bodyMedium!),
                      buildText(context,
                          text: data.category.name.toUpperCase(),
                          themeSelect: (t) => t.bodySmall!),
                      buildText(context,
                          text: '\$ ${data.price}',
                          themeSelect: (t) => t.bodySmall!),
                    ],
                  )
                ],
              ),
              (text1 != null && text2 != null)
                  ? PrimaryPadding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        spacing: 10.0,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PrimaryOutlinedButton(
                            buttonName: text1,
                            onPressed: () {},
                            size: Size(getScreenSize(context).width * 0.35, 50),
                          ),
                          PrimaryElevatedButton(
                            buttonName: text2,
                            onPressed: () {},
                            size: Size(getScreenSize(context).width * 0.35, 50),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 15.0,
      ),
    );
  }
}
