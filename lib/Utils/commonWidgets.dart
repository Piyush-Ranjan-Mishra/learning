import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';

class CustomTextField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController controller;
  final bool isEdit;
  final String label;
  final String hint;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Function(String) onChanged;
  final TextFieldType textType;
  final int focusNodeNumber;
  final List<FocusNode> focusNode;
  final Color borderColor;
  final Color textColor;
  final Function onSubmit;
  final String helperText;
  final String errorText;
  final int maxLenght;
  final int minLenght;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final DateTime initialValue;
  final double padding;
  final double borderRadius;
  const CustomTextField(this.context, this.controller, this.isEdit, this.label,
      this.hint, this.prefixIcon, this.suffixIcon, this.onChanged,
      {this.textType = TextFieldType.text,
      this.focusNodeNumber,
      this.focusNode,
      this.borderColor,
      this.textColor,
      this.onSubmit,
      this.helperText,
      this.errorText,
      this.maxLenght,
      this.minLenght,
      this.textCapitalization,
      this.inputFormatters,
      this.textInputAction,
      this.initialValue,
      this.padding = 8.0,
      this.borderRadius = 25.0,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color givenBorderColor = this.borderColor ?? iconColor;
    // debugPrints('textForm ${focusNode?.length} $focusNodeNumber');
    return Padding(
        padding: EdgeInsets.all(padding),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          onFieldSubmitted:
              focusNode != null && focusNodeNumber < focusNode.length - 1
                  ? (v) {
                      focusNode[focusNodeNumber].unfocus();
                      FocusScope.of(context)
                          .requestFocus(focusNode[focusNodeNumber + 1]);
                      if (onSubmit != null) onSubmit();
                    }
                  : null,
          maxLength: maxLenght,
          maxLengthEnforced: maxLenght != null,
          style: textColor == null ? null : TextStyle(color: textColor),
          inputFormatters: inputFormatters,
          keyboardType: textType == TextFieldType.number
              ? TextInputType.number
              : textType == TextFieldType.phone
                  ? TextInputType.phone
                  : textType == TextFieldType.email
                      ? TextInputType.emailAddress
                      : textType == TextFieldType.multiline
                          ? TextInputType.multiline
                          : textType == TextFieldType.url
                              ? TextInputType.url
                              : TextInputType.text,

          //style: TextStyle(color: Colors.black, height: 0.5),type== showComment?
          maxLines: textType == TextFieldType.multiline ? null : 1,
          obscureText: textType == TextFieldType.password,
          enableInteractiveSelection: textType != TextFieldType.password,
          focusNode: focusNode != null ? focusNode[focusNodeNumber] : null,
          textInputAction: focusNode != null
              ? focusNodeNumber < focusNode.length - 1
                  ? TextInputAction.next
                  : textInputAction ?? TextInputAction.done
              : textInputAction,
          decoration: InputDecoration(
            enabled: isEdit,
            prefixIcon: prefixIcon is Offstage
                ? null
                : prefixIcon == null
                    ? isEdit
                        ? IconButton(
                            icon: Icon(textType == TextFieldType.phone
                                ? Icons.contact_phone
                                : Icons.content_paste),
                            onPressed: () async {
                              if (controller != null) {
                                ClipboardData data =
                                    await Clipboard.getData('text/plain');
                                controller.text = data?.text ?? '';

                                if (onChanged != null)
                                  onChanged(controller.text);
                              }
                            },
                          )
                        : Offstage()
                    : prefixIcon,
            labelText: label,
            hintText: hint,
            helperText: helperText,
            helperMaxLines: helperText == null ? 0 : 3,
            errorText:
                minLenght != null && (controller?.text?.length ?? 0) < minLenght
                    ? (minLenght - (controller?.text?.length)).toString()
                    : errorText,
            errorMaxLines: errorText == null ? 0 : 3,
            suffixIcon: suffixIcon == null
                ? isEdit
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          if (controller != null) {
                            controller.clear();
                            if (onChanged != null) {
                              onChanged('');
                            }
                          }
                        },
                      )
                    : null
                : suffixIcon,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: givenBorderColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          ),
        ));
  }
}

