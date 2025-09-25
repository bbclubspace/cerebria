import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFontSizes {
  static double _scaleFactor() {
    final screenWidth = ScreenUtil().screenWidth;

    if (kIsWeb) {
      if (screenWidth >= 1400) return 1.2;
      if (screenWidth >= 1000) return 1.0;
      return 1.2;
    }

    if (screenWidth >= 900) {
      return 0.40;
    } else if (screenWidth >= 600) {
      return 1.0;
    } else {
      return 1.0;
    }
  }

  /// Sabit fontlar (projede en çok kullanılanlar)
  static double get s12 => (12 * _scaleFactor()).sp;
  static double get s14 => (14 * _scaleFactor()).sp;
  static double get s16 => (16 * _scaleFactor()).sp;
  static double get s18 => (18 * _scaleFactor()).sp;
  static double get s20 => (20 * _scaleFactor()).sp;
  static double get s22 => (22 * _scaleFactor()).sp;
  static double get s24 => (24 * _scaleFactor()).sp;
  static double get s30 => (30 * _scaleFactor()).sp;
  static double get s40 => (40 * _scaleFactor()).sp;

  /// Dinamik font (gerektiğinde özel boyut çağırmak için)
  static double custom(double baseFontSize) =>
      (baseFontSize * _scaleFactor()).sp;
}
