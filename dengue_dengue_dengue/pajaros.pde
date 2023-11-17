/*

Midi

PAJAROS

Cambiar el "int growth" (Mapeo de 1 a 400)
Cambiar el "int pajaroGiro" (Napeo de 40 a 100)

*/

PImage[] pajaroVerde = new PImage[3]; // --> Declaro an array of PImage with a size of 5
float pajaroValor = random(0, 100);

//////////////////////// Variables

// Pajaro 1
float pajaroGiro = 20;
float pajaroSize = 50;
float growth = 1;

float aumentoPajaroGiro = 8;

float pajaroFrameRate = 2;

void setupPajaros() {
  pajaroGiro = 100;
  pajaroSize = 50;
  growth = 1;
  
  pajaroVerde[0] = loadImage("pajaro 1 verde glow violeta.png");
  pajaroVerde[1] = loadImage("pajaro 1 verde glow rojo.png");
  pajaroVerde[2] = loadImage("pajaro 2 naranja.png");
}

boolean comienzoPajaros = true;
void drawPajaros() {
  if (comienzoPajaros) setupPajaros();
  comienzoPajaros = false;
  
  pajaroVerde();
}


void pajaroVerde() {
  //imageMode(CENTER);
  
  // frameRate(pajaroFrameRate);
  //////// Pajaro 1 verde girando
  imageMode(CORNER);
  
  translate((width / 2),(height / 2));
  rotate(radians(pajaroGiro));
  pajaroGiro = pajaroGiro + aumentoPajaroGiro;
  
  
  if (pajaroValor < random(100)) {
    image(pajaroVerde[2], 0, 0, pajaroSize, pajaroSize);
  } else {
    image(pajaroVerde[1], 0, 0, pajaroSize, pajaroSize);
  }
  
  pajaroSize = pajaroSize + growth;

  if (pajaroSize > 500) pajaroSize = 50;
  //image(pajaroVerde[1], 0, 0, 400, 400);
  // resetMatrix(); // Esto hace que solo se dibuje 1 pajaro cuando es con el controller no se por que
}
