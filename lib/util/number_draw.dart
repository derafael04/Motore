
class NumberDraw {
  String getSvgByNumber(int index) {
    return 'assets/numbers/$index.svg';
  }

  String getSvgByLyrics(String letra) {
    return 'assets/alphabet/$letra.svg';
  }
}