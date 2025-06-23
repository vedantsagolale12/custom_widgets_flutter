import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:custom_widgets_flutter/widgets/Buttons/button_colors_config.dart';
import 'package:custom_widgets_flutter/widgets/Buttons/button_size_config.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final TextStyle? customTextStyle;
  final double? customElevation;
  final BorderRadius? customBorderRadius;
  final EdgeInsets? customPadding;
  final double? width;
  final double? height;
  final String? tooltip;
  final Duration? animationDuration;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonType = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.customBackgroundColor,
    this.customTextColor,
    this.customTextStyle,
    this.customElevation,
    this.customBorderRadius,
    this.customPadding,
    this.width,
    this.height,
    this.tooltip,
    this.animationDuration,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _handleTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.customBackgroundColor ??
        ButtonColorConfig.getPrimaryColor(widget.buttonType);
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
                Icon(
                  widget.icon,
                  size: ButtonSizeConfig.getIconSize(widget.size),
                  color: textColor,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style:
                    widget.customTextStyle ??
                    TextStyle(
                      fontSize: ButtonSizeConfig.getFontSize(widget.size),
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
              ),
            ],
          );

    Widget button = AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: ElevatedButton(
              onPressed: isDisabled ? null : widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDisabled
                    ? Colors.grey.shade300
                    : backgroundColor,
                foregroundColor: textColor,
                elevation: widget.customElevation ?? (isDisabled ? 0 : 2),
                padding:
                    widget.customPadding ??
                    ButtonSizeConfig.getPadding(widget.size),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      widget.customBorderRadius ?? BorderRadius.circular(8),
                ),
                disabledBackgroundColor: Colors.grey.shade300,
                disabledForegroundColor: Colors.grey.shade600,
              ),
              child: buttonChild,
            ),
          ),
        );
      },
    );

    return GestureDetector(
      onTapDown: isDisabled ? null : _handleTapDown,
      onTapUp: isDisabled ? null : _handleTapUp,
      onTapCancel: isDisabled ? null : _handleTapCancel,
      child: widget.tooltip != null
          ? Tooltip(message: widget.tooltip!, child: button)
          : button,
    );
  }
}
