/* Text Rain: Reimplementaion by Marlena Abraham
 * Credit where it's due:
 * -Tutorial from Daniel Shiffman about Capture
 * -Talked with John Ozbay about implementation ideas and libraries
 * -Capture library documentation on Processing.org
 */
import processing.video.*;
Capture cam;
Letter[] drops;
int dropsLength;
PImage prevFrame;
int sWidth = 1200;
int sHeight = 800;
int threshold = 140;
String inputString = "Welcome to TextRain.";
char[] inputLetters;

void setup() {
  String[] cameras = Capture.list();

  drops = new Letter[inputString.length()];//[inputString.length()];
  int inc = sWidth/inputString.length();
  int spawnPos = 5;
  inputLetters = new char[inputString.length()];
  splitString();
  
  for(int i = 0; i < inputLetters.length; i++) {
    Letter testLetter = new Letter(inputLetters[i]);
    testLetter.xpos = spawnPos;
    drops[i] = testLetter;
    spawnPos += inc;
  }

  if (cameras.length == 0) {
    println("There are no cameras available...");
    size(400, 400);
    exit();
  }
  else {
    println("Availaable cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, sWidth, sHeight);
    cam.start();
    cam.loadPixels();
    
    size(sWidth, sHeight); 
    //prevFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height);
  }
  dropsLength = drops.length;
}

void splitString() {
  for(int i = 0; i < inputString.length(); i++) {
    inputLetters[i] = inputString.charAt(i);
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  } 
  set(0, 0, cam);
  for (int i = 0; i < dropsLength; i++) {
    //println(drops[i].textLetter);
    //println("LOCS: x = " + drops[i].xpos + ", y = " + drops[i].ypos);
    if(drops[i].ypos < sHeight) {    
      int loc = drops[i].xpos + (drops[i].ypos*sWidth);
      float bright = brightness(cam.pixels[loc]);
      if(bright > threshold) {
        println("YAY: " + bright);
        drops[i].dropLetter();
        drops[i].upSpeed = 1;
      }
      else {
        println("NO: " + bright);
        if(drops[i].ypos > 0) {
          int aboveLoc = loc = drops[i].xpos + ((drops[i].ypos)-1)*sWidth;
          float aboveBright = brightness(cam.pixels[aboveLoc]);
          if(aboveBright < threshold) {
            println("LIFT");
            drops[i].liftLetter();
            drops[i].upSpeed = drops[i].upSpeed * 2;
          }
        }
      }
    }
   
    drops[i].drawLetter();
    cam.updatePixels();
  }
}

