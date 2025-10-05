import 'package:bloc/bloc.dart';
import 'package:credit_card_validator/core/constants/banned_countries.dart';
import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';
import 'package:credit_card_validator/features/card_validation/domain/repositories/card_repository.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/card_event.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository repository;

  CardBloc({required this.repository}) : super(CardInitial()) {
    on<LoadCards>((event, emit) async {
      emit(CardLoading());
      try {
        final cards = await repository.getCards();
        emit(CardLoaded(cards));
      } catch (e) {
        emit(CardError(e.toString()));
      }
    });

    on<AddCard>((event, emit) async {
      try {
        final card = CreditCard(
          id: '',
          number: event.number,
          cvv: event.cvv,
          issuingCountry: event.issuingCountry,
          cardType: event.cardType,
        );

        await repository.addCard(card, bannedCountries); 
        final updatedCards = await repository.getCards();
        emit(CardLoaded(updatedCards));
      } catch (e) {
        emit(CardError(e.toString()));
      }
    });
  }
}