import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';
import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/models/made_for_you.dart';

class CarouselMadeForYou extends StatefulWidget {
  const CarouselMadeForYou({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CarouselMadeForYou> createState() => _CarouselMadeForYouState();
}

class _CarouselMadeForYouState extends State<CarouselMadeForYou> {
  final List<MadeForYou> listItems = [
    MadeForYou(
      image: 'img_woman_shopping.png',
      title: 'Nosso clube de pontos',
      description: 'Compre em lojas parceiras e receba vantagens exclusivas e cashbacks',
    ),
    MadeForYou(
      image: 'img_good_humoured_woman.png',
      title: 'Indique amigos',
      description: 'Traga seus amigos para o NeoBank e ganhe pontos em sua carteira',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: context.percentHeight(0.0195),
          ),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 204,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
                width: 204,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.black29,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/${listItems[index].image}',
                      height: 114,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 10),
                      child: Text(
                        listItems[index].title,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14, top: 8, right: 14),
                      child: Text(
                        listItems[index].description,
                        style: TextStyle(
                          color: AppColors.grey84,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
