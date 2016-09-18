class FactsOfAPeriod {
  StringList sl = new StringList();
  int indexOfChosen = 0;

  void FactsOfAPeriod() {
  }

  void addAns(String s) {
    String stmp = "";
    if (s != "") {
      if (s.substring(s.length()-1, s.length()) == ".") {
        stmp = s.substring(0, s.length()-1);
      } else {        
        stmp = s;
      }
    }
    //bugs here, i cant delete the "."
    if (stmp != "") {
      sl.append(stmp);
      sl.lower();
      indexOfChosen = int(random(0, sl.size()));
    }
  }

  String getProb() {
    if (sl.size() != 0) {
      return sl.get(indexOfChosen);
    } else {
      return "";
    }
  }
}

