
class NumberDraw {
  String getSvgByNumber(int index) {
    return 'assets/numbers/$index.svg';
  }

  String getSvgByLyrics(int letra) {
    switch (letra) {
      case 0:
        return 'assets/numbers/A.svg';
      case 1:
        return 'assets/numbers/B.svg';
      case 2:
        return 'assets/numbers/C.svg';
      case 3:
        return 'assets/numbers/D.svg';
      case 4:
        return 'assets/numbers/E.svg';
      case 5:
        return 'assets/numbers/F.svg';
      case 6:
        return 'assets/numbers/G.svg';
      case 7:
        return 'assets/numbers/H.svg';
      case 8:
        return 'assets/numbers/I.svg';
      case 9:
        return 'assets/numbers/J.svg';
      case 10:
        return 'assets/numbers/K.svg';
      case 11:
        return 'assets/numbers/L.svg';
      case 12:
        return 'assets/numbers/M.svg';
      case 13:
        return 'assets/numbers/N.svg';
      case 14:
        return 'assets/numbers/O.svg';
      case 15:
        return 'assets/numbers/P.svg';
      case 16:
        return 'assets/numbers/Q.svg';
      case 17:
        return 'assets/numbers/R.svg';
      case 18:
        return 'assets/numbers/S.svg';
      case 19:
        return 'assets/numbers/T.svg';
      case 20:
        return 'assets/numbers/U.svg';
      case 21:
        return 'assets/numbers/V.svg';
      case 22:
        return 'assets/numbers/W.svg';
      case 23:
        return 'assets/numbers/X.svg';
      case 24:
        return 'assets/numbers/Y.svg';
      case 25:
        return 'assets/numbers/Z.svg';
      default:
        return 'assets/numbers/A.svg';
    }
  }
}