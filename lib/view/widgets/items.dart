import 'package:flutter/material.dart';
import 'package:super_meat/model.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';
import 'package:super_meat/view/productPage.dart';

class Items extends StatelessWidget {
  const Items(
    this.popularItems, {
    Key? key,
  }) : super(key: key);

  final List<Product> popularItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 25),
      shrinkWrap: true,
      itemCount: popularItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        var item = popularItems[index];

        return ItemCard(item: item);
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                item.image,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.grey[700]!.withOpacity(0.8),
                    ],
                    tileMode: TileMode.decal,
                  )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        item.name,
                        color: Colors.white,
                        size: 13,
                        weight: FontWeight.w500,
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            '₹ ${item.priceHalfKilo}',
                            color: Colors.white,
                            size: 19,
                          ),
                          const SizedBox(width: 5),
                          const StyledText(
                            '500 gms',
                            color: Colors.white,
                            // weight: FontWeight.w600,
                            size: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Card(
                  elevation: 0,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  color: AppColor.green.withOpacity(0.75),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                    child: StyledText(
                      '15 mins',
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ProductPage(
                      product: item,
                    )));
      },
    );
  }
}
