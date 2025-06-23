import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:custom_widgets_flutter/widgets/Buttons/button_colors_config.dart';
import 'package:custom_widgets_flutter/widgets/Buttons/button_size_config.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final Color? customTextColor;
  final Color? customBackgroundColor;
  final TextStyle? customTextStyle;
  final BorderRadius? customBorderRadius;
  final EdgeInsets? customPadding;
  final double? width;
  final double? height;
  final String? tooltip;
  final Duration? animationDuration;
  final TextDecoration? textDecoration;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonType = ButtonType.link,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.customTextColor,
    this.customBackgroundColor,
    this.customTextStyle,
    this.customBorderRadius,
    this.customPadding,
    this.width,
    this.height,
    this.tooltip,
    this.animationDuration,
    this.textDecoration,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 200),
      vsync: this,
    );

    final baseColor =
        widget.customTextColor ??
        ButtonColorConfig.getTextColor(widget.buttonType);

    _colorAnimation = ColorTween(
      begin: baseColor,
      end: baseColor.withOpacity(0.7),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor =
        widget.customTextColor ??
        ButtonColorConfig.getTextColor(widget.buttonType);
    final isDisabled = widget.isDisabled || widget.onPressed == null;

    Widget buttonChild = widget.isLoading
        ? SizedBox(
            width: ButtonSizeConfig.getIconSize(widget.size),
            height: ButtonSizeConfig.getIconSize(widget.size),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                AnimatedBuilder(
                  animation: _colorAnimation,
                  builder: (context, child) {
                    return Icon(
                      widget.icon,
                      size: ButtonSizeConfig.getIconSize(widget.size),
                      color: isDisabled
                          ? Colors.grey.shade400
                          : _colorAnimation.value ?? textColor,
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
              AnimatedBuilder(
                animation: _colorAnimation,
                builder: (context, child) {
                  return Text(
                    widget.text,
                    style:
                        widget.customTextStyle ??
                        TextStyle(
                          fontSize: ButtonSizeConfig.getFontSize(widget.size),
                          fontWeight: FontWeight.w500,
                          color: isDisabled
                              ? Colors.grey.shade400
                              : _colorAnimation.value ?? textColor,
                          decoration:
                              widget.textDecoration ??
                              (widget.buttonType == ButtonType.link &&
                                      _isHovered
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                        ),
                  );
                },
              ),
            ],
          );

    Widget button = SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        onPressed: isDisabled ? null : widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: widget.customBackgroundColor,
          padding:
              widget.customPadding ?? ButtonSizeConfig.getPadding(widget.size),
          shape: RoundedRectangleBorder(
            borderRadius: widget.customBorderRadius ?? BorderRadius.circular(4),
          ),
        ),
        child: buttonChild,
      ),
    );

    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: widget.tooltip != null
          ? Tooltip(message: widget.tooltip!, child: button)
          : button,
    );
  }
}
