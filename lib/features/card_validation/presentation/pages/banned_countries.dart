import 'package:credit_card_validator/features/card_validation/presentation/blocs/banned_countries/country_bloc.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/banned_countries/country_event.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/banned_countries/country_state.dart';
import 'package:credit_card_validator/features/card_validation/presentation/widgets/banned_countries/add_banned_country.dart';
import 'package:credit_card_validator/features/card_validation/presentation/widgets/banned_countries/banned_country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannedCountries extends StatefulWidget {
  const BannedCountries({super.key});

  @override
  State<BannedCountries> createState() => _BannedCountriesPageState();
}

class _BannedCountriesPageState extends State<BannedCountries> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BannedCountriesBloc>(context).add(LoadBannedCountries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banned Countries')),
      body: BlocBuilder<BannedCountriesBloc, BannedCountriesState>(
        builder: (context, state) {
          if (state is BannedCountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BannedCountriesLoaded) {
            final countries = state.countries;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AddCountryField(
                    onAdd: (country) => context.read<BannedCountriesBloc>().add(
                      AddBannedCountry(country),
                    ),
                  ),
                  Expanded(
                    child: BannedCountryList(
                      countries: countries,
                      onEdit: (i, country) => context
                          .read<BannedCountriesBloc>()
                          .add(EditBannedCountry(i, country)),
                      onDelete: (i) => context.read<BannedCountriesBloc>().add(
                        DeleteBannedCountry(i),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
