import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';

abstract class CardState {}

class CardInitial extends CardState {}
class CardLoading extends CardState {}
class CardLoaded extends CardState {
  final List<CreditCard> cards;
  CardLoaded(this.cards);
}
class CardError extends CardState {
  final String message;
  CardError(this.message);
}
class CardScanned extends CardState {
  final String cardNumber;
  CardScanned(this.cardNumber);
}

