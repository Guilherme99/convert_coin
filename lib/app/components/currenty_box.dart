import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrentyBox extends StatelessWidget {
  final List<CurrencyModel> itens;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final onChanged;

  const CurrentyBox(
      {Key? key,
      required this.itens,
      required this.controller,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
              height: 56,
              child: new DropdownButton<CurrencyModel>(
                  value: selectedItem,
                  iconEnabledColor: Colors.amber,
                  isExpanded: true,
                  underline: Container(
                    height: 1,
                    color: Colors.amber,
                  ),
                  items: itens
                      .map(
                        (e) => DropdownMenuItem<CurrencyModel>(
                          child: Text(e.name),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: onChanged)),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: 150,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
