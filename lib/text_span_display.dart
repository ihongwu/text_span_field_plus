import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'get_text_span.dart';
class TextSpanDisplay extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Color topicColor;
  final Color toUserColor;
  final onTap;
  TextSpanDisplay({
    Key key, 
    this.text, 
    this.style, 
    this.topicColor=Colors.blue, 
    this.toUserColor=Colors.pinkAccent, 
    this.onTap
    }) : assert(text != null) , super(key: key);
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
            widget.onTap({'type':'@','value':data['value']});
          }
        );
      } else if (data['type'] == '#') {
        return TextSpan(
          text: data['value'],
          style: TextStyle(color: widget.topicColor),
          recognizer:TapGestureRecognizer()..onTap = (){
            widget.onTap({'type':'#','value':data['value']});
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
    );
  }
}