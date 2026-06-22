import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utilities/extensions.dart';

/*class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final bool? readOnly;
  final String? hint;
  final String? lableText;
  final Color? backGroundColor, focusedBorderColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine, minLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isDense;
  final Color? borderColor;
  final bool disableBorder;
  final bool alignLabelWithHint;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final double? borderRadiusValue, width, height;
  final void Function(String?)? onSave;
  final Widget? prefixIcon, suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final void Function(String)? onchange;
  final List<TextInputFormatter>? formatter;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final bool? expands;
  final bool enable,
      isClickable,
      autoFocus,
      cancelDisableBackground,
      disableLabel;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  const CustomTextFormField(
      {super.key,
      this.isDense,
      this.style,
      this.onchange,
      this.lableText,
      this.validator,
      this.maxLine,
      this.hint,
      this.backGroundColor,
      this.controller,
      this.obscure = false,
      this.suffixIconConstraints,
      this.prefixIconConstraints,
      this.enable = true,
      this.textDirection,
      this.readOnly = false,
      this.disableLabel = false,
      this.textInputType = TextInputType.text,
      this.borderColor,
      this.borderRadiusValue,
      this.nextFocusNode,
      this.prefixIcon,
      this.width,
      this.hintStyle,
      this.suffixIcon,
      this.height,
      this.formatter,
      this.focusNode,
      this.focusedBorderColor,
      this.onSave,
      this.minLines,
      this.disableBorder = false,
      this.textInputAction,
      this.expands,
      this.isClickable = false,
      this.alignLabelWithHint = false,
      this.autoFocus = false,
      this.cancelDisableBackground = false,
      this.textAlign = TextAlign.start,
      this.onTap});

  InputBorder? getBorder(BuildContext context,
      {double? radius, Color? color, double? width}) {
    if (disableBorder) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 16.0),
      borderSide: BorderSide(
        color: color ?? colors.secondary,
        width: width ?? 1.0,
      ),
    );
  }

  void _handleFieldSubmitted(BuildContext context) {
    if (nextFocusNode != null) {
      nextFocusNode!.requestFocus();
    } else if (onSave != null) {
      onSave!(controller?.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      */ /*  height: height ??
          (context.isLarge
              ? 56
              : context.isMedium
                  ? 48
                  : 40), */ /*
      width: width ?? 380.w,
      child: TextFormField(
        keyboardType: textInputType,
        onChanged: onchange,
        style: AppTextStyles.textFormFieldContent.copyWith(
              color: colors.secondary,
            ),
        enabled: enable,
        controller: controller,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.start,
        autofocus: autoFocus,
        mouseCursor: isClickable ? SystemMouseCursors.click : null,
        cursorColor: colors.secondary,
        onTap: onTap,
        onFieldSubmitted: (_) => _handleFieldSubmitted(context),
        textInputAction: textInputAction ??
            (nextFocusNode != null
                ? TextInputAction.next
                : onSave != null
                    ? TextInputAction.done
                    : TextInputAction.next),
        focusNode: focusNode,
        readOnly: readOnly ?? false,
        textAlignVertical: TextAlignVertical.center,
        validator: validator,
        inputFormatters: formatter,
        obscureText: obscure ?? false,
        expands: expands ?? false,
        maxLines: maxLine ?? 1,
        minLines: minLines ?? 1,
        decoration: InputDecoration(
          suffixIcon: suffixIcon?.paddingSymmetric(horizontal: 16),
          suffixIconConstraints: suffixIconConstraints ??
              const BoxConstraints(
                maxHeight: 32.0,
                maxWidth: 60,
              ),
          prefixIconConstraints: prefixIconConstraints ??
              const BoxConstraints(
                maxHeight: 32.0,
                maxWidth: 56,
              ),
          labelText: lableText,
          labelStyle:
              AppTextStyles.textFormFieldLableTitle.copyWith(
                    color: colors.secondary,
                  ),
          errorStyle:
              AppTextStyles.textFormFieldErrorMessage.copyWith(
                    color: colors.secondaryCyan,
                  ),
          enabledBorder:
              getBorder(context, radius: borderRadiusValue, color: borderColor),
          disabledBorder:
              getBorder(context, radius: borderRadiusValue, color: borderColor),
          focusedBorder:
              getBorder(context, radius: borderRadiusValue, color: borderColor),
          border:
              getBorder(context, radius: borderRadiusValue, color: borderColor),
          focusedErrorBorder: getBorder(context,
              radius: borderRadiusValue,
              color: colors.secondary),
          isDense: isDense ?? false,
          fillColor: (backGroundColor ?? colors.background),
          filled: true,
          hintText: hint,
          alignLabelWithHint: alignLabelWithHint,
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.w),
          prefixIcon: prefixIcon,
          hintStyle: hintStyle ??
              AppTextStyles.textFormFieldHint.copyWith(
                    color: colors.primary75,
                  ),
        ),
      ),
    );
  }
}*/

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscure;
  final bool? readOnly;
  final String? hint;
  final String? lableText;
  final Color? backGroundColor, focusedBorderColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLine, minLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? isDense;
  final Color? borderColor;
  final bool disableBorder;
  final bool alignLabelWithHint;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final double? borderRadiusValue, width, height;
  final void Function(String?)? onSave;
  final Widget? prefixIcon, suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final void Function(String)? onchange;
  final List<TextInputFormatter>? formatter;
  final void Function()? onTap;
  final TextInputAction? textInputAction;
  final bool? expands;
  final bool enable,
      isClickable,
      autoFocus,
      cancelDisableBackground,
      disableLabel;
  final TextDirection? textDirection;
  final TextAlign? textAlign;

  const CustomTextFormField(
      {super.key,
      this.isDense,
      this.style,
      this.onchange,
      this.lableText,
      this.validator,
      this.maxLine,
      this.hint,
      this.backGroundColor,
      this.controller,
      this.obscure = false,
      this.suffixIconConstraints,
      this.prefixIconConstraints,
      this.enable = true,
      this.textDirection,
      this.readOnly = false,
      this.disableLabel = false,
      this.textInputType = TextInputType.text,
      this.borderColor,
      this.borderRadiusValue,
      this.nextFocusNode,
      this.prefixIcon,
      this.width,
      this.hintStyle,
      this.suffixIcon,
      this.height,
      this.formatter,
      this.focusNode,
      this.focusedBorderColor,
      this.onSave,
      this.minLines,
      this.disableBorder = false,
      this.textInputAction,
      this.expands,
      this.isClickable = false,
      this.alignLabelWithHint = false,
      this.autoFocus = false,
      this.cancelDisableBackground = false,
      this.textAlign = TextAlign.start,
      this.onTap});

  InputBorder? getBorder(BuildContext context,
      {double? radius, Color? color, double? width}) {
    if (disableBorder) return null;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 100.0),
      borderSide: BorderSide(
        color: color ?? context.colors.secondary,
        width: width ?? 1.0,
      ),
    );
  }

  void _handleFieldSubmitted(BuildContext context) {
    if (nextFocusNode != null) {
      nextFocusNode!.requestFocus();
    } else if (onSave != null) {
      onSave!(controller?.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TextFormField(
      keyboardType: textInputType,
      onChanged: onchange,
      enabled: enable,
      controller: controller,
      textDirection: textDirection,
      textAlign: textAlign ?? TextAlign.start,
      autofocus: autoFocus,
      mouseCursor: isClickable ? SystemMouseCursors.click : null,
      cursorColor: colors.secondary,
      onTap: onTap,
      onFieldSubmitted: (_) => _handleFieldSubmitted(context),
      textInputAction: textInputAction ??
          (nextFocusNode != null
              ? TextInputAction.next
              : onSave != null
                  ? TextInputAction.done
                  : TextInputAction.next),
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      textAlignVertical: TextAlignVertical.center,
      validator: validator,
      inputFormatters: formatter,
      obscureText: obscure ?? false,
      expands: expands ?? false,
      maxLines: maxLine ?? 1,
      minLines: minLines ?? 1,
      decoration: InputDecoration(
        suffixIcon: suffixIcon?.paddingSymmetric(horizontal: 16),
        suffixIconConstraints: suffixIconConstraints ??
            const BoxConstraints(
              maxHeight: 32.0,
              maxWidth: 60,
            ),
        prefixIconConstraints: prefixIconConstraints ??
            const BoxConstraints(
              maxHeight: 32.0,
              maxWidth: 56,
            ),
        labelText: lableText,
        //  labelStyle:
        // AppTextStyles.textFormFieldLableTitle.copyWith(
        //   color: colors.secondary,
        // ),
        // errorStyle:
        // AppTextStyles.textFormFieldErrorMessage.copyWith(
        //   color: colors.secondaryCyan,
        // ),
        enabledBorder:
            getBorder(context, radius: borderRadiusValue, color: borderColor),
        disabledBorder:
            getBorder(context, radius: borderRadiusValue, color: borderColor),
        focusedBorder:
            getBorder(context, radius: borderRadiusValue, color: borderColor),
        border:
            getBorder(context, radius: borderRadiusValue, color: borderColor),
        focusedErrorBorder:
            getBorder(context, radius: borderRadiusValue, color: Colors.red),
        isDense: isDense ?? false,
        fillColor: backGroundColor ?? colors.surface,
        filled: true,
        hintText: hint,
        alignLabelWithHint: alignLabelWithHint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
        prefixIcon: prefixIcon,
        // hintStyle: hintStyle ??
        //     AppTextStyles.textFormFieldHint.copyWith(
        //       color: colors.primary75,
        //     ),
      ),
    );
  }
}
