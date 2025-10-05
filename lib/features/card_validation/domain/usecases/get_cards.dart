import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';
import 'package:credit_card_validator/features/card_validation/domain/repositories/card_repository.dart';

class GetCards {
  final CardRepository repository;

  GetCards(this.repository);

  Future<List<CreditCard>> call() {
    return repository.getCards();
  }
}
