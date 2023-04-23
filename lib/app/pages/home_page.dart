import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/extensions/constraints_extensions.dart';
import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/pages/widgets/container_open_account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    log(context.screenWidth.toString());
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) => Stack(
          children: [
            Positioned(
              top: -150,
              right: -150,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 265),
                child: Image.asset(
                  'assets/circle.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              width: context.screenWidth,
              top: 50,
              left: 5,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.isSmallDevice ? 260 : 320),
                child: Image.asset(
                  'assets/card1.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: constraints.isSmallDevice ? 174 : 204,
              width: context.screenWidth,
              left: constraints.isSmallDevice ? 32 : 42,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.isSmallDevice ? 194 : 252),
                child: Image.asset(
                  'assets/card_background.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: constraints.isSmallDevice ? 186 : 216,
              width: context.screenWidth,
              left: constraints.isSmallDevice ? 36 : 48,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.isSmallDevice ? 194 : 252),
                child: Image.asset(
                  'assets/card_background.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: constraints.isSmallDevice ? 156 : 180,
              width: context.screenWidth,
              left: constraints.isSmallDevice ? 28 : 36,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.isSmallDevice ? 200 : 260),
                child: Image.asset(
                  'assets/card2.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              width: context.screenWidth,
              top: context.screenHeight * 0.55,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.isSmallDevice ? 265 : 336),
                child: Image.asset(
                  'assets/circle.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const ContainerOpenAccount(),
          ],
        ),
      ),
    );
  }
}
