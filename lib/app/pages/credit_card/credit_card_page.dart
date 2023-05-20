import 'package:flutter/material.dart';

import 'package:flutter_neo_bank_app/app/extensions/size_extensions.dart';
import 'package:flutter_neo_bank_app/app/pages/credit_card/widgets/carousel_cards.dart';
import 'package:flutter_neo_bank_app/app/pages/credit_card/widgets/invoice_data.dart';
import 'package:flutter_neo_bank_app/app/pages/credit_card/widgets/purchase_history.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Meus cartões',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
              const SizedBox(height: 17),
              const InvoiceData(),
              const SizedBox(height: 15),
              const CarouselCards(),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * 0.10),
                child: const PurchaseHistory(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
