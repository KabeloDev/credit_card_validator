import 'package:bloc/bloc.dart';
import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/banned_countries/country_event.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/banned_countries/country_state.dart';

class BannedCountriesBloc extends Bloc<BannedCountryEvent, BannedCountriesState> {
  final CardRepository repository;
  BannedCountriesBloc({required this.repository}) : super(BannedCountriesLoading()) {
    on<LoadBannedCountries>((event, emit) async {
      final list = await repository.getBannedCountries();
      emit(BannedCountriesLoaded(list));
    });

    on<AddBannedCountry>((event, emit) async {
      final current = await repository.getBannedCountries();
      current.add(event.country);
      await repository.updateBannedCountries(current);
      emit(BannedCountriesLoaded(current));
    });

    on<EditBannedCountry>((event, emit) async {
      final current = await repository.getBannedCountries();
      current[event.index] = event.country;
      await repository.updateBannedCountries(current);
      emit(BannedCountriesLoaded(current));
    });

    on<DeleteBannedCountry>((event, emit) async {
      final current = await repository.getBannedCountries();
      current.removeAt(event.index);
      await repository.updateBannedCountries(current);
      emit(BannedCountriesLoaded(current));
    });
  }
}
