import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
/// Common app input used in whole app
class CommonAppInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final bool isPassword;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final ScrollController? scrollController;
  final VoidCallback? onSuffixClick;
  final TextInputAction textInputAction;
  final Function(String text)? onSubmitted;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String text)? onChanged;
  final String? Function(String? text)? validator;
  final Color? hintColor;
  final bool? isEnable;
  final int? maxLength;
  final int maxLines;
  final double? hintSize;
  final FontWeight? hintWeight;
  final String? hintFamily;
  final Color? fillColor;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;

  const CommonAppInput(
      {Key? key,
      required this.textEditingController,
      this.textInputType = TextInputType.text,
      this.isPassword = false,
      this.hintText = '',
      this.hintStyle,
      this.hintColor,
      this.suffixIcon,
      this.scrollController,
      this.onSuffixClick,
      this.textInputAction = TextInputAction.done,
      this.onSubmitted,
      this.focusNode,
      this.nextFocusNode,
      this.inputFormatters,
      this.onChanged,
      this.validator,
      this.isEnable,
      this.maxLength,
      this.maxLines = 1,
      this.hintSize,
      this.hintWeight,
      this.hintFamily,
      this.fillColor,
      this.filled,
      this.contentPadding,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      scrollController: scrollController,
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPassword ? isPassword : false,
      textInputAction: textInputAction,
      onFieldSubmitted: (String text) {
        onSubmitted?.call(text);
        nextFocusNode?.requestFocus();
      },
      inputFormatters: inputFormatters,
      enabled: isEnable,
      maxLength: maxLength,
      maxLines: maxLines,
      style:
          const TextStyle(color: AppColors.colorIndigo, fontSize: 16, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        counter: const Offstage(),
        filled: filled,
        contentPadding: contentPadding,
        fillColor: fillColor,
        hoverColor: Colors.transparent,
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onSuffixClick,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                focusColor: Colors.transparent,
                child: suffixIcon,
              )
            : null,
        isDense: true,
        hintText: hintText,
        hintStyle: hintStyle ?? const TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.colorFontGrey),
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.colorIndigo),
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
        ),
      ),
    );
  }
}



