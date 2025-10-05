import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_bloc.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_event.dart';
import 'package:credit_card_validator/features/card_validation/presentation/blocs/credit_cards/card_state.dart';
import 'package:credit_card_validator/features/card_validation/presentation/widgets/card_form/add_card_button.dart';
import 'package:credit_card_validator/features/card_validation/presentation/widgets/card_form/card_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormPageState();
}

class _CardFormPageState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _countryController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    _cvvController.dispose();
    _countryController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<CardBloc>(context).add(
        AddCard(
          number: _numberController.text,
          cvv: _cvvController.text,
          issuingCountry: _countryController.text,
          cardType: _typeController.text,
        ),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Credit Card')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocListener<CardBloc, CardState>(
          listener: (context, state) {
            if (state is CardError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }

            if (state is CardLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Card added successfully!'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CardTextField(
                  controller: _numberController,
                  label: 'Card Number',
                ),
                CardTextField(controller: _cvvController, label: 'CVV'),
                CardTextField(
                  controller: _countryController,
                  label: 'Issuing Country',
                ),
                CardTextField(controller: _typeController, label: 'Card Type'),
                const SizedBox(height: 20),
                AddCardButton(onPressed: _submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
