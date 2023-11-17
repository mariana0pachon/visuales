/*
limpia todo ----------------> r
fotico ---------------------> f
play/pause -----------------> espacio
tamaño ---------------------> t
angulo ---------------------> a
dimension esfera/circulo ---> d

click para empezar una flor en cualquier lugar
*/

boolean play = true;

int bgHue = 360;

float florX = width / 2;
float florY = height / 2;
int n = 0; // numero del punto en la flor
int c = 10; // espacio entre puntos en la flor

boolean flor3D = true; // cuando es true hace esferas, cuando es false hace circulos

float[] angles = {137.5, 137.3, 137.6};
int angleIdx = 0;

float florSize = 5;

void setupCaleidoscopio() {
  // colorMode(HSB, 360, 100, 100);
  background(bgHue);
  florX = width / 2;
  florY = height / 2;
}

boolean comienzoCaleidoscopio = true;
void drawCaleidoscopio() {
  if (comienzoCaleidoscopio) setupCaleidoscopio();
  comienzoCaleidoscopio = false;
  
  if (play) {
    flor();
  }
}

float florMaxColors = 360;
// phyllotaxis: https://www.youtube.com/watch?v=KWoJgHFYWxY&t=48s
void flor() {
  float angle = n * radians(angles[angleIdx]);
  float radius = c * sqrt(n);
  
  float x = cos(angle) * radius + florX;
  float y = sin(angle) * radius + florY;
  
  // noFill();
  // stroke(n % 360, 255, 255);
  noStroke();
  fill(n % florMaxColors, 255, 255, 30);
  // stroke(255);
  
  
  // println(flor3D);
  //if (flor3D) {
  //  translate(x, y, 0);
  //  sphere(c * florSize);
  //}
  //else {
    circle(x, y, c * florSize);
  //}
  
  n++;
}

// void keyPressed() {
//   // play / pause
//   if (key == ' ') {
//     play = !play;
//   }
  
//   // reset
//   if (key == 'r') { 
//     florX = width / 2;
//     florY = height / 2;
    
//     clear();
//   }
  
//   // mode
//   if (key == 'a') {
//     if (angleIdx < angles.length - 1) angleIdx++;
//     else angleIdx = 0;
    
//     clear();
//   }
// }

void clear() {
  // background(bgHue);
  fill(bgHue);
  rectMode(CENTER);
  rect(width / 2, height / 2, width, height);
  // n = 0;
  // play = true;
}

void mousePressed() {
  florX = mouseX;
  florY = mouseY;
  n = 0;
}

void florRandomLocation() {
  florX = random(0, width);
  florY = random(0, height);
  n = 0;
}
