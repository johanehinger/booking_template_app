import 'package:flutter/material.dart';

class SelectFromList extends StatefulWidget {
  final List<String> listOfValue;
  final String label;

  const SelectFromList({required this.label, required this.listOfValue});
  @override
  _SelectFromListState createState() => _SelectFromListState();
}

class _SelectFromListState extends State<SelectFromList> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _selectedValue,
      hint: Text(widget.label),
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          _selectedValue = value as String?;
        });
      },
      onSaved: (value) {
        setState(() {
          _selectedValue = value as String;
        });
      },
      validator: (String? value) {
        if (value!.isEmpty) {
          return "can't empty";
        } else {
          return null;
        }
      },
      items: widget.listOfValue.map(
        (String val) {
          return DropdownMenuItem(
            value: val,
            child: Text(
              val,
            ),
          );
        },
      ).toList(),
    );
  }
}
