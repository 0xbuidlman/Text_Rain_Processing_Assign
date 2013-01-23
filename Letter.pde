class Letter {
  int xpos;
  int ypos;  
  char textLetter;
  int upSpeed;
  Letter(char inputText) {
    xpos = 100;
    ypos = 20;
    textLetter = inputText;
    textSize(16);
    upSpeed = 1; 
  }
  void drawLetter() {
    fill(#591818);
    text(textLetter, xpos, ypos);
  }
  
  void dropLetter() {
    ypos++;
  }
  
  void liftLetter() {
    println("*******lift");
    int newY = ypos - upSpeed;
    if(newY >= 0) {
      ypos = newY; 
    }
    else {
      ypos = 0; 
    }
  }
  
}
