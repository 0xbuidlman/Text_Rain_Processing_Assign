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

void setup() {
  String[] cameras = Capture.list();
  println("Starting");

  Letter testLetter = new Letter("a");
  drops = new Letter[1];
  drops[0] = testLetter;

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
    cam = new Capture(this, 1200, 800);
    cam.start();
    cam.loadPixels();
    
    size(1200, 800); 
    //prevFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height);
  }
  dropsLength = drops.length;
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  } 
  set(0, 0, cam);
  for (int i = 0; i < dropsLength; i++) {
    //println(drops[i].textLetter);
    //println("LOCS: x = " + drops[i].xpos + ", y = " + drops[i].ypos);  
    int loc = drops[i].xpos + (drops[i].ypos*1200);
    fill(#222222);
    rect(drops[i].xpos, drops[i].ypos, 50, 50);
    //color 
    float bright = brightness(cam.pixels[loc]);
    //println(bright + ", " + loc);
    if(bright > 100) {
      println("YAY: " + bright);
      drops[i].updateLetter(); 
    }
    else {
      println("NO: " + bright);
    }
    //filter(THRESHOLD, 0.5);
    //drops[i].updateLetter();
    drops[i].drawLetter();
    cam.updatePixels();
  }
  //image(cam, 0, 0);
}

