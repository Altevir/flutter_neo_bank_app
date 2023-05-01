import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/constants/app_colors.dart';
import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/pages/main_page.dart';

class ContainerOpenAccount extends StatelessWidget {
  const ContainerOpenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 45),
          child: Container(
            padding: const EdgeInsets.all(30),
            height: context.percentHeight(0.40),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.03),
              boxShadow: [
                BoxShadow(
                  color: AppColors.boxShadowPrimary,
                ),
                BoxShadow(
                  color: AppColors.boxShadowSecondary,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'O banco que leva seu\nfuturo adiante',
                  style: TextStyle(
                    fontSize: context.percentHeight(0.032),
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Simplifique sua vida financeira com o NeoBank -\nmoderno, conectado e fácil de usar!',
                  style: TextStyle(
                    fontSize: context.percentHeight(0.016),
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 27),
                Container(
                  width: context.screenWidth,
                  height: context.percentHeight(0.072),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        AppColors.linearGradientPrimary,
                        AppColors.linearGradientSecondary,
                      ],
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'ABRIR CONTA',
                      style: TextStyle(
                        fontSize: context.percentHeight(0.018),
                        fontWeight: FontWeight.bold,
                        color: AppColors.black17,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                InkWell(
                  child: Text(
                    'Já tenho conta',
                    style: TextStyle(
                      fontSize: context.percentHeight(0.018),
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, anotherAnimation) {
                          return const MainPage();
                        },
                        transitionDuration: const Duration(milliseconds: 1000),
                        transitionsBuilder: (context, animation, anotherAnimation, child) {
                          animation = CurvedAnimation(curve: Curves.linear, parent: animation);
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
