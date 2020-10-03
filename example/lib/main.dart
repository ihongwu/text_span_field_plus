import 'package:flutter/material.dart';
import 'package:text_span_field_plus/get_text_span.dart';
import 'package:text_span_field_plus/text_span_display.dart';
import 'package:text_span_field_plus/text_span_field_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  String tapString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('text_span_field_plus演示'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextSpanFieldPlus(
              maxLines: null,
              onChanged: (value){
                  setState(() {
                    text = value;
                  });
              },
              rangeStyles: GetTextSpan(text,toUserColor: Colors.pinkAccent,topicColor: Colors.blue).getTextFieldStyle()
            ),
            Container(height:20),
            Text('文本显示：'),
            TextSpanDisplay(
              text: text,
              style: TextStyle(fontSize: 20),
              toUserColor: Colors.pinkAccent,
              topicColor: Colors.blue,
              onTap: (Map value){
                setState(() {
                  tapString = value.toString();
                });
              },
            ),
            Container(height:20),
            Text('你点击了：',style: TextStyle(fontSize: 20),),
            Text(tapString,style: TextStyle(fontSize: 20))
          ],
        ),
      ), 
    );
  }
}
