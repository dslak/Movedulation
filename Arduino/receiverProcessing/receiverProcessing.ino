#include <SPI.h>
#include <Mirf.h>
#include <nRF24L01.h>
#include <MirfHardwareSpiDriver.h>

void setup(){
  Serial.begin(9600);
  
  Mirf.cePin = 8;
  Mirf.csnPin = 9;
  Mirf.spi = &MirfHardwareSpi;
  
  Mirf.init();
  Mirf.setRADDR((byte *)"c0002");
  Mirf.payload = 6;
  Mirf.channel = 95;
  Mirf.config();
  
  //Serial.println("Listening..."); 
  
}

void loop(){ 
  
   byte data[6];
     
   if(!Mirf.isSending() && Mirf.dataReady()){
       
   Mirf.getData((byte *) &data);
          
   for(int i=0; i<6; i++){
     Serial.print(data[i]);
     Serial.print("\t");
   }
   Serial.println();
     }
}





