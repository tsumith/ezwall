class Manager {
  static int _netAmount = 0;
  int amount = 0;
  static void addAmount(int amount) {
    _netAmount = _netAmount + amount;
  }

  static int getAmount() {
    return _netAmount;
  }

  static void spendAmount(int amount) {
    if (_netAmount >= amount) {
      _netAmount = _netAmount - amount;
    }
  }
}
