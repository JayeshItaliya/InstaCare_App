import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/interText.dart';
import 'appColor.dart';


class AppWidget {
  OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
      borderSide:   BorderSide.none,
      borderRadius: BorderRadius.circular(30.0));
  OutlineInputBorder activeTextFieldBorderStyle = OutlineInputBorder(
      borderSide:   BorderSide.none,
      borderRadius: BorderRadius.circular(30.0));

  Widget getTextField({
    String? fieldTitleText,
    required String hintText,
    bool isPassword = false,
    TextEditingController? textEditingController,
    OutlineInputBorder? outlineInputBorder,
    UnderlineInputBorder? underlineInputBorder,
    OutlineInputBorder? activeOutlineInputBorder,
    UnderlineInputBorder? activeUnderLineInputBorder,
    Function? validationFunction,
    Function? onSavedFunction,
    Function? onFieldSubmit,
    TextInputType? keyboardType,
    Function? onEditingComplete,
    Function? onTapFunction,
    Function? onChangedFunction,
    TextAlign align = TextAlign.start,
    TextInputAction? inputAction,
    List<TextInputFormatter>? inputFormatter,
    bool? isEnabled,
    int? errorMaxLines,
    // String? initialText = "",
    int? maxLine,
    FocusNode? textFocusNode,
    GlobalKey<FormFieldState>? key,
    bool isReadOnly = false,
    Widget? suffixIcon,
    Widget? preFixIcon,
    Color? filledColor,
    EdgeInsetsGeometry? contentPadding,
    ScrollController? scrollController,
    TextStyle? hintStyle,
    TextStyle? inputTextStyle,
    TextStyle? labelStyle,
    String? label,
    bool? autofocus,
    String? obscringStyle,
    BuildContext? context,
    InputBorder? border,
    int? maxLength,
    Color? cursorColor,
    FontWeight? labelFontWeight,
    double? labelFontSize,
    Color? labelTextColor,
    TextAlign? labelTextAlign,
    FontWeight? hintFontWeight,
    double? hintFontSize,
    Color? hintTextColor,
    TextAlign? hintTextAlign,
    double? inputFontsize,
    FontWeight? inputFontWeight,
    Color? inputFontColor,
    bool isMobileNumber = false,
  }) {
    bool passwordVisible = isPassword;

    return StatefulBuilder(builder: (context, newSetState) {
      return TextFormField(
        scrollController: scrollController,
        maxLength: maxLength,

        toolbarOptions: const ToolbarOptions(
            selectAll: true, copy: true, cut: true, paste: true),
        // for scroll extra while keyboard open
        // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
        enabled: isEnabled != null && !isEnabled ? false : true,
        textAlign: align,
        showCursor: !isReadOnly,
        onTap: () {
          if (onTapFunction != null) {
            onTapFunction();
          }
        },

        key: key,
        focusNode: textFocusNode,
        onChanged: (value) {
          if (onChangedFunction != null) {
            onChangedFunction(value);
          }
        },
        onEditingComplete: () {
          if (onEditingComplete != null) {
            onEditingComplete();
          }
        },
        validator: (value) {
          return validationFunction != null ? validationFunction(value) : null;
        },
        onSaved: (value) {
          return onSavedFunction != null
              ? onSavedFunction(value)
              : FocusScope.of(context).unfocus();
        },
        onFieldSubmitted: (value) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          return onFieldSubmit != null
              ? onFieldSubmit(value)
              : FocusScope.of(context).unfocus();
        },

        maxLines: maxLine ?? 1,
        keyboardType: keyboardType,
        controller: textEditingController,
        cursorColor: cursorColor ?? AppColors.black,
        obscureText: passwordVisible,
        // obscuringCharacter: obscringStyle ?? '.',
        textInputAction: inputAction,
        style: inputTextStyle ??
            TextStyle(
              fontSize: inputFontsize ?? 17,
              fontWeight: inputFontWeight ?? FontWeight.w600,
              color: inputFontColor ?? AppColors.black,
            ),
        inputFormatters: inputFormatter,
        autofocus: true,

        decoration: InputDecoration(

          border: border,
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          errorMaxLines: errorMaxLines ?? 1,
          filled: true,
          label: InterText(
            text: label ?? "",
            fontWeight: labelFontWeight ?? FontWeight.w400,
            fontSize: labelFontSize ?? 15,
            textAlign: labelTextAlign ?? TextAlign.start,
          ),
          fillColor: filledColor ?? AppColors.backGroundColor,
          contentPadding: contentPadding ??
              const EdgeInsets.fromLTRB(20.0, 18.0, 0.0, 18.0),
          focusedBorder: activeUnderLineInputBorder ??
              activeOutlineInputBorder ??
              activeTextFieldBorderStyle,
          disabledBorder: underlineInputBorder ??
              outlineInputBorder ??
              textFieldBorderStyle,
          enabledBorder: underlineInputBorder ??
              outlineInputBorder ??
              textFieldBorderStyle,
          errorBorder: underlineInputBorder ??
              outlineInputBorder ??
              textFieldBorderStyle,
          focusedErrorBorder: underlineInputBorder ??
              outlineInputBorder ??
              textFieldBorderStyle,
          hintText: hintText ?? "",
          hintStyle: GoogleFonts.inter(
              fontSize: 16,
              color:Color.fromRGBO(2, 5, 10, 0.5),
              fontWeight: FontWeight.w400
          ),
          prefixIcon: isMobileNumber
              ? Container(
            width: 45,
            height: 0,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Center(
                  child: InterText(
                      text: '+91',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: VerticalDivider(
                    color: AppColors.buttonColor,
                    width: 2,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          )
              : preFixIcon,
          suffixIcon: isPassword
              ? InkWell(
              onTap: () {
                newSetState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: !passwordVisible
                  ? const Icon(
                CupertinoIcons.eye_slash,
                color: AppColors.buttonColor,
              )
                  : const Icon(
                CupertinoIcons.eye,
                color: AppColors.buttonColor,
              ))
              : suffixIcon ?? const SizedBox(),
        ),
      );
    });
  }
}