import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../models/purchase.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  final List<Purchase> listPurchases = [
    Purchase(
      store: 'Calvin Klein Store',
      date: '13 ABR',
      total: 799.90,
      amount: 4,
    ),
    Purchase(
      store: 'Calvin Klein Store',
      date: '13 ABR',
      total: 799.90,
      amount: 4,
    ),
    Purchase(
      store: 'Calvin Klein Store',
      date: '13 ABR',
      total: 799.90,
      amount: 4,
    ),
    Purchase(
      store: 'Calvin Klein Store',
      date: '13 ABR',
      total: 799.90,
      amount: 4,
    ),
    Purchase(
      store: 'Calvin Klein Store',
      date: '13 ABR',
      total: 799.90,
      amount: 4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            width: 63,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.black29,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Hoje',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listPurchases.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final purchase = listPurchases[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 17),
              margin: const EdgeInsets.only(top: 10),
              height: context.percentHeight(.10),
              decoration: BoxDecoration(
                color: AppColors.black29,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.black3A,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/store.svg',
                      width: 16,
                      height: 20,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      purchase.store,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Text(
                          purchase.date,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'R\$ ${purchase.total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          'em ${purchase.amount}x',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
