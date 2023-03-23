import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.blue,
    Colors.pink,
    Colors.green,
  ];

  Color? backgroundColor;

   @override
   void initState(){
    super.initState();
    int i = Random().nextInt(5);
    backgroundColor = colors[i];
   }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? ElevatedButton.icon(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  'Excluir',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
              )
            : IconButton(
                onPressed: () => widget.onRemove(widget.tr.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );

    // Primeira versão de desenhar cada transação
    // return Card(
    //   child: Row(
    //     children: [
    //       Container(
    //         margin: const EdgeInsets.symmetric(
    //             horizontal: 15, vertical: 10),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Theme.of(context).colorScheme.primary,
    //             width: 2,
    //           ),
    //         ),
    //         padding: const EdgeInsets.all(10),
    //         child: Text(
    //           'R\$ ${tr.value.toStringAsFixed(2)}',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Theme.of(context).colorScheme.primary,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             tr.title,
    //             style: Theme.of(context).appBarTheme.titleTextStyle,
    //           ),
    //           Text(
    //             DateFormat('d MMM y').format(tr.date),
    //             style: const TextStyle(
    //               color: Colors.grey,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
