import 'package:card_scanner/features/card_validation/domain/repositories/card_repository.dart';

class ScanCard {
  final CardRepository repository;

  ScanCard(this.repository);

  Future<String?> call() {
    return repository.scanCard();
  }
}