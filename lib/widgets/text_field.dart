import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rupee_format/items/number_formatter.dart';

class RupeeTextField extends StatefulWidget {
  // const RupeeTextField({required Key key}) : super(key: key);

  // const RupeeTextField({super.key, Key? key1});
  const RupeeTextField({Key? key}) : super(key: key);

  @override
  _RupeeTextFieldState createState() => _RupeeTextFieldState();
}

class _RupeeTextFieldState extends State<RupeeTextField> {
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Amount',
          // hintText: '₹0',
          // filled: true
          // prefixText: '₹ ',
        ),
        onChanged: (text) {
          IndianRupeeFormatter.amountFormatter(text, _amountController);
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
        ],
        controller: _amountController,
        // keyboardType: TextInputType.number,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        // keyboardType: const TextInputType.numberWithOptions(decimal: true),
        // onChanged: _submitData,
        // onChanged: (_) => _submitData(),
      ),
    );
  }
}