class CircularIcon extends StatelessWidget {
  final IconData iconData;
  final String imageUrl;
  final double radius;
  final Color iconsColor;
  final Color backgroundColor;
  final double iconsPadding;
  const CircularIcon(this.iconData,
      {this.imageUrl,
      this.radius = 40,
      this.backgroundColor,
      this.iconsColor = iconColor,
      this.iconsPadding = 8,
      Key key})
      : assert(iconData != null || imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(iconsPadding),
      height: 2 * radius,
      width: 2 * radius,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          width: 1,
          color: Colors.grey[200],
        ),
      ),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: 2 * radius - 20,
              height: 2 * radius - 20,
            )
          : Icon(
              iconData,
              color: iconsColor,
              size: 2 * radius - 20,
            ),
    );
  }
}

class ExpandingHeader extends StatelessWidget {
  final String heading;
  final bool active;
  final Function() onTap;
  const ExpandingHeader(this.heading,
      {this.active = false, this.onTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: paddingStudentProfileCards,
        height: 70,
        color: primaryColor,
        child: Row(
          children: [
            Text(
              heading ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            Spacer(),
            Icon(
              active ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final Function() fn;
  final double padding;
  final double margin;

  const Buttons(this.text, this.fn,
      {this.padding = 20, this.margin = 10, Key key})
      : assert(text != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fn,
      child: Container(
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          border: Border.all(
            width: 1,
            color: iconColor,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}

class CardHeading extends StatelessWidget {
  final String title;
  final String imageUrl;
  final IconData icons;
  final double bottomPadding;

  const CardHeading(this.title, this.icons,
      {this.imageUrl, this.bottomPadding = 18.0, Key key})
      : assert(title != null),
        assert(icons != null || imageUrl != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.headline6.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w700,
        );

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, bottomPadding),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              text: title.toUpperCase().substring(0, 2),
              style: textStyle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: iconColor,
                  decorationStyle: TextDecorationStyle.solid),
              children: [
                TextSpan(
                  text: title.substring(2).toUpperCase(),
                  style: textStyle,
                ),
              ],
            ),
          ),
          Spacer(),
          CircularIcon(
            icons,
            imageUrl: imageUrl,
          ),
        ],
      ),
    );
  }
}

class TabularData extends StatelessWidget {
  final String title, subtitle;
  final double subTitleWidth;
  final bool isAlternateBackGroundNeeded;
  final bool isYellow;
  final TextStyle headingStyle, subTitleStyle;

  const TabularData(this.title, this.subtitle,
      {this.subTitleWidth = 180,
      this.headingStyle,
      this.subTitleStyle,
      this.isYellow = false,
      this.isAlternateBackGroundNeeded = false,
      Key key})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('headingTableBackground'),
      height: 40,
      color: isAlternateBackGroundNeeded
          ? rowAlternateBackgroundColor
          : Colors.transparent,
      child: Row(
        children: [
          if (title != null && subtitle != null)
            Text(
              title,
              style: headingStyle ??
                  TextStyle(
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                      fontSize: 18),
            ),
          Spacer(),
          if (subtitle != null)
            Container(
              width: subTitleWidth,
              child: Text(
                subtitle,
                textAlign: TextAlign.end,
                style: subTitleStyle ??
                    TextStyle(
                        color: isYellow ? iconColor : titleColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatefulWidget {
  final double value;
  final double minHeight;
  final double padding;
  final Color backgroundColor, foregroundColor;

  const ProgressBar(this.value,
      {this.backgroundColor = barBackgoundColor,
      this.foregroundColor = barActiveColor,
      this.minHeight = 30,
      this.padding = 10.0,
      Key key})
      : super(key: key);
  @override
  _ProgressBarState createState() => new _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: widget.value).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return new Container(
      padding: EdgeInsets.all(widget.padding),
      child: LinearProgressIndicator(
        value: animation.value,
        backgroundColor: widget.backgroundColor,
        minHeight: widget.minHeight,
        valueColor: new AlwaysStoppedAnimation<Color>(barActiveColor),
      ),
    );
  }
}

enum TextFieldType {
  text,
  number,
  phone,
  email,
  password,
  multiline,
  url,
  date,
  time,
  dateTime,
}
