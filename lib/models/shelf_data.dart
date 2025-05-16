class ShelfData {
  String? productName;
  Duration? remainingTime;
  bool isActive;
  bool isExpired;
  bool isFlashing;

  ShelfData({
    this.productName,
    this.remainingTime,
    this.isActive = false,
    this.isExpired = false,
    this.isFlashing = false,
  });
}
