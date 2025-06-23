import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:custom_widgets_flutter/widgets/Buttons/button_colors_config.dart';
import 'package:custom_widgets_flutter/widgets/Buttons/button_size_config.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatefulWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final ButtonSize size;
  final IconData icon;
  final bool isLoading;
  final bool isDisabled;
  final bool isExtended;
  final Color? customBackgroundColor;
  final Color? customIconColor;
  final Color? customTextColor;
  final TextStyle? customTextStyle;
  final double? customElevation;
  final BorderRadius? customBorderRadius;
  final EdgeInsets? customPadding;
  final String? tooltip;
  final String? heroTag;
  final Duration? animationDuration;

  const CustomFloatingButton({
    super.key,
    this.text,
    this.onPressed,
    this.buttonType = ButtonType.floating,
    this.size = ButtonSize.medium,
    required this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.isExtended = false,
    this.customBackgroundColor,
    this.customIconColor,
    this.customTextColor,
    this.customTextStyle,
    this.customElevation,
    this.customBorderRadius,
    this.customPadding,
    this.tooltip,
    this.heroTag,
    this.animationDuration,
  });

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 200),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handlePress() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.customBackgroundColor ??
        ButtonColorConfig.getPrimaryColor(widget.buttonType);
    final iconColor =
        widget.customIconColor ??
        ButtonColorConfig.getTextColor(widget.buttonType);
    final textColor = widget.customTextColor ?? iconColor;
    final isDisabled = widget.isDisabled || widget.onPressed == null;

    Widget iconWidget = widget.isLoading
        ? SizedBox(
            width: ButtonSizeConfig.getIconSize(widget.size),
            height: ButtonSizeConfig.getIconSize(widget.size),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(iconColor),
            ),
          )
        : Icon(
            widget.icon,
            size: ButtonSizeConfig.getIconSize(widget.size),
            color: iconColor,
          );

    Widget fab = AnimatedBuilder(
      animation: _rotationAnimation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: widget.isExtended && widget.text != null
              ? FloatingActionButton.extended(
                  onPressed: isDisabled ? null : _handlePress,
                  backgroundColor: isDisabled
                      ? Colors.grey.shade300
                      : backgroundColor,
                  foregroundColor: iconColor,
                  elevation: widget.customElevation ?? (isDisabled ? 0 : 6),
                  heroTag: widget.heroTag,
                  icon: iconWidget,
                  label: Text(
                    widget.text!,
                    style:
                        widget.customTextStyle ??
                        TextStyle(
                          fontSize: ButtonSizeConfig.getFontSize(widget.size),
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                  ),
                )
              : FloatingActionButton(
                  onPressed: isDisabled ? null : _handlePress,
                  backgroundColor: isDisabled
                      ? Colors.grey.shade300
                      : backgroundColor,
                  foregroundColor: iconColor,
                  elevation: widget.customElevation ?? (isDisabled ? 0 : 6),
                  heroTag: widget.heroTag,
                  child: iconWidget,
                ),
        );
      },
    );

    return widget.tooltip != null
        ? Tooltip(message: widget.tooltip!, child: fab)
        : fab;
  }
}
