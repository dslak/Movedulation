void drawTracks(){
  
  stroke(255);
  strokeWeight(1);
  
  
  line( width-10, 30, width-50, 30);
  line( width-30, 10, width-30, 50);
  
  line( 10, 30, 50, 30);
  line( 30, 10, 30, 50);
  
  
  noStroke();
  fill(255,100);
  
  ellipse( (width-60)+map(sAdxlXL,0,255,10,50), 30, 10, 10);
  ellipse( width-30, map(sAdxlYL,0,255,10,50), 10, 10);
  
  ellipse(map(sAdxlXR,0,255,10,50), 30, 10, 10);
  ellipse(30, map(sAdxlYR,0,255,10,50), 10, 10);
  
  stroke(255,100);
  noFill();
  ellipse(10,60,10,10);
  ellipse(23,60,10,10);
  ellipse(36,60,10,10);
  ellipse(49,60,10,10);
  
  ellipse(width-10,60,10,10);
  ellipse(width-23,60,10,10);
  ellipse(width-36,60,10,10);
  ellipse(width-49,60,10,10);
  
  
  fill(255,150);
  
  switch(sButtonR){
  case 3:
  ellipse(width-10,60,10,10);
  break;
  case 2:
  ellipse(width-23,60,10,10);
  break;
  case 1:
  ellipse(width-36,60,10,10);
  break;
  case 0:
  ellipse(width-49,60,10,10);
  break;
  }
  
  switch(sButtonL){
  case 0:
  ellipse(10,60,10,10);
  break;
  case 1:
  ellipse(23,60,10,10);
  break;
  case 2:
  ellipse(36,60,10,10);
  break;
  case 3:
  ellipse(49,60,10,10);
  break;
  }
  
}


void timeElapsed(){
  
  long seconds = (millis()-millisDiff)/1000;
  
  textSize(12);
  fill(255);
  textAlign(RIGHT);
  text(round(seconds/60), width-70, height-30); 
  text(":", width-64, height-30); 
  textAlign(LEFT);
  text(round(seconds%60), width-63, height-30); 
  text(round((seconds/60)/2.5), width-30, height-30); 
}



void drawWaves(){
  
  stroke(255,50);
  
  line(0, (height/3), width, (height/3));
  line(0, ((height/3)*2), width, ((height/3)*2));
  
  stroke(255,sAdxlYR/2);
  strokeWeight(1);
  
  for( int i = 0; i < out.bufferSize()-1; i++ ){
    
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    
    line(x1, height/3 + out.left.get(i)*20, x2, height/3 + out.left.get(i+1)*20);
    line(x1, (height/3)*2 + out.right.get(i)*20, x2, (height/3)*2 + out.right.get(i+1)*20);
    
  } 
}
