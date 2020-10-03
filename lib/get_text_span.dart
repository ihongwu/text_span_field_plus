import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'range_style.dart';

class GetTextSpan{
  final Color topicColor;
  final Color toUserColor;
  // 话题正则
  RegExp topicReg = new RegExp(r"#([^#]{1,})#");

  // 用户提醒(@开头,以空格、冒号、斜杠/ 结束，不以@结束)
  RegExp accountRemindReg = new RegExp(r"@([^\s|\/|:|@]+)");

  final String text;
  GetTextSpan(
    this.text, 
    {
      this.topicColor=Colors.blue, 
      this.toUserColor=Colors.pinkAccent
    }
  ) : assert(text!=null);

  // 根据话题、@标识获取字符串列表
  List getResultList<T>(String text,RegExp regExp,String tag){
    var indexArr = [0,0];
    var start = 0;
    var end = 0;
    List textList = [];
    // 匹配@
    for (Match m in regExp.allMatches(text)) {
      indexArr = [start,m.start];
      start = m.end +0;
      // 如果tag不在第一个，就先把前面的字符串拼接在最前面
      if(indexArr[1] > indexArr[0]){
          textList.addAll([
            {'type':'text','value':text.substring(indexArr[0],indexArr[1])}
          ]);
      }
      // 拼接tag开头空格结尾的字符串
      textList.addAll([
        {'type':tag,'value':text.substring(m.start,m.end)}
      ]);
      end = m.end;
    }
    if(text.length > end) {
      // 拼接末尾的字符串
      textList.addAll([
          {'type':'text','value':text.substring(end,text.length)}
      ]);
    }
    return textList;
  }

  // 获取话题+@的总列表数据
  List getResult(){
      List remindReg = this.getResultList(this.text, this.accountRemindReg, '@');
      List remindRegNew = [];
      for (int i = 0; i < remindReg.length; i++) {
        if(remindReg[i]['type'] == 'text') {
           var topic = this.getResultList(remindReg[i]['value'], this.topicReg, '#');
           for (var j = 0; j < topic.length; j++) {
              remindRegNew.addAll([topic[j]]);
           }
        } else {
          remindRegNew.addAll([remindReg[i]]);
        }
      }
     return remindRegNew;
  }

  List<RangeStyle> getTextFieldStyle() {
    List<RangeStyle> result = [];
    List textList = getResult();
    textList.forEach((item) {
      if (item['type']!='text') {
        RegExp regExp = new RegExp(r"("+item['value']+")");
        for (Match m in regExp.allMatches(this.text)) {
          result.add(
            RangeStyle(
              range: TextRange(start: m.start, end: m.end),
              style: TextStyle(color: item['type']=='#' ? topicColor : toUserColor),
            ),
          );
        }
      }
    });
    return result.length == 0 ? null : result;
  }
}