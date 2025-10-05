import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';

class ScanCard {
  final CardRepository repository;

  ScanCard(this.repository);

  Future<String?> call() {
    return repository.scanCard();
  }
}
