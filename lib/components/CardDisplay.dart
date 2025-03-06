import 'package:barcode_widget/barcode_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardholder/api/v0.dart';
import 'package:flutter/material.dart';
import 'package:cardholder/api/card.dart' as cardTypes;

class CardDisplay extends StatelessWidget {
  final cardTypes.Card card;
  final API api;

  const CardDisplay({super.key, required this.card, required this.api});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: api.cards[card.getProvider()]!.imageUrl,
                width: 256,
              ),
            ),
            BarcodeWidget(
              barcode: Barcode.code128(),
              data: card.getBarcode().toString(),
              width: 256,
            ),
            Text(card.getAlias()),
          ],
        ),
      ),
    );
  }
}
