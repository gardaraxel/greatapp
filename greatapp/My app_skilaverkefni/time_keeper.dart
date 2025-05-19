class TimeKeeper {
  late final String name;
  Duration elapsed = Duration.zero;
  DateTime? _startTime;

  bool get isRunning => _startTime != null;

  void start() {
    _startTime = DateTime.now();
  }

  void stop() {
    if (_startTime != null) {
      elapsed += DateTime.now().difference(_startTime!);
      _startTime = null;
    }
  }

  String formattedTime() {
    final total =
        isRunning ? elapsed + DateTime.now().difference(_startTime!) : elapsed;
    return total.toString().split('.').first;
  }
}
