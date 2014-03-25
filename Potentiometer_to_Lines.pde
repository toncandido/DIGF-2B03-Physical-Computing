
/*OCAD U - DIGF-2B03-Physical-Computing Student Ton Candido 2519551 
Lab 5 - Using a Potentiometer to control Processing
base code from:
http://arduino.cc/en/Tutorial/Graph

*/

// Graphing sketch
// This program takes ASCII-encoded strings
// from the serial port at 9600 baud and graphs them. It expects values in the
// range 0 to 1023, followed by a newline, or newline and carriage return

// Created 20 Apr 2005
// Updated 18 Jan 2008
// by Tom Igoe
// This example code is in the public domain.

import processing.serial.*;
int linPx=0;
float col = random(255);

Serial myPort;        // The serial port
int xPos = 1;         // horizontal position of the graph

void setup () {
  // set the window size:
  size(600, 500);        

  // List all the available serial ports
  println(Serial.list());
  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[9], 9600);
  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');
  // set inital background:
  background(0);
}
void draw () {
  // everything happens in the serialEvent()
}

void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    float inByte = float(inString); 
    inByte = map(inByte, 0, 1023, 0, 255);
    println(inByte);


    fill(inByte+random(inByte), 255+random(-inByte, 255), inByte+col);
    rect(0, 0, width, height);

    line(inByte+linPx, 0, inByte+linPx, height);
    line(inByte, 0, inByte, height);
    line(0, inByte, width, inByte);
    line(0, inByte+linPx, width, inByte+linPx);

    line(0, inByte+linPx+20, width, inByte+linPx+20);

    if (inByte<200) {
      linPx++;
    }
    else {
      linPx--;
    }
  }
}
