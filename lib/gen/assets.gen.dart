/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bell.svg
  String get bell => 'assets/icons/bell.svg';

  /// File path: assets/icons/calendar.svg
  String get calendar => 'assets/icons/calendar.svg';

  /// File path: assets/icons/chevron-left.svg
  String get chevronLeft => 'assets/icons/chevron-left.svg';

  /// File path: assets/icons/credit-card.svg
  String get creditCard => 'assets/icons/credit-card.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/heart1.svg
  String get heart1 => 'assets/icons/heart1.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/location-marker.svg
  String get locationMarker => 'assets/icons/location-marker.svg';

  /// File path: assets/icons/map.svg
  String get map => 'assets/icons/map.svg';

  /// File path: assets/icons/user.svg
  String get user => 'assets/icons/user.svg';

  /// File path: assets/icons/wifi.svg
  String get wifi => 'assets/icons/wifi.svg';

  /// List of all assets
  List<String> get values => [
        bell,
        calendar,
        chevronLeft,
        creditCard,
        heart,
        heart1,
        home,
        locationMarker,
        map,
        user,
        wifi
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/birds.png
  AssetGenImage get birds => const AssetGenImage('assets/images/birds.png');

  /// File path: assets/images/business.png
  AssetGenImage get business =>
      const AssetGenImage('assets/images/business.png');

  /// File path: assets/images/cake-shop.png
  AssetGenImage get cakeShop =>
      const AssetGenImage('assets/images/cake-shop.png');

  /// File path: assets/images/doctors.png
  AssetGenImage get doctors => const AssetGenImage('assets/images/doctors.png');

  /// File path: assets/images/girl.jpeg
  AssetGenImage get girl => const AssetGenImage('assets/images/girl.jpeg');

  /// File path: assets/images/keys.png
  AssetGenImage get keys => const AssetGenImage('assets/images/keys.png');

  /// File path: assets/images/man.jpeg
  AssetGenImage get man => const AssetGenImage('assets/images/man.jpeg');

  /// File path: assets/images/saloon.png
  AssetGenImage get saloon => const AssetGenImage('assets/images/saloon.png');

  /// File path: assets/images/telegram.webp
  AssetGenImage get telegram =>
      const AssetGenImage('assets/images/telegram.webp');

  /// List of all assets
  List<AssetGenImage> get values =>
      [birds, business, cakeShop, doctors, girl, keys, man, saloon, telegram];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
