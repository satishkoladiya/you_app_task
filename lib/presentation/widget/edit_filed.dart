import 'package:flutter/material.dart';

Widget editField(
    {required String text,
    required String hintText,
    required Color hintColor,
    required TextEditingController controller,
    required Color color,
    required bool isEditable,
    void Function()? onEditingComplete,
    TextInputType? keyboardType}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(text,
          style: TextStyle(
              color: Colors.white.withOpacity(0.33),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter')),
      Spacer(),
      SizedBox(
        width: 202.0,
        height: 36.0,
        child: TextField(
          maxLines: 1,
          controller: controller,
          style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.right,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(right: 10),
            enabled: isEditable,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.22)),
            ),
            filled: true,
            fillColor: Color(0xFFD9D9D9).withOpacity(0.06),
            hintText: hintText,
            hintStyle: TextStyle(
                color: hintColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter'),
          ),
          onEditingComplete: () {
            if (onEditingComplete != null) onEditingComplete!();
          },
        ),
      )
    ],
  );
}
