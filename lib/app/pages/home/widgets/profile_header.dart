import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/img_user.png',
              width: 53,
              height: 53,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Olá,',
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
              Text(
                'Carolina',
                style: GoogleFonts.jost(
                  textStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 0.9,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_outlined,
            color: AppColors.white,
            size: 26,
          ),
        ),
        Stack(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black3A,
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 22,
                color: AppColors.white,
              ),
            ),
            Positioned(
              top: 10,
              left: 22,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
