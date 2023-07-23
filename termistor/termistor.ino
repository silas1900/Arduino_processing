
#include <Thermistor.h> //INCLUSÃO DA BIBLIOTECA
 

Thermistor temp(1);
void setup() {
 Serial.begin(9600);
  delay(100);
}

void loop() {
  int temperatura = temp.getTemp();
 
  Serial.print(temperatura);
  Serial.println();
  
  delay(2500);

}
