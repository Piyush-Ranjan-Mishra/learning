
class Utils {
  Utils._() {
    // isMobile = MediaQuery.of(context).size.width <= 500;
    // isTablet =       MediaQuery.of(context).size.width > 500 &&
    //   MediaQuery.of(context).size.width <= 900;
    // isWeb = MediaQuery.of(context).size.width > 900;
  }

  static final Utils instance = Utils._();
  bool isMobile, isTablet, isWeb;

  static Iterable<double> range(double start, [double high, double step]) sync* {
    while (start <= high) {
      yield start;
      start += step;
    }
  }
}
