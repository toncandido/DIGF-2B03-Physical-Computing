/* OCAD U - DIGF-2B03-Physical-Computing Student Ton Candido 2519551
LAB 5 - Rotating a Ball in Processing to Arduino

Base code from:
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 14-5: Rectangle rotating around center
*/

import processing.serial.*;
Serial port;

void setup() {
  size(400, 400);
  println("Available serial ports:");
  println(Serial.list());

  port = new Serial(this, Serial.list()[4], 9600);
}

void draw() {
  background(255);
  stroke(0);
  fill(175);

  // Translate origin to center
  translate(width/2, height/2);

  // The greek letter, theta, is often used as the name of a variable to store an angle
  // The angle ranges from 0 to PI, based on the ratio of mouseX location to the sketch's width.
  float theta = PI*mouseX/width-1; // width; 

  // Rotate by the angle theta
  rotate(theta);

  // Display rectangle with CENTER mode
  rectMode(CENTER);
  ellipse(-80, -80, 50, 50);
  float m = map(theta, -1, 2.12, 0, 100);

  int angProcess = round(m); 
  port.write(angProcess);
  println(angProcess);
}
