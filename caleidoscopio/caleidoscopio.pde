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

boolean tresD = true; // cuando es true hace esferas, cuando es false hace circulos

float[] angles = {137.5, 137.3, 137.6};
int angleIdx = 0;

float[] radiuses = {20, 5};
int radiusIdx = 0;

void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 360, 100, 100);
  background(bgHue);
  florX = width / 2;
  florY = height / 2;
}

void draw() {
  if (play) {
    flor();
  }
}

// phyllotaxis: https://www.youtube.com/watch?v=KWoJgHFYWxY&t=48s
void flor() {
  float angle = n * radians(angles[angleIdx]);
  float radius = c * sqrt(n);
  
  float x = cos(angle) * radius + florX;
  float y = sin(angle) * radius + florY;
  
  // noFill();
  // stroke(n % 360, 255, 255);
  noStroke();
  fill(n % 360, 255, 255, 30);
  // stroke(255);
  
  if (tresD) {
    translate(x, y, 0);
    sphere(c * radiuses[radiusIdx]);
  }
  else {
    circle(x, y, c * radiuses[radiusIdx]);
  }
  
  n++;
}

void keyPressed() {
  // play / pause
  if (key == ' ') {
    play = !play;
  }
  
  // reset
  if (key == 'r') { 
    florX = width / 2;
    florY = height / 2;
    
    clear();
  }
  
  // mode
  if (key == 'a') {
    if (angleIdx < angles.length - 1) angleIdx++;
    else angleIdx = 0;
    
    clear();
  }
  
  //tamaño
  if (key == 't') {
    if (radiusIdx < radiuses.length - 1) radiusIdx++;
    else radiusIdx = 0;

    clear();
  }
  
  //cambio de dimension: esfera o circulos
  if (key == 'd') {
    tresD = !tresD;
    
    clear();
  }
  
  // fotico
  if (key == 'f') {
    save("fotico_" + day() + month() + year() + hour() + minute() + second() + ".tga");
  }
}

void clear() {
  background(bgHue);
  n = 0;
  play = true;
}

void mousePressed() {
  florX = mouseX;
  florY = mouseY;
  n = 0;
}
