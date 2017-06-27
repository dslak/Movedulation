import processing.serial.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;

FilePlayer groove1;
FilePlayer groove2;
FilePlayer groove3;
FilePlayer sample1;
FilePlayer sample2;
FilePlayer sample3;

Oscil waveR0_1;
Oscil waveR0_2;

Delay myDelay;

BandPass filt1;
BandPass filt2;
BandPass filt3;
BandPass filt4;
BandPass filt5;
BandPass filt6;

Oscil waveR1_1;
Oscil waveR1_2;
Oscil cutOsc_1;
Oscil cutOsc_2;
Constant cutoff;

Serial myPort; 

long millisDiff=0;

float oldY1=0;
float oldY2=0;

int linefeed = 10;
int adxl[]={0,0,0,0,0,0}; 
int adxlOLD[]={0,0,0,0,0,0}; 

int sButtonL_prev=0;
int sButtonR_prev=0;
int sButtonL=0;
int sButtonR=0;
int sAdxlXL=0;
int sAdxlYL=0;
int sAdxlXR=0;
int sAdxlYR=0;


void setup(){
  //size(displayWidth, displayHeight, P3D);
  size(800, 600, P3D);
  background(0);
  
  myPort = new Serial(this, "/dev/ttyACM0", 9600);
  myPort.bufferUntil(linefeed);
  
  waveSetup();
  loadIntoBuffer();

  while(millis()<5000){}
 
 
}

void draw() {
  
 
  smooth();
  fill(0,30);
  rect(0, 0, width, height);

  if((millis()-millisDiff)<20000){
    textSize(40);
    fill(255, map((millis()-millisDiff),0,20000,250,0));
    text("mo{ve}dulation", (width/2)-145, height/2);
  }


  drawTracks();

  drawWaves();


switch(sButtonR){
  case 1: case1R();
  break;
  case 2: case2R();
  break;
  case 3: case3R();
  break;
  default : case0R();
}


sButtonL_prev=sButtonL;
sButtonR_prev=sButtonR;


}






void serialEvent(Serial myPort){ 
  String myString = myPort.readStringUntil(linefeed);
  if (myString != null) {
    myString = trim(myString);
    adxl = int(split(myString, '\t'));
    
    if(adxl.length==6){
      sButtonR=int(adxl[5]);
      sAdxlYR=int(constrain(map(adxl[0],130,190,0,255),0,255));
      sAdxlXR=int(constrain(map(adxl[1],130,200,0,255),0,255));
      sButtonL=int(adxl[4]);
      sAdxlYL=int(constrain(map(adxl[3],130,195,0,255),0,255));
      sAdxlXL=int(constrain(map(adxl[2],130,200,0,255),0,255));
    }
    
    
  } 
}





/*
void keyPressed() {
  if(keyCode==32){millisDiff=millis();}
}
*/