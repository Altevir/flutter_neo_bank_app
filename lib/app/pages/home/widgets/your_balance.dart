import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';

class YourBalance extends StatefulWidget {
  const YourBalance({super.key});

  @override
  State<YourBalance> createState() => _YourBalanceState();
}

class _YourBalanceState extends State<YourBalance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 124,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.black29,
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/img_group_background.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Seu saldo',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.greyB8,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.remove_red_eye,
                      size: 16,
                      color: AppColors.greyB8,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      6,
                      (index) {
                        return Container(
                          margin: EdgeInsets.only(left: index > 0 ? 12 : 0, top: 16),
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff3A3A3A),
                        ),
                        child: Image.asset(
                          'assets/ic_replay.png',
                          fit: BoxFit.cover,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 13),
                Divider(
                  color: AppColors.white,
                  height: 4,
                  thickness: 0.6,
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text(
                      'Limite da conta disponível',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'R\$ 6.789,00',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.greyB8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
