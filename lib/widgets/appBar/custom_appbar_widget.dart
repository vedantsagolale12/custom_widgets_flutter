import 'dart:ui';
import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:custom_widgets_flutter/widgets/appBar/appbar_action_item.dart';
import 'package:custom_widgets_flutter/widgets/appBar/appbar_color_config.dart';
import 'package:custom_widgets_flutter/widgets/appBar/appbar_size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final AppBarType appBarType;
  final AppBarSize size;
  final AppBarPosition position;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final List<AppBarActionItem> actions;
  final bool showBackButton;
  final bool centerTitle;
  final double? elevation;
  final Color? customBackgroundColor;
  final Color? customTextColor;
  final Color? customIconColor;
  final TextStyle? customTitleStyle;
  final Gradient? customGradient;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Widget? flexibleSpace;
  final bool automaticallyImplyLeading;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool isSearchMode;
  final TextEditingController? searchController;
  final String? searchHint;
  final VoidCallback? onSearchToggle;
  final Function(String)? onSearchChanged;
  final bool showShadow;
  final List<Widget>? bottomWidgets; // For bottom items when used as bottom bar
  final Duration? animationDuration;
  final bool enableGlassEffect;
  final double? blurIntensity;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.appBarType = AppBarType.primary,
    this.size = AppBarSize.medium,
    this.position = AppBarPosition.top,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actions = const [],
    this.showBackButton = true,
    this.centerTitle = true,
    this.elevation,
    this.customBackgroundColor,
    this.customTextColor,
    this.customIconColor,
    this.customTitleStyle,
    this.customGradient,
    this.borderRadius,
    this.padding,
    this.flexibleSpace,
    this.automaticallyImplyLeading = true,
    this.systemOverlayStyle,
    this.isSearchMode = false,
    this.searchController,
    this.searchHint,
    this.onSearchToggle,
    this.onSearchChanged,
    this.showShadow = true,
    this.bottomWidgets,
    this.animationDuration,
    this.enableGlassEffect = false,
    this.blurIntensity = 10.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(AppBarSizeConfig.getHeight(size));

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _searchController = widget.searchController ?? TextEditingController();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (widget.searchController == null) {
      _searchController.dispose();
    }
    super.dispose();
  }

  Color get _backgroundColor {
    if (widget.customBackgroundColor != null) {
      return widget.customBackgroundColor!;
    }
    return AppBarColorConfig.getPrimaryColor(widget.appBarType);
  }

  Color get _textColor {
    if (widget.customTextColor != null) {
      return widget.customTextColor!;
    }
    return AppBarColorConfig.getTextColor(widget.appBarType);
  }

  Color get _iconColor {
    if (widget.customIconColor != null) {
      return widget.customIconColor!;
    }
    return AppBarColorConfig.getTextColor(widget.appBarType);
  }

  Widget _buildActionItem(AppBarActionItem item) {
    Widget actionWidget = item.isLoading
        ? SizedBox(
            width: AppBarSizeConfig.getIconSize(widget.size),
            height: AppBarSizeConfig.getIconSize(widget.size),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                item.iconColor ?? _iconColor,
              ),
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                item.icon,
                size: AppBarSizeConfig.getIconSize(widget.size),
                color: item.iconColor ?? _iconColor,
              ),
              if (item.text != null) ...[
                SizedBox(height: 2),
                Text(
                  item.text!,
                  style: TextStyle(
                    fontSize: 10,
                    color: item.textColor ?? _textColor,
                  ),
                ),
              ],
            ],
          );

    if (item.showBadge) {
      actionWidget = Stack(
        children: [
          actionWidget,
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: item.badgeColor ?? Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                item.badgeText ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    }

    return InkWell(
      onTap: item.onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(8),
        child: item.tooltip != null
            ? Tooltip(message: item.tooltip!, child: actionWidget)
            : actionWidget,
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: widget.onSearchChanged,
        style: TextStyle(color: _textColor),
        decoration: InputDecoration(
          hintText: widget.searchHint ?? 'Search...',
          hintStyle: TextStyle(color: _textColor.withOpacity(0.7)),
          prefixIcon: Icon(Icons.search, color: _iconColor),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, color: _iconColor),
            onPressed: widget.onSearchToggle,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildAppBarContent() {
    return Container(
      height: AppBarSizeConfig.getHeight(widget.size),
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Leading
          if (widget.leadingIcon != null ||
              (widget.showBackButton &&
                  widget.automaticallyImplyLeading &&
                  Navigator.canPop(context)))
            IconButton(
              icon: Icon(
                widget.leadingIcon ?? Icons.arrow_back,
                color: _iconColor,
                size: AppBarSizeConfig.getIconSize(widget.size),
              ),
              onPressed:
                  widget.onLeadingPressed ??
                  (widget.showBackButton ? () => Navigator.pop(context) : null),
            ),

          // Title or Search
          Expanded(
            child: widget.isSearchMode
                ? _buildSearchField()
                : widget.titleWidget ??
                      Text(
                        widget.title ?? '',
                        style:
                            widget.customTitleStyle ??
                            TextStyle(
                              fontSize: AppBarSizeConfig.getFontSize(
                                widget.size,
                              ),
                              fontWeight: FontWeight.w600,
                              color: _textColor,
                            ),
                        textAlign: widget.centerTitle
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
          ),

          // Actions
          ...widget.actions.map(_buildActionItem),
        ],
      ),
    );
  }

  Widget _buildBottomContent() {
    if (widget.bottomWidgets == null || widget.bottomWidgets!.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.bottomWidgets!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget appBarWidget = AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        Widget content = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.position == AppBarPosition.top ||
                widget.position == AppBarPosition.floating)
              _buildAppBarContent(),
            if (widget.position == AppBarPosition.bottom &&
                widget.bottomWidgets != null)
              _buildBottomContent(),
            if (widget.position == AppBarPosition.bottom &&
                widget.bottomWidgets == null)
              _buildAppBarContent(),
          ],
        );

        // Apply glass effect if enabled
        if (widget.enableGlassEffect || widget.appBarType == AppBarType.glass) {
          content = ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.zero,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: widget.blurIntensity ?? 10.0,
                sigmaY: widget.blurIntensity ?? 10.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: _backgroundColor.withOpacity(0.3),
                  borderRadius: widget.borderRadius,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: content,
              ),
            ),
          );
        } else {
          // Apply gradient or solid color background
          BoxDecoration decoration;
          if (widget.customGradient != null ||
              widget.appBarType == AppBarType.gradient) {
            decoration = BoxDecoration(
              gradient:
                  widget.customGradient ??
                  LinearGradient(
                    colors: [
                      _backgroundColor,
                      _backgroundColor.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
              borderRadius: widget.borderRadius,
              boxShadow: widget.showShadow
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ]
                  : null,
            );
          } else {
            decoration = BoxDecoration(
              color: _backgroundColor,
              borderRadius: widget.borderRadius,
              boxShadow: widget.showShadow
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ]
                  : null,
            );
          }

          content = Container(decoration: decoration, child: content);
        }

        // Apply animations
        return Transform.translate(
          offset: Offset(
            0,
            _slideAnimation.value * AppBarSizeConfig.getHeight(widget.size),
          ),
          child: FadeTransition(opacity: _fadeAnimation, child: content),
        );
      },
    );

    // Handle positioning
    if (widget.position == AppBarPosition.floating) {
      return Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 16,
        right: 16,
        child: Material(
          elevation: widget.elevation ?? 4,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          child: appBarWidget,
        ),
      );
    }

    // For top position, wrap in AppBar for proper behavior
    if (widget.position == AppBarPosition.top) {
      return AppBar(
        toolbarHeight: AppBarSizeConfig.getHeight(widget.size),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: widget.systemOverlayStyle,
        flexibleSpace: widget.flexibleSpace ?? appBarWidget,
      );
    }

    // For bottom position, return the widget directly
    return appBarWidget;
  }
}

// Helper widget for using CustomAppBar as BottomAppBar
class CustomBottomAppBar extends StatelessWidget {
  final CustomAppBar appBar;

  const CustomBottomAppBar({super.key, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: appBar.preferredSize.height,
      padding: EdgeInsets.zero,
      child: appBar,
    );
  }
}
