import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';
import 'package:flutter_neo_bank_app/app/constants/app_icons.dart';
import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/models/menu_item.dart';
import 'package:flutter_neo_bank_app/app/pages/credit_card_page.dart';
import 'package:flutter_neo_bank_app/app/pages/home/home_page.dart';
import 'package:flutter_neo_bank_app/app/pages/invest_page.dart';
import 'package:flutter_neo_bank_app/app/pages/wallet_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<MenuItem> listMenus = [
    MenuItem(title: 'Home', icon: AppIcons.home),
    MenuItem(title: 'Cartão', icon: AppIcons.card),
    MenuItem(title: 'Investir', icon: AppIcons.investor),
    MenuItem(title: 'Carteira', icon: AppIcons.wallet),
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const CreditCardPage(),
    const InvestPage(),
    const WalletPage(),
  ];

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex.value);
  }

  @override
  void dispose() {
    _selectedIndex.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 16),
              height: context.percentHeight(0.075),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const RadialGradient(
                  colors: [
                    Color.fromRGBO(170, 170, 170, 0.4),
                    Color.fromRGBO(202, 202, 202, 0.2),
                  ],
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 21, sigmaY: 21),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: context.screenWidth * .024),
                    itemCount: listMenus.length,
                    itemBuilder: (_, index) => InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: context.screenWidth * 0.040,
                          right: context.screenWidth * 0.040,
                        ),
                        width: 48,
                        height: 48,
                        child: ValueListenableBuilder(
                          valueListenable: _selectedIndex,
                          builder: (context, indexValue, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                listMenus[index].icon,
                                width: 20,
                                height: 16,
                                colorFilter: ColorFilter.mode(
                                  index == indexValue ? AppColors.secondary : AppColors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Text(
                                listMenus[index].title,
                                style: GoogleFonts.manrope(
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    color: index == indexValue ? AppColors.secondary : AppColors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                                height: index == indexValue ? 8 : 0,
                                width: index == indexValue ? 8 : 0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.secondary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        _selectedIndex.value = index;
                        _pageController.jumpToPage(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
