import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_bloc.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_event.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_state.dart';
import 'package:credit_card_validator/features/card_validation/presentation/widgets/card_list/card_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CardBloc>(context).add(LoadCards());

    return Scaffold(
      appBar: AppBar(title: const Text('Saved Cards')),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is CardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CardLoaded) {
            if (state.cards.isEmpty) {
              return const Center(child: Text('No cards added yet.'));
            }
            return ListView.builder(
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                final card = state.cards[index];
                return CardListItem(card: card);
              },
            );
          } else if (state is CardError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
