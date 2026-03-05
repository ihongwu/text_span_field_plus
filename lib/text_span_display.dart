import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'get_text_span.dart';
class TextSpanDisplay extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Color topicColor;
  final Color toUserColor;
  final TextAlign textAlign;
  final ValueChanged<Map>? onTap;
  TextSpanDisplay({
    Key? key, 
    required this.text, 
    this.style, 
    this.topicColor=Colors.blue, 
    this.toUserColor=Colors.pinkAccent, 
    this.textAlign=TextAlign.left,
    this.onTap
    }) : super(key: key);
  @override
  _TextSpanDisplayState createState() => _TextSpanDisplayState();
}

class _TextSpanDisplayState extends State<TextSpanDisplay> {

  // 输入的文本内容如
  String text = "";
  @override
  void initState() {
    super.initState();
  }

  InlineSpan getSpan(data){
      if (data['type'] == '@') {
        return TextSpan(
          text: data['value'],
          style: TextStyle(color: widget.toUserColor),
          recognizer:TapGestureRecognizer()..onTap = (){
            String value = data['value'].replaceAll('\u200b','');
            widget.onTap?.call({'type':'@','value':value,'v': value.substring(1,value.length)});
          }
        );
      } else if (data['type'] == '#') {
        return TextSpan(
          text: data['value'],
          style: TextStyle(color: widget.topicColor),
          recognizer:TapGestureRecognizer()..onTap = (){
            widget.onTap?.call({'type':'#','value':data['value']});
          }
        );
      }

      return TextSpan(
        text: data['value']
      );
  }

  List<InlineSpan> spanListWidget(){
    List data = GetTextSpan(widget.text).getResult();
    return data.asMap().keys.map((index) => getSpan(data[index])).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
          children: spanListWidget(),
          style: widget.style
        ),
        textAlign: widget.textAlign,
    );
  }
}