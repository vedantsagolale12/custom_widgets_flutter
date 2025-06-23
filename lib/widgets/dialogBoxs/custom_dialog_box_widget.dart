import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:custom_widgets_flutter/widgets/text/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String message;
  final DialogType dialogType;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String confirmText;
  final String cancelText;
  final bool showCancelButton;
  final ColorVariant colorVariant;
  final AppThemeMode themeMode;

  const CustomDialogBox({
    super.key,
    required this.title,
    required this.message,
    this.dialogType = DialogType.alert,
    this.onConfirm,
    this.onCancel,
    this.confirmText = 'OK',
    this.cancelText = 'Cancel',
    this.showCancelButton = false,
    this.colorVariant = ColorVariant.primary,
    this.themeMode = AppThemeMode.system,
  });

  Color _getColor(BuildContext context) {
    switch (colorVariant) {
      case ColorVariant.primary:
        return Theme.of(context).colorScheme.primary;
      case ColorVariant.error:
        return Theme.of(context).colorScheme.error;
      case ColorVariant.success:
        return Colors.green;
      case ColorVariant.warning:
        return Colors.orange;
      case ColorVariant.info:
        return Colors.blue;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          textType: TextType.heading3,
          fontWeight: FontWeightType.bold,
          color: color,
        ),
        const SizedBox(height: 12),
        CustomText(text: message, textType: TextType.body1),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (showCancelButton)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onCancel?.call();
                },
                child: Text(cancelText),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
              style: ElevatedButton.styleFrom(backgroundColor: color),
              child: Text(confirmText),
            ),
          ],
        ),
      ],
    );

    switch (dialogType) {
      case DialogType.alert:
      case DialogType.confirm:
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: content,
        );
      case DialogType.bottomSheet:
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: content,
        );
      case DialogType.drawer:
        return Drawer(child: SafeArea(child: content));
      case DialogType.fullscreen:
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.5),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: content,
            ),
          ),
        );
      case DialogType.custom:
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(padding: const EdgeInsets.all(16), child: content),
        );
    }
  }
}
