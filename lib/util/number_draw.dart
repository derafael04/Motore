
class NumberDraw {
  String getSvgByNumber(int index) {
    return 'assets/numbers/$index.svg';
  }

  String getSvgByLyrics(int letra) {
    switch (letra) {
      case 0:
        return 'assets/alphabet/A.svg';
      case 1:
        return 'assets/alphabet/B.svg';
      case 2:
        return 'assets/alphabet/C.svg';
      case 3:
        return 'assets/alphabet/D.svg';
      case 4:
        return 'assets/alphabet/E.svg';
      case 5:
        return 'assets/alphabet/F.svg';
      case 6:
        return 'assets/alphabet/G.svg';
      case 7:
        return 'assets/alphabet/H.svg';
      case 8:
        return 'assets/alphabet/I.svg';
      case 9:
        return 'assets/alphabet/J.svg';
      case 10:
        return 'assets/alphabet/K.svg';
      case 11:
        return 'assets/alphabet/L.svg';
      case 12:
        return 'assets/alphabet/M.svg';
      case 13:
        return 'assets/alphabet/N.svg';
      case 14:
        return 'assets/alphabet/O.svg';
      case 15:
        return 'assets/alphabet/P.svg';
      case 16:
        return 'assets/alphabet/Q.svg';
      case 17:
        return 'assets/alphabet/R.svg';
      case 18:
        return 'assets/alphabet/S.svg';
      case 19:
        return 'assets/alphabet/T.svg';
      case 20:
        return 'assets/alphabet/U.svg';
      case 21:
        return 'assets/alphabet/V.svg';
      case 22:
        return 'assets/alphabet/W.svg';
      case 23:
        return 'assets/alphabet/X.svg';
      case 24:
        return 'assets/alphabet/Y.svg';
      case 25:
        return 'assets/alphabet/Z.svg';
      default:
        return 'assets/alphabet/A.svg';
    }
  }
}