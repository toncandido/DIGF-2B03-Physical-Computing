/*OCAD U - DIGF-2B03-Physical-Computing Student Ton Candido 2519551 
Lab 5 - Using a Potentiometer to control Processing
base code from:
http://arduino.cc/en/Tutorial/Graph
 
 //The circuit:
 Any analog input sensor is attached to analog in pin 0.
 
 created 2006
 by David A. Mellis
 modified 9 Apr 2012
 by Tom Igoe and Scott Fitzgerald
 
 This example code is in the public domain.
 
 */

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);
}

void loop() {
    map(A0, 0, 1023, 0, 255);
  // send the value of analog input 0:
  Serial.println(analogRead(A0));
  // wait a bit for the analog-to-digital converter 
  // to stabilize after the last reading:
  Serial.write(A0);               // send 1 to Processing
  delay(200);

}

