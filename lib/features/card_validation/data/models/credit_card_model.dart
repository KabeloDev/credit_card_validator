import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';

class CreditCardModel extends CreditCard {
  const CreditCardModel({
    required super.id,
    required super.number,
    required super.cardType,
    required super.cvv,
    required super.issuingCountry,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      id: json['id'],
      number: json['number'],
      cardType: json['cardType'],
      cvv: json['cvv'],
      issuingCountry: json['issuingCountry'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'cardType': cardType,
        'cvv': cvv,
        'issuingCountry': issuingCountry,
      };

  CreditCard toEntity() => CreditCard(
        id: id,
        number: number,
        cardType: cardType,
        cvv: cvv,
        issuingCountry: issuingCountry,
      );

  factory CreditCardModel.fromEntity(CreditCard card) {
    return CreditCardModel(
      id: card.id,
      number: card.number,
      cardType: card.cardType,
      cvv: card.cvv,
      issuingCountry: card.issuingCountry,
    );
  }
}