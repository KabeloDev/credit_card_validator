import 'package:credit_card_validator/features/card_validation/presentation/blocs/banned_countries/country_bloc.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_bloc.dart';
import 'package:credit_card_validator/features/card_validation/presentation/main_app_navigation.dart';
import 'package:credit_card_validator/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CardBloc>(create: (_) => sl<CardBloc>()),
        BlocProvider<BannedCountriesBloc>(create: (_) => sl<BannedCountriesBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainNavigation(),
      ),
    );
  }
}
