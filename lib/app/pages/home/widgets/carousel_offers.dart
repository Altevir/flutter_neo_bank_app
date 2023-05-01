import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';
import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/models/offer.dart';
import 'package:flutter_neo_bank_app/app/pages/home/widgets/carousel_custom_indicator.dart';

class CarouselOffers extends StatefulWidget {
  const CarouselOffers({super.key});

  @override
  State<CarouselOffers> createState() => _CarouselOffersState();
}

class _CarouselOffersState extends State<CarouselOffers> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier<int>(0);
  late PageController _pageController;

  List<Offer> listOffers = [
    Offer(title: 'Sua liberdade financeira\ncomeça em poucos cliques', image: 'img_bag.png', actionText: 'Começar a investir'),
    Offer(title: 'Mais de 50 mil produtos\npara você escolher', image: 'img_bag.png', actionText: 'Aproveite'),
    Offer(title: 'Economize de forma simples\ne direta', image: 'img_bag.png', actionText: 'Aproveitar'),
    Offer(title: 'Clube de benefícios\nO que é, vantagens e mais!', image: 'img_bag.png', actionText: 'Eu quero!'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedPageIndex.value);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 145,
          child: PageView.builder(
            controller: _pageController,
            itemCount: listOffers.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
              padding: const EdgeInsets.only(left: 16, top: 16),
              width: context.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.black29,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listOffers[index].title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: context.screenWidth < 600 ? 149 : 172,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  AppColors.linearGradientPrimary,
                                  AppColors.linearGradientSecondary,
                                ],
                              ),
                            ),
                            child: Visibility(
                              visible: listOffers[index].actionText.isNotEmpty,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  listOffers[index].actionText,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/img_bag.png',
                          width: 106,
                          height: 106,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            onPageChanged: (int index) => _selectedPageIndex.value = index,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                listOffers.length,
                (index) {
                  return ValueListenableBuilder(
                    valueListenable: _selectedPageIndex,
                    builder: (_, pageIndex, child) {
                      return CarouselCustomIndicator(isSelected: index == pageIndex);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
