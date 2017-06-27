
void waveSetup(){
  
  minim = new Minim( this );
  out   = minim.getLineOut(Minim.STEREO);
  
  wave_1 = new Oscil( 100, 0, Waves.SINE);
  wave_2 = new Oscil( 100, 0, Waves.TRIANGLE );

  //while(millis()<5000){}
  
  pan1 = new Pan(-1);
  pan2 = new Pan(1);
  //myDelay =new Delay(.04, 1, false, false);
  wave_1.patch( out );//patch( pan2 ).
  wave_2.patch( out );
  
  osc = new Oscil(100, 0.2, Waves.SAW);
  osc2 = new Oscil(1, 0.1, Waves.TRIANGLE);
  cutOsc = new Oscil(1, 800, Waves.SINE);
  cutOsc.offset.setLastValue( 1000 );
  
  filt1 = new BandPass(100, 100, out.sampleRate());
  filt2 = new BandPass(100, 100, out.sampleRate());
  
}


void loadIntoBuffer(){

  //sampleBuffer1 = new MultiChannelBuffer( 1, 1024 );
  //sampleBuffer2 = new MultiChannelBuffer( 1, 1024 );
  //sampleBuffer3 = new MultiChannelBuffer( 1, 1024 );
  //sampleBuffer4 = new MultiChannelBuffer( 1, 1024 );
  //sampleBuffer5 = new MultiChannelBuffer( 1, 1024 );
  
  println("Loading groove 1 ...");
  AudioRecordingStream stream1= minim.loadFileStream("groove_1.wav",1024,false);
  groove1 = new FilePlayer(stream1);
  
  println("Loading groove 2 ...");
  AudioRecordingStream stream2= minim.loadFileStream("groove_2.wav",1024,false);
  groove2 = new FilePlayer(stream2);
  
  println("Loading groove 3 ...");
  AudioRecordingStream stream3= minim.loadFileStream("groove_3.wav",1024,false);
  groove3 = new FilePlayer(stream3);
  
  println("Loading sample 1 ...");
  AudioRecordingStream streams1= minim.loadFileStream("sample1.wav",1024,false);
  sample1 = new FilePlayer(streams1);
  
  println("Loading sample 1 ...");
  AudioRecordingStream streams2= minim.loadFileStream("sample2.wav",1024,false);
  sample2 = new FilePlayer(streams2);
  
  println("Loading sample 3 ...");
  AudioRecordingStream streams3= minim.loadFileStream("sample3.wav",1024,false);
  sample3 = new FilePlayer(streams3);
  
  /*
  groove1 = minim.loadFile("groove_1.wav", 1024);
  println("Loading groove 2 ...");
  groove2 = minim.loadFile("groove_2.wav", 1024);
  println("Loading groove 3 ...");
  groove3 = minim.loadFile("groove_3.wav", 1024);*/
  
  //println("Loading groove 1 ...");
  //float sampleRate1 = minim.loadFileIntoBuffer( "groove_1.wav", sampleBuffer1 );
  //println("Loading groove 2 ...");
  //float sampleRate2 = minim.loadFileIntoBuffer( "groove_2.wav", sampleBuffer2 );
  //println("Loading sound 1 ...");
  //float sampleRate3 = minim.loadFileIntoBuffer( "note1.wav", sampleBuffer3 );
  //println("Loading sound 2 ...");
  //float sampleRate4 = minim.loadFileIntoBuffer( "note2.wav", sampleBuffer4 );
  //println("Loading sound 3 ...");
  //float sampleRate5 = minim.loadFileIntoBuffer( "note3.wav", sampleBuffer5 );
  
    //sampler1 = new Sampler( sampleBuffer1, sampleRate1, 1 );
    //sampler2 = new Sampler( sampleBuffer2, sampleRate2, 1 );
    //sampler3 = new Sampler( sampleBuffer3, sampleRate3, 1 );
    //sampler4 = new Sampler( sampleBuffer4, sampleRate4, 1 );
    //sampler5 = new Sampler( sampleBuffer5, sampleRate5, 1 );
    
    //sampler1.patch(filt).patch( out );
    //sampler2.patch(filt).patch( out );
    //sampler3.patch(filt).patch( out );
    //sampler4.patch(filt).patch( out );
    //sampler5.patch(filt).patch( out );

}