class Letter {
  int xpos;
  int ypos;  
  String textLetter;
  Letter(String inputText) {
    xpos = 100;
    ypos = 20;
    textLetter = inputText;
    textSize(32); 
  }
  void drawLetter() {
    fill(#591818);
    text(textLetter, xpos, ypos);
  }
  
  void updateLetter() {
    ypos++;
  }
  
  
}
