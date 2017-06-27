
void waveSetup(){
  
  minim = new Minim( this );
  out   = minim.getLineOut(Minim.STEREO);
  
  waveR0_1 = new Oscil( 100, 0, Waves.SINE);
  waveR0_2 = new Oscil( 100, 0, Waves.TRIANGLE );

  //while(millis()<5000){}
  
  waveR0_1.patch( out );
  waveR0_2.patch( out );
  
  waveR1_1 = new Oscil(100, 0.2, Waves.SAW);
  waveR1_2 = new Oscil(1, 0.1, Waves.TRIANGLE);
  cutOsc_1 = new Oscil(1, 800, Waves.SINE);
  cutOsc_1.offset.setLastValue( 1000 );
  
  filt1 = new BandPass(200, 400, out.sampleRate());
  filt2 = new BandPass(200, 400, out.sampleRate());
  filt3 = new BandPass(200, 400, out.sampleRate());
  filt4 = new BandPass(200, 400, out.sampleRate());
  filt5 = new BandPass(200, 400, out.sampleRate());
  filt6 = new BandPass(200, 400, out.sampleRate());
  
}


void loadIntoBuffer(){

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
  

}