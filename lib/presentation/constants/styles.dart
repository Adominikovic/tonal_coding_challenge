import 'package:flutter/material.dart';

const bubbleDiameter = 272;

const bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33,
      color: Color(0x3827ae96),
    )
  ],
);

const labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  fontSize: 127,
  color: Colors.white,
);

const unitTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  fontSize: 38,
  color: Color(0x80ffffff),
);

// I added a some additional style consts for our form fields.
const labelFieldStyle = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xff53a99a), width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff53a99a), width: 2.0),
  ),
  focusColor: Color(0xff53a99a),
  labelText: 'Enter a muscle Group',
  labelStyle: TextStyle(color: Color(0xff53a99a)),
  hintText: 'e.g, "Core", "Upper Body"',
  hintStyle: TextStyle(
    fontStyle: FontStyle.italic,
  ),
);

const weightFieldStyle = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xff53a99a), width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff53a99a), width: 2.0),
  ),
  focusColor: Color(0xff53a99a),
  labelText: 'Enter a weight',
  labelStyle: TextStyle(color: Color(0xff53a99a)),
  hintText: 'weight from 0 - 350 lbs',
  hintStyle: TextStyle(
    fontStyle: FontStyle.italic,
  ),
);
