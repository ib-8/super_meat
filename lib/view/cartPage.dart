import 'package:flutter/material.dart';
import 'package:super_meat/model.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: const [CartIcon()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppText(
              'Items',
              color: Colors.black.withOpacity(0.5),
              size: 21,
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Cart.items.length,
                itemBuilder: (_, index) {
                  var cartItem = Cart.items[index];
                  var product = cartItem.product;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          product.image,
                          height: 90,
                          width: 90,
                          fit: BoxFit.fill,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AppText(
                                  product.name,
                                  size: 14,
                                  color: AppColor.green,
                                ),
                                StyledText('₹ ${product.priceHalfKilo}'),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CartButton(
                                  icon: Icons.remove,
                                  onTap: () {
                                    if (cartItem.quantity > 1) {
                                      cartItem.quantity--;
                                      setState(() {});
                                    }
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: StyledText(
                                  cartItem.quantity.toString(),
                                  color: AppColor.green,
                                  size: 20,
                                ),
                              ),
                              CartButton(
                                icon: Icons.add,
                                onTap: () {
                                  cartItem.quantity = cartItem.quantity + 1;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StyledText(
                    'ADDITIONAL COMMENTS',
                    size: 15,
                    color: AppColor.darkGrey.withOpacity(0.5),
                  ),
                  const SizedBox(width: 5),
                  StyledText(
                    'Optional',
                    size: 10,
                    color: AppColor.darkGrey.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColor.textFieldFillColor,
                      prefixIcon: const SizedBox(),
                      hintText: 'e.g.Bring extra sauce...',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(
                    Icons.textsms_outlined,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Column(
              children: [
                StyledText(
                  'Selected item (${Cart.items.length})',
                  color: Colors.grey,
                  size: 14,
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: AppColor.green,
                      child: const StyledText(
                        'CHECKOUT',
                        letterSpace: 3.0,
                        color: Colors.white,
                        family: AppFont.poppins,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
          ),
          Positioned(
            top: 11,
            right: 0,
            child: CircleAvatar(
              backgroundColor: AppColor.green,
              radius: 7,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: StyledText(
                  Cart.items.length.toString(),
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.grey[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
