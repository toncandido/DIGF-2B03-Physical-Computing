// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h> 

Servo myservo;  // create servo object to control a servo 

int val;    // variable to read the value from the analog pin 
int ang;

void setup() 
{ 
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
  Serial.begin(9600);
} 

void loop() 
{ 


  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    ang = Serial.read();
  }

  val = analogRead(ang);            // reads the value of the potentiometer (value between 0 and 1023) 
  val = map(ang, 0, 100, 20, 100);     // scale it to use it with the servo (value between 20 and 100) 
  myservo.write(val);                  // sets the servo position according to the scaled value 
  delay(15);                           // waits for the servo to get there 
} 
