class Verse {
  String text = "";
  String reference = "";

  Verse(this.text) {
    int refPosition = text.lastIndexOf("(");
    if(refPosition >= 0) {
      reference = text.substring(refPosition + 1);
      reference = reference.replaceAll(RegExp(r'\)$'), "");
      // Roman numerals in the reference might be confusing to kids
      reference = reference.replaceAll(RegExp(r'^I '), "1 ");
      reference = reference.replaceAll(RegExp(r'^II '), "2 ");
      text = text.substring(0, refPosition-1).trim();
    } else {
      reference = "Unknown Verse";
    }
  }
}