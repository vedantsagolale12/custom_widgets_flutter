// ===== BUTTON & INTERACTIVE ELEMENTS =====

/// Button types for different UI contexts
enum ButtonType {
  primary,
  secondary,
  tertiary,
  error,
  success,
  warning,
  info,
  outline,
  ghost,
  link,
  floating, // For FABs
  icon, // Icon-only buttons
}

/// Button sizes for consistent scaling
enum ButtonSize { mini, small, medium, large, extraLarge }

/// Interactive element states
enum InteractionState { idle, hover, pressed, focused, disabled, loading }

// ===== THEME & APPEARANCE =====

/// App theme modes
enum AppThemeMode { light, dark, system, highContrast, sepia }

/// Color variants for semantic meanings
enum ColorVariant {
  primary,
  secondary,
  accent,
  neutral,
  success,
  warning,
  error,
  info,
}

/// Opacity levels for layering and transparency
enum OpacityLevel { transparent, faint, light, medium, strong, opaque }

// ===== TYPOGRAPHY =====

/// Text types for comprehensive typography system
enum TextType {
  display, // Largest headlines
  heading1,
  heading2,
  heading3,
  heading4,
  subtitle1,
  subtitle2,
  body1,
  body2,
  caption,
  overline,
  button,
  label,
  tooltip,
  code, // Monospace text
  link, // Styled links
}

/// Font weight types
enum FontWeightType {
  thin, // 100
  extraLight, // 200
  light, // 300
  regular, // 400
  medium, // 500
  semiBold, // 600
  bold, // 700
  extraBold, // 800
  black, // 900
}

/// Text alignment options
enum TextAlignType { left, center, right, justify, start, end }

/// Text decoration styles
enum AppTextDecoration { none, underline, overline, lineThrough }

/// Text transform options
enum TextTransform { none, uppercase, lowercase, capitalize }

// ===== LAYOUT & POSITIONING =====

/// Layout orientations
enum LayoutOrientation { horizontal, vertical }

/// Flex alignment options
enum FlexAlignment {
  start,
  center,
  end,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

/// Cross-axis alignment
enum CrossAxisAlignment { start, center, end, stretch, baseline }

/// Positioning types
enum PositionType { relative, absolute, fixed, sticky }

/// Content overflow behavior
enum OverflowBehavior { visible, hidden, scroll, fade, ellipsis }

// ===== SPACING & SIZING =====

/// Spacing scale for consistent padding/margin
enum Spacing {
  none, // 0
  xs, // 4px
  sm, // 8px
  md, // 16px
  lg, // 24px
  xl, // 32px
  xxl, // 48px
  xxxl, // 64px
}

/// Size presets for components
enum ComponentSize { mini, small, medium, large, extraLarge, jumbo }

/// Aspect ratio presets
enum AspectRatio {
  square, // 1:1
  portrait, // 3:4
  landscape, // 4:3
  widescreen, // 16:9
  ultrawide, // 21:9
}

// ===== BORDERS & SHAPES =====

/// Border radius levels
enum BorderRadiusLevel {
  none,
  small, // 4px
  medium, // 8px
  large, // 16px
  extraLarge, // 24px
  full, // 9999px (pill shape)
}

/// Border styles
enum BorderStyle { none, solid, dashed, dotted }

/// Border width levels
enum BorderWidth { none, thin, medium, thick }

// ===== ELEVATION & EFFECTS =====

/// Elevation/shadow levels
enum ElevationLevel {
  none,
  subtle,
  low,
  medium,
  high,
  extraHigh,
  floating, // For modals/overlays
}

/// Animation durations
enum AnimationDuration {
  instant, // 0ms
  fast, // 150ms
  normal, // 300ms
  slow, // 500ms
  slower, // 750ms
}

/// Animation curves/easing
enum AnimationCurve { linear, easeIn, easeOut, easeInOut, bounceIn, bounceOut }

// ===== FORM ELEMENTS =====

/// Input field states
enum InputFieldState {
  normal,
  focused,
  error,
  warning,
  success,
  disabled,
  readOnly,
}

/// Input field types
enum InputFieldType { text, email, password, number, search, url, multiline }

/// Form validation states
enum ValidationState { none, validating, valid, invalid, warning }

// ===== MEDIA & CONTENT =====

/// Avatar size types
enum AvatarSize {
  mini, // 16px
  small, // 24px
  medium, // 32px
  large, // 48px
  extraLarge, // 64px
  jumbo, // 96px
}

/// Image size enums
enum ImageSize {
  thumbnail, // 64px
  small, // 128px
  medium, // 256px
  large, // 512px
  extraLarge, // 1024px
  fullWidth, // 100% width
}

/// Image fit modes
enum ImageFit { contain, cover, fill, fitWidth, fitHeight, scaleDown }

// ===== ICONS & GRAPHICS =====

/// Icon position relative to text
enum IconPosition { left, right, top, bottom, iconOnly, textOnly }

/// Icon sizes
enum IconSize {
  mini, // 12px
  small, // 16px
  medium, // 20px
  large, // 24px
  extraLarge, // 32px
}

// ===== NAVIGATION & LAYOUT =====

/// Navigation styles
enum NavigationStyle { tabs, pills, breadcrumb, sidebar, bottomBar, drawer }

/// Modal/Dialog types
enum DialogType { alert, confirm, custom, fullscreen, bottomSheet, drawer }

/// Toast/Snackbar positions
enum ToastPosition {
  top,
  topLeft,
  topRight,
  bottom,
  bottomLeft,
  bottomRight,
  center,
}

/// Loading states
enum LoadingState { idle, loading, success, error, empty }

// ===== RESPONSIVE DESIGN =====

/// Breakpoint sizes for responsive design
enum Breakpoint {
  mobile, // <768px
  tablet, // 768px-1024px
  desktop, // 1024px-1440px
  widescreen, // >1440px
}

/// Display modes for responsive visibility
enum DisplayMode {
  block,
  inline,
  flex,
  grid,
  none, // Hidden
  responsive, // Conditional display
}

// ===== ACCESSIBILITY =====

/// Focus indicator styles
enum FocusStyle { system, outline, ring, underline, background }

/// Semantic roles for accessibility
enum SemanticRole {
  button,
  link,
  heading,
  text,
  image,
  list,
  listItem,
  navigation,
}
