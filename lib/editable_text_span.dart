import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'range_style.dart';

/// 自定义文本编辑器
/// 1. 重写 buildTextSpan 方法达到样式控制
/// 2. 增加 style 属性达到动态样式控制
class EditableTextSpan extends EditableText {
  /// 自定义范围样式
  final List<RangeStyle>? rangeStyles;

  EditableTextSpan({
    Key? key,
    this.rangeStyles,
    required TextEditingController controller,
    required FocusNode focusNode,
    bool readOnly = false,
    bool obscureText = false,
    bool autocorrect = true,
    bool enableSuggestions = true,
    required TextStyle style,
    StrutStyle? strutStyle,
    required Color cursorColor,
    required Color backgroundCursorColor,
    TextAlign textAlign = TextAlign.start,
    TextDirection? textDirection,
    Locale? locale,
    double? textScaleFactor,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    bool forceLine = true,
    TextWidthBasis textWidthBasis = TextWidthBasis.parent,
    bool autofocus = false,
    bool showCursor = true,
    bool showSelectionHandles = false,
    Color? selectionColor,
    TextSelectionControls? selectionControls,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    TextCapitalization textCapitalization = TextCapitalization.none,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    SelectionChangedCallback? onSelectionChanged,
    VoidCallback? onSelectionHandleTapped,
    List<TextInputFormatter>? inputFormatters = const [],
    bool rendererIgnoresPointer = false,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    bool cursorOpacityAnimates = false,
    Offset? cursorOffset,
    bool paintCursorAboveText = false,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    Brightness keyboardAppearance = Brightness.light,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool enableInteractiveSelection = true,
    ScrollController? scrollController,
    ScrollPhysics? scrollPhysics,
    ToolbarOptions toolbarOptions = const ToolbarOptions(
      copy: true,
      cut: true,
      paste: true,
      selectAll: true,
    ),
  }) : super(
          key: key,
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly,
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          style: style,
          strutStyle: strutStyle,
          cursorColor: cursorColor,
          backgroundCursorColor: backgroundCursorColor,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          textScaler: textScaleFactor != null ? TextScaler.linear(textScaleFactor) : TextScaler.noScaling,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          forceLine: forceLine,
          textWidthBasis: textWidthBasis,
          autofocus: autofocus,
          showCursor: showCursor,
          showSelectionHandles: showSelectionHandles,
          selectionColor: selectionColor,
          selectionControls: selectionControls,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          onSelectionChanged: onSelectionChanged,
          onSelectionHandleTapped: onSelectionHandleTapped,
          inputFormatters: inputFormatters,
          rendererIgnoresPointer: rendererIgnoresPointer,
          cursorWidth: cursorWidth,
          cursorRadius: cursorRadius,
          cursorOpacityAnimates: cursorOpacityAnimates,
          cursorOffset: cursorOffset,
          paintCursorAboveText: paintCursorAboveText,
          scrollPadding: scrollPadding,
          keyboardAppearance: keyboardAppearance,
          dragStartBehavior: dragStartBehavior,
          enableInteractiveSelection: enableInteractiveSelection,
          scrollController: scrollController,
          scrollPhysics: scrollPhysics,
        );

  @override
  createState() => _EditableTextSpan();
}

class _EditableTextSpan extends EditableTextState {
  @override
  EditableTextSpan get widget => super.widget as EditableTextSpan;


}
