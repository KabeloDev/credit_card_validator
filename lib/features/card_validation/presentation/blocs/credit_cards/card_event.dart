abstract class CardEvent {}

class LoadCards extends CardEvent {}

class AddCard extends CardEvent {
  final String number;
  final String cvv;
  final String issuingCountry;
  final String cardType;

  AddCard({
    required this.number,
    required this.cvv,
    required this.issuingCountry,
    required this.cardType,
  });
}

class ScanCardRequested extends CardEvent {}


