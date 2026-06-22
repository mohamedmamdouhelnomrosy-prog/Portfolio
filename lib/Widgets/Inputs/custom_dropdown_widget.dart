import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Core/Language/app_styles.dart';
import 'app_text_widget.dart';

class CustomDropDownWidget<T> extends StatelessWidget {
  final Function()? clear;
  final Widget? suffixIcon, prefixIcon, icon;
  final Color? borderColor, borderFocusColor, backgroundColor, hintColor;
  final Color backgroundHoverColor;
  final Color? textHoverColor, borderHoverColor;
  final double? width, height, borderRadius;
  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final bool enable, autoFocus;
  final TextStyle? hintStyle;
  final void Function(T?) onChange;
  final String? hint, title;
  final String? Function(dynamic)? validate;
  final FocusNode? focusNode;
  final String? labelText;

  const CustomDropDownWidget({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.icon,
    this.selected,
    this.borderRadius,
    this.enable = true,
    this.autoFocus = false,
    required this.onChange,
    this.hint,
    this.hintStyle,
    this.validate,
    this.width,
    this.height,
    this.borderFocusColor,
    this.items = const [],
    this.borderColor,
    this.backgroundColor,
    this.hintColor,
    this.textHoverColor,
    this.backgroundHoverColor = Colors.transparent,
    this.borderHoverColor,
    this.focusNode,
    this.labelText,
    this.clear,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    InputBorder? getBorder({double? radius, Color? color}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 12.0),
        borderSide: BorderSide(
          color: color ?? colors.text2,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          AppTextWidget(
            title!,
            style: AppTextStyles.regular14().copyWith(color: colors.text1),
          ),
          20.0.heightBox
        ],
        SizedBox(
            width: width ?? 380.0,
            // height: height ?? 56.0,
            child: DropdownButtonFormField<T>(
              menuMaxHeight: 240.0,
              autofocus: autoFocus,
              isExpanded: true,
              focusNode: focusNode,
              icon: icon,
              itemHeight:
                  (height ?? 48.0) > kMinInteractiveDimension ? height : null,
              focusColor: Colors.transparent,
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 10.0)),
              validator: validate,
              iconSize: 0.0,
              value: selected,
              style: AppTextStyles.regular14(),
              dropdownColor: colors.background,
              decoration: InputDecoration(
                errorStyle: const TextStyle(height: 0),
                // labelText: labelText ?? hint,
                // labelStyle: TextStyleHelper.of(context).bodyMedium14,
                enabledBorder: getBorder(color: borderColor),
                disabledBorder: getBorder(color: borderColor),
                focusedBorder: getBorder(),
                border: getBorder(),
                // disabledBorder: getBorder,
                // border: getBorder,
                // enabledBorder: getBorder.copyWith(
                //     borderSide: BorderSide(
                //         color: borderFocusColor ??
                //             borderColor ??
                //             ThemeModel.of(context).font3)),
                // focusedBorder: defaultBorder.copyWith(
                //     borderSide:
                //         BorderSide(color: ThemeModel.of(context).primary)),
                errorBorder: getBorder(),
                contentPadding: EdgeInsets.only(
                  top: context.isSmall ? 12.0 : 16.0,
                  bottom: context.isSmall ? 12.0 : 16.0,
                  left: 24.0,
                  right: 24.0,
                ),
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 48.0, maxWidth: 48.0),
                enabled: enable,
                prefixIcon: clear != null
                    ? GestureDetector(
                        onTap: clear,
                        child: Icon(
                          CupertinoIcons.xmark_circle,
                          color: colors.danger,
                          size: 20.0,
                        ),
                      )
                    : prefixIcon,
                suffixIcon: !enable
                    ? null
                    : Center(
                        child: suffixIcon ??
                            SvgPicture.asset(
                              "",
                              colorFilter: ColorFilter.mode(
                                hintColor ?? colors.text1,
                                BlendMode.srcIn,
                              ),
                            ),
                      ),
                filled: true,
                fillColor: enable ? colors.surface : colors.text2,
                hintText: hint,
                hintStyle: context.isSmall
                    ? hintStyle?.copyWith(
                            color: hintColor ?? hintStyle?.color, height: 1) ??
                        AppTextStyles.regular14().copyWith(color: colors.text2)
                    : hintStyle?.copyWith(
                            color: hintColor ?? hintStyle?.color, height: 1) ??
                        AppTextStyles.regular14().copyWith(color: colors.text2),
              ),
              items: items,
              onChanged: enable ? onChange : null,
              onSaved: enable ? onChange : null,
            )),
      ],
    );
  }
}
