# text_span_field_plus

1. Flutter自定义文本样式输入框，本插件改自text_span_field，增加了页面回显、点击回调功能，修复了符号嵌套红屏Bug
2. 该插件可以让你在TextField中显示不同样式的文本，例如 #话题# @用户 效果
3. TextSpanDisplay可以回显#话题#以及@用户效果
4. 点击话题和@，可以实现回调，方便扩展功能


### 安装
在工程 pubspec.yaml 中加入 dependencies

```
dependencies:
  text_span_field_plus: ^1.0.6
```
## 效果图
<img src="https://raw.githubusercontent.com/ihongwu/text_span_field_plus/main/gif.gif" width="400">


## 输入框使用
```
import 'package:text_span_field_plus/text_span_field_plus.dart';
import 'package:text_span_field_plus/get_text_span.dart';
TextSpanFieldPlus(
	maxLines: null,
	onChanged: (value){
		setState(() {
			text = value;
		});
	},
	rangeStyles: GetTextSpan(
		text,
		toUserColor: Colors.pinkAccent,
		topicColor: Colors.blue).getTextFieldStyle()
),
```

## 显示内容
```
import 'package:text_span_field_plus/text_span_display.dart';
TextSpanDisplay(
		text: text,
		style: TextStyle(fontSize: 20),
		toUserColor: Colors.pinkAccent,
		topicColor: Colors.blue,
		// 点击话题或者@回调，返回内容{"type","@","value":"@用户"} 或者{"type","#","value":"#话题"}
		onTap: (Map value){
			setState(() {
				tapString = value.toString();
			});
		},
),
```

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
