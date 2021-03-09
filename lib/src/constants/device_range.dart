enum DeviceRange { SMALL, MEDIUM, LARGE }

extension DeviceRangeExtension on DeviceRange {
  DeviceRange getRange(double maxWidth) {
    if (maxWidth > 1440)
      return DeviceRange.LARGE;
    else if (maxWidth > 660) return DeviceRange.MEDIUM;

    return DeviceRange.SMALL;
  }

  /// Return a number of items to display in a grid view.
  int get gridCount {
    switch (this) {
      case DeviceRange.LARGE:
        return 4;
      case DeviceRange.MEDIUM:
        return 3;
      case DeviceRange.SMALL:
      default:
        return 2;
    }
  }
}
