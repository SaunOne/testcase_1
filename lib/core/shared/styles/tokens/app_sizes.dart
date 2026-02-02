/// Size tokens - Single source of truth for component sizes
///
/// Gunakan tokens ini untuk ukuran komponen (icon, avatar, button height, dll)
abstract final class AppSizes {
  const AppSizes._();

  // ═══════════════════════════════════════════════════════════════════════════
  // ICON SIZES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Icon extra small - 12px
  static const double iconXs = 12;

  /// Icon small - 16px
  static const double iconSm = 16;

  /// Icon medium - 20px (default)
  static const double iconMd = 20;

  /// Icon large - 24px
  static const double iconLg = 24;

  /// Icon extra large - 32px
  static const double iconXl = 32;

  /// Icon extra extra large - 48px
  static const double iconXxl = 48;

  // ═══════════════════════════════════════════════════════════════════════════
  // AVATAR SIZES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Avatar extra small - 24px
  static const double avatarXs = 24;

  /// Avatar small - 32px
  static const double avatarSm = 32;

  /// Avatar medium - 40px (default)
  static const double avatarMd = 40;

  /// Avatar large - 48px
  static const double avatarLg = 48;

  /// Avatar extra large - 64px
  static const double avatarXl = 64;

  /// Avatar extra extra large - 80px
  static const double avatarXxl = 80;

  /// Avatar hero - 120px (profile page)
  static const double avatarHero = 120;

  // ═══════════════════════════════════════════════════════════════════════════
  // BUTTON HEIGHTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Button small - 32px
  static const double buttonSm = 32;

  /// Button medium - 40px
  static const double buttonMd = 40;

  /// Button large - 48px (default)
  static const double buttonLg = 48;

  /// Button extra large - 56px
  static const double buttonXl = 56;

  // ═══════════════════════════════════════════════════════════════════════════
  // INPUT HEIGHTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Input small - 40px
  static const double inputSm = 40;

  /// Input medium - 48px (default)
  static const double inputMd = 48;

  /// Input large - 56px
  static const double inputLg = 56;

  // ═══════════════════════════════════════════════════════════════════════════
  // CHIP / TAG SIZES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Chip small - 24px
  static const double chipSm = 24;

  /// Chip medium - 32px (default)
  static const double chipMd = 32;

  /// Chip large - 40px
  static const double chipLg = 40;

  // ═══════════════════════════════════════════════════════════════════════════
  // TOUCH TARGETS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Minimum touch target - 44px (iOS HIG)
  static const double touchTargetMin = 44;

  /// Recommended touch target - 48px (Material)
  static const double touchTarget = 48;

  // ═══════════════════════════════════════════════════════════════════════════
  // LAYOUT SIZES
  // ═══════════════════════════════════════════════════════════════════════════

  /// App bar height
  static const double appBarHeight = 56;

  /// Bottom nav height
  static const double bottomNavHeight = 64;

  /// Tab bar height
  static const double tabBarHeight = 48;

  /// Divider thickness
  static const double dividerThin = 0.5;
  static const double divider = 1;
  static const double dividerThick = 2;

  /// Border width
  static const double borderThin = 0.5;
  static const double border = 1;
  static const double borderMedium = 1.5;
  static const double borderThick = 2;

  // ═══════════════════════════════════════════════════════════════════════════
  // MAX WIDTHS (for responsive layouts)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Max content width for mobile
  static const double maxWidthMobile = 480;

  /// Max content width for tablet
  static const double maxWidthTablet = 720;

  /// Max content width for desktop
  static const double maxWidthDesktop = 1200;

  /// Max modal width
  static const double maxModalWidth = 400;

  /// Max dialog width
  static const double maxDialogWidth = 320;
}
