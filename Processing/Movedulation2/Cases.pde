float ampMod=0.5;

void silent(){
  waveR0_1.setAmplitude(0);
  waveR0_2.setAmplitude(0);
  
  waveR0_1.unpatch(out);
  waveR0_1.unpatch(out);
  
  waveR1_1.unpatch(out);
  cutOsc_1.unpatch(out);

  sample1.pause();
  sample2.pause();
  sample3.pause();
  
}



//############################################################################################################################### CASE 0
void case0R(){

waveR0_1.setFrequency( map( sAdxlXL, 20, 255, 1, 20 )*10);
waveR0_2.setFrequency( map( sAdxlXR, 20, 255, 1, 1 )*5);

if((sButtonL!=sButtonL_prev)){
switch(sButtonL){
  case 1: 
    waveR0_2.setWaveform( Waves.TRIANGLE );
    ampMod=2;
  break;
  case 2:
    waveR0_2.setWaveform( Waves.SQUARE );
    ampMod=0.8;
  break;
  case 3:
    waveR0_2.setWaveform( Waves.QUARTERPULSE );
    ampMod=0.8;
  break;
  default :
    waveR0_2.setWaveform( Waves.SINE );
    ampMod=1;
}
}

waveR0_1.setAmplitude( map( sAdxlYL, 20, 255, 0.9, 0 ));
waveR0_2.setAmplitude( map( sAdxlYR, 20, 255, ampMod, 0 ));

}





//############################################################################################################################### CASE 1
void case1R(){

  if((sButtonR!=sButtonR_prev)){
    
     if((sButtonR<sButtonR_prev)){
       cutOsc_1.unpatch(out);
       waveR1_1.unpatch(out);
       //sampler1.unpatch(out);
     }

    cutOsc_1.offset.setLastValue( 1000 );
    cutOsc_1.patch(filt1.cutoff);
    waveR1_1.patch(filt1).patch(out);
  
  }
 
  
    
if((sButtonL!=sButtonL_prev)){
  switch(sButtonL){
    
  case 1: 
    waveR1_1.setWaveform( Waves.QUARTERPULSE );
    ampMod=0.5;
  break;
  case 2:
    waveR1_1.setWaveform( Waves.SAW);
    ampMod=0.5;
  break;
  case 3:
    waveR1_1.setWaveform( Waves.SINE );
    ampMod=1;
  break;
  
  }
}


    float freq = map(sAdxlYL, 20, 255, 1, 50)*100;
    waveR1_1.setFrequency( freq );
    
    float freq2 = map(sAdxlYR, 20, 255, 1, 5)*10;
    cutOsc_1.setFrequency( freq2 );
    
    float amp = map(sAdxlXR, 20, 255, ampMod, 0);
    waveR1_1.setAmplitude( amp );
    
    out.setPan(map(sAdxlXL, 20, 255, -1, 1)); 
}



//############################################################################################################################### CASE 2
void case2R(){

  if((sButtonR!=sButtonR_prev)){
     //waveR1_1.patch(filt1).patch(out);
     if((sButtonR<sButtonR_prev)){
       //waveR1_1.unpatch(out);

        //sampler3.unpatch(out);
        //sampler4.unpatch(out);
        //sampler5.unpatch(out);
        
        sample1.pause();
        sample2.pause();
        sample3.pause();
     }
     
     //waveR1_2.patch( out );
     //waveR1_1.patch(filt1).patch(out);
     
    sample1.patch(filt3).patch( out );;
    sample2.patch(filt4).patch( out );;
    sample3.patch(out);
  }
  
  /*
  if((sButtonL!=sButtonL_prev)){
    waveR1_2.setAmplitude( map( sAdxlYL, 20, 255, 1, 0 ));
    .setAmplitude( map( sAdxlYR, 20, 255, 1, 0 ));
    
    sampler3.unpatch(out);
    sampler4.unpatch(out);
    sampler5.unpatch(out);
  }*/

    //waveR1_1.setFrequency( map( sAdxlXL, 20, 255, 5, 50 ));
    //waveR1_1.setAmplitude( map( sAdxlYR, 20, 255, 0.2, 0 ));
    
if((sButtonL!=sButtonL_prev)){
  switch(sButtonL){
    case 1: 
      sample1.rewind();
      sample1.loop();
    break;
    case 2:
      sample3.rewind();
      sample2.loop();
    break;
    case 3:
      sample3.rewind();
      sample3.loop();
    break;
    
  }
}


    float passBand1 = constrain(map(sAdxlYR, 20, 255, 40, 500),1,4000);
    filt3.setFreq(passBand1);
    float bandWidth1 = constrain(map(sAdxlYL, 20, 255, 10, 500),1,4000);
    filt3.setBandWidth(bandWidth1);
    
    float passBand2 = constrain(map(sAdxlXR, 20, 255, 40, 500),1,4000);
    filt4.setFreq(passBand2);
    float bandWidth2 = constrain(map(sAdxlXL, 20, 255, 10, 500),1,4000);
    filt4.setBandWidth(bandWidth2);

    
}


//############################################################################################################################### CASE 3
void case3R(){

 
  if((sButtonR!=sButtonR_prev)){
     //waveR1_1.patch(filt1).patch(out);
     if((sButtonR<sButtonR_prev)){
       cutOsc_1.unpatch(out);
       waveR1_1.unpatch(out);
       
       //sampler1.unpatch(out);
       //sampler2.unpatch(out);
       
       //sampler3.unpatch(out);
       //sampler4.unpatch(out);
       //sampler5.unpatch(out);
       
        sample1.pause();
        sample2.pause();
        sample3.pause();
     }
  }
     
     
     

if((sButtonL!=sButtonL_prev)){
  
       //sampler1.unpatch(out);
       //sampler2.unpatch(out);
       //groove1.pause();
       //groove2.pause();
       //groove3.pause();
       println("Change");
       
  switch(sButtonL){  
  case 1: 
     //sampler1.patch(filt2).patch( out );
     //sampler1.trigger();
      groove1.patch( out );
      groove1.loop();
  break;
  case 2:
     //sampler2.patch(filt2).patch( out );
     //sampler2.trigger();
     groove2.patch(filt5).patch( out );
     groove2.loop();
  break;
  case 3:
    groove3.patch(filt6).patch( out );
    groove3.loop();
  break;
  
  }
  }
  
  
  
 
 
    float passBand1 = constrain(map(sAdxlYR, 20, 255, 40, 400),1,400);
    filt5.setFreq(passBand1);
    float bandWidth1 = constrain(map(sAdxlYL, 20, 255, 10, 400),1,400);
    filt5.setBandWidth(bandWidth1);
    
    float passBand2 = constrain(map(sAdxlXR, 20, 255, 40, 400),1,400);
    filt6.setFreq(passBand2);
    float bandWidth2 = constrain(map(sAdxlXL, 20, 255, 10, 400),1,400);
    filt6.setBandWidth(bandWidth2);
    //filt1.printCoeff();
}