import 'package:doctor_panel/core/extension/widget_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../utils/enums.dart';
import 'colors.dart';

// COMMON UI COMPONENTS
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final Color? loadingIndicatorColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final TextStyle? textStyle;
  final double? width; // Added width property

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.color,
    this.textColor,
    this.loadingIndicatorColor,
    this.borderRadius = 8.0,
    this.padding,
    this.fontSize = 16.0,
    this.textStyle,
    this.width, // Added width parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Apply width to SizedBox if it's provided
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: isLoading
            ? CupertinoActivityIndicator(
                color: loadingIndicatorColor ?? Colors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) Icon(icon, size: 20, color: textColor),
                  if (icon != null) const SizedBox(width: 8),
                  Text(label,
                      style: textStyle ??
                          TextStyle(fontSize: fontSize, color: textColor)),
                ],
              ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color disabledBorderColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color cursorColor;
  final double borderWidth;
  final double? suffixIconSize;
  final double? prefixIconSize;
  final InputDecoration? customDecoration;
  final BoxConstraints? constraints;
  final String? Function(String?)? validator;
  final String? counterText;
  final Color? fillColor;
  final bool? filled;
  final bool? isBorderNone;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final void Function()? onTapSuffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final void Function()? onTap;

  // properties for title functionality
  final String? title;
  final bool isRequired;
  final TextStyle? titleStyle;
  final bool showTitle;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.isBorderNone,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = primaryBlueColor,
    this.disabledBorderColor = primaryBlueColor,
    this.enabledBorderColor = primaryBlueColor,
    this.cursorColor = primaryBlueColor,
    this.borderWidth = 1.0,
    this.customDecoration,
    this.inputFormatters,
    this.validator,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIconColor,
    this.suffixIconSize,
    this.constraints,
    this.counterText,
    this.fillColor,
    this.filled,
    this.contentPadding,
    this.keyboardType,
    this.onChanged,
    this.onTapSuffixIcon,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textStyle,
    // New parameters for title functionality
    this.title,
    this.isRequired = false,
    this.titleStyle,
    this.showTitle = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool hideNonFocusedBorders =
        enabledBorderColor == Colors.transparent &&
            disabledBorderColor == Colors.transparent &&
            borderColor == Colors.transparent;

    final textField = TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: cursorColor,
      readOnly: readOnly,
      validator: validator,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      style: textStyle,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      decoration: customDecoration ??
          InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: prefixIconColor,
                    size: prefixIconSize,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: suffixIconColor,
                    size: suffixIconSize,
                  ).onTap(onTapSuffixIcon ?? () {})
                : null,
            border: (hideNonFocusedBorders || isBorderNone == true)
                ? InputBorder.none
                : OutlineInputBorder(
                    borderSide:
                        BorderSide(color: borderColor, width: borderWidth),
                    borderRadius: BorderRadius.circular(8),
                  ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: focusedBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: enabledBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            // For disabledBorder, use InputBorder.none if hideNonFocusedBorders is true
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: disabledBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: constraints,
            counterText: counterText,
            contentPadding: contentPadding,
            fillColor: fillColor,
            filled: filled,
            hintStyle: hintStyle,
          ),
    );

    if (!showTitle || title == null) {
      return textField;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: titleStyle ??
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 6),
        textField,
      ],
    );
  }
}

class CustomIconContainer extends StatelessWidget {
  final String? iconPath;
  final double height;
  final double width;
  final double padding;
  final Color backgroundColor;
  final double borderRadius;
  final bool isSvg;
  final IconData? iconData;
  final Color? borderColor;
  final double? iconsSize;
  final Color? iconColor;

