class Letter {
  int xpos;
  int ypos;  
  String textLetter;
  Letter(String inputText) {
    xpos = 100;
    ypos = 0;
    textLetter = inputText;
    textSize(32); 
  }
  
  void updateLetter() {
    text(textLetter, xpos, ypos);
    ypos++;
  }
  
  
}
