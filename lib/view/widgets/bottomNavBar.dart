import 'package:flutter/material.dart';
import 'package:super_meat/utils/constants.dart';
import 'package:super_meat/utils/styledText.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int navIndex = 0;

  void onNavigation(int index) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.darkGrey,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomIcon(
            index: 0,
            icon: Icons.home,
            label: 'Home',
            isSelected: navIndex == 0,
            onTap: onNavigation,
          ),
          BottomIcon(
            index: 1,
            icon: Icons.search,
            label: 'Search',
            isSelected: navIndex == 1,
            onTap: onNavigation,
          ),
          BottomIcon(
            index: 2,
            icon: Icons.shopping_cart_outlined,
            label: 'Cart',
            isSelected: navIndex == 2,
            onTap: onNavigation,
          ),
          BottomIcon(
            index: 3,
            icon: Icons.shopping_bag_outlined,
            label: 'Wishlist',
            isSelected: navIndex == 3,
            onTap: onNavigation,
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool isSelected;
  final Function(int index) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: isSelected
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: ShapeDecoration(
                  color: AppColor.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  StyledText(
                    label,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          : Icon(icon),
      onTap: () => onTap(index),
    );
  }
}
