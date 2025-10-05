import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';

class ScanCard {
  final Repository repository;

  ScanCard(this.repository);

  Future<String?> call() {
    return repository.scanCard();
  }
}
