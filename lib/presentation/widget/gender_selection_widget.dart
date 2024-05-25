import 'package:flutter/material.dart';

Widget selectGender(
    {required String? genderValue, required void Function(String) onChanged}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('Gender:',
          style: TextStyle(
              color: Colors.white.withOpacity(0.33),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter')),
      Spacer(),
      Container(
          width: 202.0,
          height: 36.0,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color(0xFFD9D9D9).withOpacity(0.06),
            border: Border.all(color: Colors.white.withOpacity(0.22)),
          ),
          child: DropdownButton<String>(
            underline: SizedBox(),
            isDense: true,
            alignment: Alignment.centerRight,
            value: genderValue,
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            dropdownColor: Color(0xFF162329),
            hint: Text('Select Gender',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.30),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter')),
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter'),
            items: const ['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              onChanged(value!);
            },
          ))
    ],
  );
}
