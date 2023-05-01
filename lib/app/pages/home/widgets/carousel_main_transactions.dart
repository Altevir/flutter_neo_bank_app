import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';

class CarouselMainTransactions extends StatefulWidget {
  const CarouselMainTransactions({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CarouselMainTransactions> createState() => _MainTransactionsState();
}

class _MainTransactionsState extends State<CarouselMainTransactions> {
  final listMenu = [
    {
      'name': 'PIX',
      'icon': 'ic_pix.png',
    },
    {
      'name': 'Transferir',
      'icon': 'ic_group.png',
    },
    {
      'name': 'Investir',
      'icon': 'ic_chart.png',
    },
    {
      'name': 'Pagar',
      'icon': 'ic_barcode.png',
    },
    {
      'name': 'Cobrar',
      'icon': 'ic_barcode.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 66,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listMenu.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(left: index == 0 ? 0 : 14),
                decoration: BoxDecoration(
                  color: AppColors.black29,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 73,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/${listMenu[index]['icon']}',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      listMenu[index]['name']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
