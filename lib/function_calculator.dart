class FunctionCalculator {
  double calculate(double x) {
    if (x == 0) {
      throw ArgumentError('x не може бути рівним 0');
    }
    return x - 1 / (x * x) + 1 / (3 * x);
  }
}

