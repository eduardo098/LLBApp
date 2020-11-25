import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class LLBText {
  static const _textSizeExtra = 30.0;
  static const _textSizeLarge = 20.0;
  static const _textSizeMedium = 14.0;
  static const _textSizeSmall = 10.0;
  static const _textSizeDefault = 16.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('666666');
  static final String _fontNameDefault = 'Muli';

  static final navBarTitle = TextStyle(
    fontFamily: _fontNameDefault
  );

  static final HeaderExtra = TextStyle(
    fontSize: _textSizeExtra,
    fontWeight: FontWeight.w200, 
    color: Colors.white);

  static final HeaderLarge = TextStyle(
    fontSize: _textSizeLarge, 
    color: Colors.white);

  static final HeaderMedium = TextStyle(
    fontSize: _textSizeMedium, 
    color: Colors.white);

  static final HeaderLargeBold = TextStyle(
    fontSize: _textSizeLarge, 
    fontWeight: FontWeight.bold,
    color: Colors.white);

  static final HeaderMediumBold = TextStyle(
    fontSize: _textSizeMedium, 
    fontWeight: FontWeight.bold,
    color: Colors.white);

  static final HeaderSmall = TextStyle(
    fontSize: _textSizeSmall, 
    color: Colors.white);

  static final TextDefault = TextStyle(
    fontSize: _textSizeDefault,
    color: Colors.white,
  );  

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 
    0xFF000000); 
  }
}
