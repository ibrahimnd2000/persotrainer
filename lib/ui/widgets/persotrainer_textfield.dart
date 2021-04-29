import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersoTrainerTextField extends StatefulWidget {
  TextEditingController textEditingController;
  bool isPass, isBirthday, isNum;
  PersoTrainerTextField(this.textEditingController,
      {this.isPass = false, this.isBirthday = false, this.isNum = false});
  @override
  _PersoTrainerTextFieldState createState() => _PersoTrainerTextFieldState();
}

class _PersoTrainerTextFieldState extends State<PersoTrainerTextField> {
  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Color(0xFF00A9A3),
                onPrimary: Colors.white,
                surface: Color(0xFF81BAA8),
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      widget.textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: widget.textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: widget.isBirthday
          ? TextFormField(
              focusNode: AlwaysDisabledFocusNode(),
              obscureText: widget.isPass,
              onTap: () {
                _selectDate(context);
              },
              controller: widget.textEditingController,
              cursorColor: Color(0xFF53D187),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF53D187))),
              ),
            )
          : TextFormField(
              obscureText: widget.isPass,
              controller: widget.textEditingController,
              keyboardType:
                  widget.isNum ? TextInputType.phone : TextInputType.text,
              cursorColor: Color(0xFF53D187),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF53D187))),
              ),
            ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
