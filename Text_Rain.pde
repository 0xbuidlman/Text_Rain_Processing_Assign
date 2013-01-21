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
  size(800, 800); 
  String[] cameras = Capture.list();
  println("Starting");

  Letter testLetter = new Letter("a");
  drops = new Letter[1];
  drops[0] = testLetter;

  if (cameras.length == 0) {
    println("There are no cameras available...");
    exit();
  }
  else {
    println("Availaable cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
    cam.loadPixels();
    prevFrame.copy(cam, 0, 0, cam.width, cam.height, 0, 0, cam.width, cam.height);
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
    int loc = drops[i].xpos + drops[i].ypos*cam.width;
    color 
    
    
    drops[i].updateLetter();
    
  }
  //image(cam, 0, 0);
}

