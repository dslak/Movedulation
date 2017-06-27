#include <SPI.h>
#include <Mirf.h>
#include <nRF24L01.h>
#include <MirfHardwareSpiDriver.h>

int btnR[]={A1,3,2};
int btnL[]={A6,A7,10};

int adxlR[]={A3,A2};
int adxlL[]={A4,A5};

int btnStatusR=0;
int btnStatusL=0;

void setup(){
  
  pinMode(btnR[1],INPUT);
  pinMode(btnR[2],INPUT);
  pinMode(btnL[2],INPUT);

  

  
  Serial.begin(9600);
  
  while (!Serial);
   
  Mirf.cePin = 8;
  Mirf.csnPin = 9;
  Mirf.spi = &MirfHardwareSpi;
  
  Mirf.init();
  Mirf.setRADDR((byte *)"c0001");
  Mirf.payload = 6;
  Mirf.channel = 95;
  Mirf.config();
  
}


void loop(){ 

  
  digitalWrite(btnR[1],LOW);
  digitalWrite(btnR[2],LOW);
  digitalWrite(btnL[2],LOW);

  
  /*
  for(int i=0;i<3;i++){
    if(digitalRead(btnR[i])==HIGH){
      btnStatusR=i+1;
    }
  }
  for(int i=0;i<3;i++){
    if(digitalRead(btnL[i])==HIGH){
      btnStatusL=i+1;
    }
  }
  */

  if(analogRead(btnR[0])>10){btnStatusR=3;}
  if(digitalRead(btnR[1])==1){btnStatusR=1;}
  if(digitalRead(btnR[2])==1){btnStatusR=2;}
  
  if(analogRead(btnL[0])>10){btnStatusL=1;}
  if(analogRead(btnL[1])>10){btnStatusL=2;}
  if(digitalRead(btnL[2])==1){btnStatusL=3;}

  

   byte data[] = {analogRead(adxlR[0])/2,
                  analogRead(adxlR[1])/2,
                  analogRead(adxlL[0])/2,
                  analogRead(adxlL[1])/2,
                  btnStatusR,
                  btnStatusL};


    if(!Mirf.isSending()){
      Mirf.setRADDR((byte *)"c0001");
      Mirf.send((byte *) data);
    }
    
    if(!Mirf.isSending()){
      Mirf.setRADDR((byte *)"c0002");
      Mirf.send((byte *) data);
    }



   for(int i=0; i<6; i++){
     Serial.print(data[i]);
     Serial.print("\t");
   }
   //Serial.print(digitalRead(btnL[2]));
   Serial.println();


delay(10);

}




