import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';
import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  final CreditCard card;

  const CardListItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(card.number),
        subtitle: Text('${card.cardType} - ${card.issuingCountry}'),
        trailing: Text('CVV: ${card.cvv}'),
      ),
    );
  }
}
