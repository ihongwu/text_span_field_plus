import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:text_span_field_plus/get_text_span.dart';

InlineSpan getSpan(data,{
  required Color toUserColor,
  required Color topicColor,
  required ValueChanged<Map>? onTap,
}){
  if (data['type'] == '@') {
    return TextSpan(
      text: data['value'],
      style: TextStyle(color: toUserColor),
      recognizer:TapGestureRecognizer()..onTap = (){
        String value = data['value'].replaceAll('\u200b','');
        onTap?.call({'type':'@','value':value,'v': value.substring(1,value.length)});
      }
    );
  } else if (data['type'] == '#') {
    return TextSpan(
      text: data['value'],
      style: TextStyle(color: topicColor),
      recognizer:TapGestureRecognizer()..onTap = (){
        onTap?.call({'type':'#','value':data['value']});
      }
    );
  }
  return TextSpan(
    text: data['value']
  );
}

List<InlineSpan> spanListWidget(
  String text,{
  required Color toUserColor,
  required Color topicColor,
  required ValueChanged<Map>? onTap,
}
){
  List data = GetTextSpan(text).getResult();
  return data.asMap().keys.map((index) => getSpan(
    data[index],
    toUserColor: toUserColor,
    topicColor: topicColor,
    onTap: onTap,
  )).toList();
}