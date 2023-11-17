PImage camaleon;

void setupCamaleon() {
  
  // size(1080, 768);
  // imageMode(CENTER);
  //frameRate(6);
  
  pumaCompleto = loadImage("pumaCompleto.png");
  pumaCabeza = loadImage("pumaCabeza.png");
  pumaCuerpo = loadImage("pumaCuerpo.png");
  pataDelante = loadImage("pataDelante.png");
  pataAtras = loadImage("pataAtras.png");
  pumaCola = loadImage("pumaCola.png");
  camaleon = loadImage("Camaleon.png");
}

boolean comienzoCamaleon = true;

float camLength = 1;
float camWidth = 1;

void drawCamaleon() {
  //background(0);
      if (comienzoCamaleon) setupCamaleon();
  comienzoCamaleon = false;
  
      image(camaleon, random(width), random(height), camLength, camWidth);
    //image(camaleon, random(width), random(height), 200, 200);
    
    //for (int i = 0; i < 20; i++) {
      
      //noFill();
      //strokeWeight(random(4));
      //circle(random(width), random(height), random(0, height));
    //}
    
    //image(camaleon, random(height), random(height), 200, 200);
}
