import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:super_meat/model.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';
import 'package:super_meat/view/cartPage.dart';
import 'package:super_meat/view/widgets/clipWidget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    bool isItemAdded =
        Cart.items.any((cartItem) => cartItem.product == widget.product);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  widget.product.name,
                  color: AppColor.green,
                  weight: FontWeight.normal,
                  size: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      StyledText(
                        '15 Mins Delivery',
                        color: Colors.black.withOpacity(0.5),
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Image.asset('assets/bike.png')
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const AdjustmentWidget(),
                const SizedBox(height: 100),
                KcalWidget(product: widget.product),
                const SizedBox(height: 27),
                const AppText(
                  'Details',
                  size: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: StyledText(
                    widget.product.details,
                    size: 13,
                    color: AppColor.darkGrey.withOpacity(0.5),
                    lineSpace: 2,
                  ),
                ),
                const SizedBox(height: 20),
                const AppText(
                  'Total Price',
                  weight: FontWeight.normal,
                  size: 20,
                ),
                const SizedBox(height: 10),
                AppText(
                  '₹ ${widget.product.priceHalfKilo}',
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.black,
                        size: 40,
                      ),
                      MaterialButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: AppColor.green,
                          child: Row(
                            children: [
                              StyledText(
                                isItemAdded ? 'Go To Cart' : 'Add to Cart',
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                          onPressed: () {
                            if (isItemAdded) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const CartPage()));
                            } else {
                              Cart.items.add(CartItem(
                                  product: widget.product, quantity: 1));
                              setState(() {});
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/subtract.png',
                height: 480,
                width: 220,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