  const CustomIconContainer({
    super.key,
    this.iconPath,
    this.height = 23.0,
    this.width = 23.0,
    this.padding = 0,
    this.backgroundColor = const Color(0xffededff),
    this.borderRadius = 20.0,
    this.isSvg = false,
    this.borderColor,
    this.iconData,
    this.iconsSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      clipBehavior: Clip.hardEdge,
      child: Align(
        alignment: Alignment.center,
        child: iconData != null
            ? Icon(
                iconData,
                color: iconColor,
                size: iconsSize,
              )
            : isSvg
                ? SvgPicture.asset(
                    iconPath ?? '',
                    height: height,
                    width: width,
                  )
                : Image.asset(
                    iconPath ?? '',
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                  ),
      ),
    );
  }
}

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final Widget Function(T) itemBuilder;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color disabledBorderColor;
  final Color? dropdownIconColor;
  final double borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool? filled;
  final BoxConstraints? constraints;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final TextEditingController? searchController;
  final String? searchHintText;
  final Widget? customButton;
  final double? dropdownMaxHeight;
  final double? dropdownWidth;
  final BoxDecoration? dropdownDecoration;
  final bool autoFocus;
  final FocusNode? focusNode;
  final Widget? underline;

  // Title-related properties
  final String? title;
  final bool isRequired;
  final TextStyle? titleStyle;
  final bool showTitle;

  const CustomDropdown({
    required this.items,
    required this.hintText,
    required this.itemBuilder,
    this.value,
    this.onChanged,
    this.hintStyle,
    this.textStyle,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.disabledBorderColor = Colors.blue,
    this.enabledBorderColor = Colors.blue,
    this.dropdownIconColor = Colors.grey,
    this.borderWidth = 1.0,
    this.contentPadding,
    this.fillColor,
    this.filled,
    this.constraints,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconSize,
    this.searchController,
    this.searchHintText,
    this.customButton,
    this.dropdownMaxHeight,
    this.dropdownWidth,
    this.dropdownDecoration,
    this.autoFocus = false,
    this.focusNode,
    this.underline,
    this.title,
    this.isRequired = false,
    this.titleStyle,
    this.showTitle = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dropdown = DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        autofocus: autoFocus,
        focusNode: focusNode,
        underline: underline,
        hint: Row(
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  prefixIcon,
                  color: prefixIconColor,
                  size: prefixIconSize,
                ),
              ),
            Text(
              hintText,
              style: hintStyle ??
                  const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        value: value,
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: itemBuilder(item),
          );
        }).toList(),
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: enabledBorderColor, width: borderWidth),
            color: fillColor,
          ),
          padding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: 50,
          width: double.infinity,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.arrow_drop_down, color: dropdownIconColor),
          iconSize: 24,
        ),
        selectedItemBuilder: (context) {
          return items.map((item) {
            return Row(
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      prefixIcon,
                      color: prefixIconColor,
                      size: prefixIconSize,
                    ),
                  ),
                itemBuilder(item),
              ],
            );
          }).toList();
        },
        dropdownStyleData: DropdownStyleData(
          maxHeight: dropdownMaxHeight ?? 200,
          width: dropdownWidth,
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor, width: borderWidth),
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
          offset: const Offset(0, -5),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all(6),
            thumbVisibility: WidgetStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 14),
        ),
        style: textStyle ?? const TextStyle(color: Colors.black, fontSize: 14),
        customButton: customButton,
      ),
    );

    if (!showTitle || title == null) return dropdown;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: titleStyle ??
                const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
            children: isRequired
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(height: 4),
        dropdown,
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool softWrap;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextThemeStyle? textThemeStyle;

  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap = true,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.fontStyle,
    this.fontFamily,
    this.textThemeStyle,
  });

  // Factory constructors for different text styles
  factory CustomText.headlineLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.headlineLarge,
    );
  }

  factory CustomText.headlineMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.headlineMedium,
    );
  }

  factory CustomText.headlineSmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.headlineSmall,
    );
  }

  factory CustomText.titleLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.titleLarge,
    );
  }

  factory CustomText.titleMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.titleMedium,
    );
  }

  factory CustomText.titleSmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.titleSmall,
    );
  }

  factory CustomText.bodyLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.bodyLarge,
    );
  }

  factory CustomText.bodyMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.bodyMedium,
    );
  }

  factory CustomText.bodySmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.bodySmall,
    );
  }

  factory CustomText.labelLarge(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.labelLarge,
    );
  }

  factory CustomText.labelMedium(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.labelMedium,
    );
  }

  factory CustomText.labelSmall(
    String text, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool softWrap = true,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return CustomText(
      text,
      key: key,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
      textThemeStyle: TextThemeStyle.labelSmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine the base style from the textThemeStyle enum
    TextStyle baseStyle;

    switch (textThemeStyle) {
      case TextThemeStyle.headlineLarge:
        baseStyle =
            Theme.of(context).textTheme.headlineLarge ?? const TextStyle();
        break;
      case TextThemeStyle.headlineMedium:
        baseStyle =
            Theme.of(context).textTheme.headlineMedium ?? const TextStyle();
        break;
      case TextThemeStyle.headlineSmall:
        baseStyle =
            Theme.of(context).textTheme.headlineSmall ?? const TextStyle();
        break;
      case TextThemeStyle.titleLarge:
        baseStyle = Theme.of(context).textTheme.titleLarge ?? const TextStyle();
        break;
      case TextThemeStyle.titleMedium:
        baseStyle =
            Theme.of(context).textTheme.titleMedium ?? const TextStyle();
        break;
      case TextThemeStyle.titleSmall:
        baseStyle = Theme.of(context).textTheme.titleSmall ?? const TextStyle();
        break;
      case TextThemeStyle.bodyLarge:
        baseStyle = Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
        break;
      case TextThemeStyle.bodyMedium:
        baseStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
        break;
      case TextThemeStyle.bodySmall:
        baseStyle = Theme.of(context).textTheme.bodySmall ?? const TextStyle();
        break;
      case TextThemeStyle.labelLarge:
        baseStyle = Theme.of(context).textTheme.labelLarge ?? const TextStyle();
        break;
      case TextThemeStyle.labelMedium:
        baseStyle =
            Theme.of(context).textTheme.labelMedium ?? const TextStyle();
        break;
      case TextThemeStyle.labelSmall:
        baseStyle = Theme.of(context).textTheme.labelSmall ?? const TextStyle();
        break;
      default:
        baseStyle = Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
        break;
    }

    // Only apply custom style attributes if they are not null
    final TextStyle effectiveStyle = baseStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
    );

    // Merge with any provided style
    final TextStyle finalStyle =
        style != null ? effectiveStyle.merge(style) : effectiveStyle;

    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class CustomDatePicker {
  static Future<DateTime?> pick({
    required BuildContext context,
    required DatePickerModeEnum mode,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? dateFormat, // Optional custom format
  }) async {
    DateTime now = DateTime.now();

    initialDate ??= now;
    firstDate ??= DateTime(1900);
    lastDate ??= DateTime(2100);

    DateTime? selectedDate;

    if (mode == DatePickerModeEnum.date ||
        mode == DatePickerModeEnum.dateTime) {
      selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.teal, // Customize color
              ),
            ),
            child: child!,
          );
        },
      );
      if (selectedDate == null) return null;
    }

    if (mode == DatePickerModeEnum.time ||
        mode == DatePickerModeEnum.dateTime) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (time == null) return selectedDate ?? initialDate;

      final date = selectedDate ?? now;
      selectedDate =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    }

    return selectedDate;
  }

  static String formatDateTime(DateTime dateTime,
      {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(dateTime);
  }
}

