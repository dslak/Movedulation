import processing.serial.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;

//MultiChannelBuffer sampleBuffer1;
//MultiChannelBuffer sampleBuffer2;
//MultiChannelBuffer sampleBuffer3;
//MultiChannelBuffer sampleBuffer4;
//MultiChannelBuffer sampleBuffer5;

//Sampler sampler1;
//Sampler sampler2;
//Sampler sampler3;
//Sampler sampler4;
//Sampler sampler5;

FilePlayer groove1;
FilePlayer groove2;
FilePlayer groove3;
FilePlayer sample1;
FilePlayer sample2;
FilePlayer sample3;

Oscil wave_1;
Oscil wave_2;

Pan pan1;
Pan pan2;
Delay myDelay;


BandPass filt1;
BandPass filt2;
Oscil osc;
Oscil osc2;
Oscil cutOsc;
Oscil cutOsc2;
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
  
  //sampler1.trigger();
  //out.addSignal(wave_1);
  //out.addSignal(wave_2);
  //wave_1.patch( out );
  //wave_2.patch( out );

  
  while(millis()<5000){}
 
 
}

void draw() {
  
  
  //background(0);
  //printDebug();
  //  pushMatrix();
  //translate(200, 0, 1);
  smooth();
  fill(0,30);
  rect(0, 0, width, height);
  //popMatrix();


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




/*
  float passBand = constrain(map(adxl[5], 20, 255, 40, 1000),1,5000);
  filt.setFreq(passBand);
  float bandWidth = constrain(map(adxl[2], 20, 255, 10, 1000),1,5000);
  filt.setBandWidth(bandWidth);
  filt.printCoeff();
  */
  
  


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