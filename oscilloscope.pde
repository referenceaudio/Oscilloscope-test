  
import processing.sound.*;
SoundFile file;
Amplitude amp;
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(640, 360);
  background(0);
    
  file = new SoundFile(this, "sample.wav");
  file.play();
  amp = new Amplitude(this);
  amp.input(file);
  fft = new FFT(this, bands);
   fft.input(file);
}      

void draw() {
  fft.analyze(spectrum);

  for(int i = 0; i < bands; i++){

  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  line( i, height, i, height - spectrum[i]*height*5 );
  } 
  
  ellipse(320, 130, fft.analyze()*height*5, amp.analyze()*100);
}
