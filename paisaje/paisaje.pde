int strokeCount = 100;
float grow;
float sunX;
float sunY;
float sunDiameter = 200;
int numeroEdificios = 100;
float[][] edificios = new float[numeroEdificios][4];

void setup() {
  size(700, 700, P3D);
  sunX = 150;
  sunY = 150;
  
  // edificiosCentrados();
  edificiosAbajo();
}

void draw() {
  grow = map(mouseX, 0, width, 0, 100);
  // System.out.println("x: " + mouseX + " y: " + mouseY);
  
  background(255);
  fondo();
  
  // fill(255);
  
  ciudad(edificios);
  
  noStroke();
  for (int i = strokeCount; i > 0; i--) {
    int opacity = 255 - i * 20;
    
    if (i % 2 == 0) fill(#D56C09, opacity);
    else fill(#F7C14E, opacity);
    
    noisyCircle(sunX, sunY, sunDiameter + i * 50);
  }
}

void fondo() {
  beginShape();
  fill(#1341E5);
  vertex(0,0);
  fill(#05299E);
  vertex(width, 0);
  fill(#FFC9B5);
  vertex(width, height / 4);
  fill(#F7B1AB);
  vertex(width, height / 2);
  fill(#5E4AE3);
  vertex(width, height);
  fill(#947BD3);
  vertex(0, height);
  endShape(CLOSE);
}

/*
Noisy circle:
circulo con bordes irregulares
gracias a https://openprocessing.org/sketch/112858/ y a nuestro amigo chatgpt
*/
void noisyCircle(float x, float y, float diameter) {
  float radius = diameter / 2 + grow;
  float noiseAmount = 30;
  
  strokeJoin(ROUND);
  
  beginShape();
  for (int i = 0; i < 100; i ++) {
    float currentX = x + cos(TWO_PI * i / 100) * radius;
    float currentY = y + sin(TWO_PI * i / 100) * radius;
    
    strokeWeight(8);
    if (i % 2 == 0) {
      float noisyX = currentX + noiseAmount;
      float noisyY = currentY + noiseAmount;      
      vertex(noisyX, noisyY);
    } else {
      vertex(currentX, currentY);
    }
  }
  endShape(CLOSE);
}

void edificiosCentrados() {
  int maxY = (int) random(sunY, sunY + sunDiameter / 2);
  for (int i = 0; i < numeroEdificios; i++) {
    int x = (int) random(sunX - sunDiameter / 2, sunX + sunDiameter / 2);
    int minY = (int) random(sunY - sunDiameter / 2, maxY); 
    
    edificios[i][0] = x;
    edificios[i][1] = minY;
    edificios[i][2] = x;
    edificios[i][3] = maxY;
  }
}

void edificiosAbajo() {
  int maxY = height; // todos los edificios empiezan desde abajo del todo
  for (int i = 0; i < numeroEdificios; i++) {
    int x = i * width / numeroEdificios;
    int minY = (int) random(height / 2, height); 
    
    edificios[i][0] = x;
    edificios[i][1] = minY;
    edificios[i][2] = x;
    edificios[i][3] = maxY;
  }
}

void ciudad(float[][] edificios) {
  float weight = map(grow, 0, 100, 5, 15);
  strokeWeight(weight);
  
  float opacity = map(grow, 0, 100, 10, 100);
  stroke(255, 255, 255, opacity);
  
  for (int i = 0; i < edificios.length; i++) {
    line(edificios[i][0], edificios[i][1] - grow, edificios[i][0], edificios[i][3] + grow);
  }
}
