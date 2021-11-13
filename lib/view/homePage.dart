import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:super_meat/model.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';
import 'package:super_meat/view/widgets/bottomNavBar.dart';
import 'package:super_meat/view/widgets/categories.dart';
import 'package:super_meat/view/widgets/items.dart';

const String description =
    'A mix of dark and white meat, our large Chicken Curry Cut pieces include one leg, one wing without tip, and one breast quarter with backbone. Obtained from pasture-raised healthy chickens, the meat has a rich, juicy flavour with a tender, smooth and moderate-firm texture. Best suited for curries.';

const List<Category> categories = [
  Category(name: 'Chicken', image: 'assets/chicken.png'),
  Category(name: 'Meat', image: 'assets/meat.png'),
  Category(name: 'Fish', image: 'assets/fish.png'),
  Category(name: 'Prawn', image: 'assets/prawn.png'),
];

const List<Product> popularItems = [
  Product(
    name: 'Chicken',
    image: 'assets/chick.png',
    details: description,
    kcal: 400,
    priceHalfKilo: 75,
  ),
  Product(
    name: 'Fish',
    image: 'assets/fishes.png',
    details: description,
    kcal: 500,
    priceHalfKilo: 125,
  ),
  Product(
    name: 'Mutton',
    image: 'assets/mutton.png',
    details: description,
    kcal: 700,
    priceHalfKilo: 400,
  ),
  Product(
    name: 'Boneless Chicken',
    image: 'assets/4.png',
    details: description,
    kcal: 300,
    priceHalfKilo: 90,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/profile.png',
              scale: 1.2,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppText(
                  'Hi Marina',
                  size: 14,
                ),
                StyledText(
                  '8-2-596/169, Hyderabad',
                  size: 12,
                ),
              ],
            ),
          ],
        ),
        actions: const [NotificationIcon()],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        children: [
          const AppText(
            'What would you like to eat today?',
            size: 25,
            weight: FontWeight.normal,
          ),
          const SizedBox(height: 10),
          const AppText(
            'Categories',
            size: 20,
          ),
          const Categories(categories),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppText(
                'Popular Items',
                size: 20,
              ),
              StyledText(
                'View all',
                size: 12,
                color: AppColor.darkGrey.withOpacity(0.5),
              ),
            ],
          ),
          const Items(popularItems),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        alignment: Alignment.center,
        children: const [
          Icon(
            Icons.notifications_none_rounded,
          ),
          Positioned(
            top: 19,
            right: 0,
            child: Card(
                elevation: 0,
                borderOnForeground: false,
                margin: EdgeInsets.zero,
                shape: CircleBorder(
                    side: BorderSide(
                  color: Colors.white,
                  width: 1.8,
                )),
                color: AppColor.green,
                child: SizedBox(
                  height: 10,
                  width: 10,
                )),
          ),
        ],
      ),
    );
  }
}