class CustomTabBar extends StatefulWidget {
  final List<String> tabs;
  final Function(int) onTabSelected;
  final int initialIndex;
  final Color selectedTabColor;
  final Color unselectedTabColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool showBadge;
  final List<int> badgeCounts;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.onTabSelected,
    this.initialIndex = 0,
    this.selectedTabColor = const Color(0xFF00A884),
    this.unselectedTabColor = Colors.transparent,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.black87,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showBadge = false,
    this.badgeCounts = const [],
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = _selectedIndex == index;
          final hasValidBadgeCount = widget.showBadge &&
              widget.badgeCounts.length > index &&
              widget.badgeCounts[index] > 0;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onTabSelected(index);
              },
              child: Container(
                height: widget.height,
                decoration: BoxDecoration(
                  color: isSelected
                      ? widget.selectedTabColor
                      : widget.unselectedTabColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      widget.tabs[index],
                      style: isSelected
                          ? (widget.selectedLabelStyle ??
                              TextStyle(
                                color: widget.selectedTextColor,
                                fontWeight: FontWeight.bold,
                              ))
                          : (widget.unselectedLabelStyle ??
                              TextStyle(
                                color: widget.unselectedTextColor,
                                fontWeight: FontWeight.normal,
                              )),
                    ),
                    if (hasValidBadgeCount)
                      Positioned(
                        right: 10,
                        top: 5,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            widget.badgeCounts[index].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
