import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/pages/home/widgets/carousel_made_for_you.dart';
import 'package:flutter_neo_bank_app/app/pages/home/widgets/carousel_main_transactions.dart';
import 'package:flutter_neo_bank_app/app/pages/home/widgets/carousel_offers.dart';
import 'package:flutter_neo_bank_app/app/pages/home/widgets/profile_header.dart';
import 'package:flutter_neo_bank_app/app/pages/home/widgets/your_balance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 19, right: 25, bottom: 22),
                child: ProfileHeader(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: YourBalance(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 18),
                child: CarouselMainTransactions(title: 'Principais transações'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 17, right: 25),
                child: CarouselOffers(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 25,
                  top: 11,
                  bottom: context.screenHeight * 0.11,
                ),
                child: const CarouselMadeForYou(title: 'Feito para você'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
