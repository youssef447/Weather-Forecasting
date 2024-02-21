import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      {super.key, required controller,
      required BuildContext context,
      bool isPassword = false,
      FocusNode? focusNode,
      TextInputType? type,
      bool? expand,
      String? helperText,
      Widget? label,
      bool readonly = false,
      bool filled = false,
      double radius = 0,
      IconData? prefix,
      IconData? suffix,
      Function()? onTap,
      Widget? prefixWidget,
      Widget? suffixWidget,
      String? labelText,
      bool? borderNone,
      String? Function(String?)? validate,
      Function(String)? onchanged,
      Function()? suffixPressed,
      String? hintText});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();

    /*TextFormField(
    validator: validate,
    controller: controller,


    obscureText: isPassword,
    keyboardType: type,
    readOnly: readonly,
    onTap: onTap,
    onChanged: onchanged,
    minLines: expand != null ? null : 1,
    maxLines: expand != null ? null : 1,
    expands: expand != null ? true : false,
    //style of search text
    style: Theme.of(context).textTheme.subtitle1!,
    //onFieldSubmitted: ((value) => print(contoller.text)),
    focusNode: focusNode,

    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.subtitle1!,
      helperText: helperText,
      label: label,
      helperMaxLines: 2,

      labelStyle:
          Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
      // focusColor: defaultColor,
      labelText: labelText,
      helperStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Colors.grey[400],
          ),

      /*  focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),),
         errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),), */

      filled: filled,

      fillColor: const Color(0xff21203e),
      prefixIcon: prefixWidget,

      prefixIconColor: Theme.of(context).iconTheme.color,

      suffixIcon: suffixWidget,

      /* IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffix,
          color: Colors.deepOrange,
        ),
      ), */
      //enabledBorder: InputBorder.,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            radius,
          )),
      border: UnderlineInputBorder(
          borderSide: borderNone != null ? BorderSide.none : const BorderSide(),
          borderRadius: BorderRadius.circular(
            radius,
          )),
    ),
  ); */
  }
}
