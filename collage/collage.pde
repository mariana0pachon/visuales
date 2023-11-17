PImage pantera;
float panteraWidth;
float panteraHeight;

PImage nube;
float nubeWidth;
float nubeHeight;

PImage panteraRosa;
float panteraRosaWidth;
float panteraRosaHeight;

int seconds = 0;

void setup() {
  size(900, 600);
  background(#F85E00);
  
  imageMode(CENTER);
  
  pantera = loadImage("pantera.png");
  panteraWidth = pantera.width;
  panteraHeight = pantera.height;
  
  nube = loadImage("nube_rosa.png");
  nubeWidth = nube.width;
  nubeHeight = nube.height;
  
  panteraRosa = loadImage("pantera_rosa.png");
  panteraRosaWidth = panteraRosa.width;
  panteraRosaHeight = panteraRosa.height;
}

void draw() {
  // background(255);
  stars(1000);
  
  camino();
  sol();
  pantera();
  panteraRosa();
  
  seconds++;
}


float caminoX = 0;
void camino() {
  if (caminoX > width) caminoX = 0;
  caminoX++;
  
  float caminoY = sin(seconds * 0.1) * 15 + height - caminoX;
  
  // fill(#588157);
  // circle(caminoX, caminoY, caminoY / 5);
  image(nube, caminoX, caminoY, nubeWidth / 10, nubeHeight / 10);
}

float solY = 0;
float solDir = random(0.5, 0.8);
void sol() {
  float solX = sin(seconds * 0.01) * 80 + width / 3;
  solY += solDir;
  
  if (solY >= height / 1.5) solDir = random( -0.8, -0.5);
  if (solY <= 0) solDir = random(0.5, 0.8);
  
  fill(#E1D09A);
  circle(solX, solY, solY / 5);
}

void pantera() {
  image(pantera, width / 2, height / 2, panteraWidth / 2, panteraHeight / 2);
}

void panteraRosa() {
  float x = width - panteraRosaWidth / 10 + 45;
  float y = height / 1.5;
  image(panteraRosa, x, y, panteraRosaWidth / 10, panteraRosaHeight / 10);
  image(panteraRosa, x - 20, y + 20, panteraRosaWidth / 20, panteraRosaHeight / 20);
  image(panteraRosa, x - 30, y + 30, panteraRosaWidth / 30, panteraRosaHeight / 30);
}

void stars(int amount) {
  for (int i = 0; i < amount; i++) {
    noStroke();
    fill(#F85E00);
    circle(random(width), random(height), 2);
  }
}

float florX = width / 2;
float florY = height / 2;
int n = 0; // numero del punto en la flor
int c = 10; // espacio entre puntos en la flor
void flor() {
  float angle = seconds * radians(137.5);
  float radius = c * sqrt(n);
  
  float x = cos(angle) * radius + florX;
  float y = sin(angle) * radius + florY;
  
  noStroke();
  fill(seconds % 360, 255, 255, 30);
  
  translate(x, y, 0);
  sphere(c * 20);
  
  n++;
}
