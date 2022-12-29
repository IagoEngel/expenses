import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  _submitForm() {
    final title = tituloController.text;
    final value = double.tryParse(valorController.text) ?? 0;

    if (title.isEmpty || value <=0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              onSubmitted: (_) => _submitForm,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valorController,
              onSubmitted: (_) => _submitForm,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor R\$',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Text('Nova Transação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
