import 'package:card_scanner/features/card_validation/domain/entites/credit_card.dart';
import 'package:card_scanner/features/card_validation/domain/repositories/card_repository.dart';

class GetCards {
  final CardRepository repository;

  GetCards(this.repository);

  Future<List<CreditCard>> call() {
    return repository.getCards();
  }
}