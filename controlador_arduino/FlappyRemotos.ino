#include <Gamepad.h>
//#include "Keyboard.h"
#include "IRRemoteControl.h"

// IR
IRRecv irRecv;
IRSend irSend;
const int IR_RECV_PIN = 7;
const int MAX_IR_BUFFER_LENGTH = 650;
unsigned int irBuffer[MAX_IR_BUFFER_LENGTH];
int currentIrBufferLength = 0;

unsigned long currentMillis;
unsigned int delay_to_receive = 50; 
unsigned int elapsed_millis = 0;
boolean isPressed = false;

//Initializing a Gamepad
Gamepad gp;

void setup() {
//  Keyboard.begin();

  // IR
  irRecv.start(IR_RECV_PIN, irBuffer, MAX_IR_BUFFER_LENGTH, currentIrBufferLength);

  currentMillis = millis();
}

void loop() {
  elapsed_millis = millis() - currentMillis;
  // IR
  if (currentIrBufferLength > 0 ) {
    irRecv.stop(IR_RECV_PIN);
     currentMillis = millis();

    if(elapsed_millis > delay_to_receive) {
      if(!isPressed) {
        gp.setButtonState(0, true);

        // Keyboard.println("Puto Franco");
//        Keyboard.write(32);

        isPressed = true;
      }
    }
    
    
    irRecv.start(IR_RECV_PIN, irBuffer, MAX_IR_BUFFER_LENGTH, currentIrBufferLength);
  } else {
    if(elapsed_millis > delay_to_receive) {
      // restore isPressed
      isPressed = false;  
      gp.setButtonState(0, false);
    }  
  }
}
