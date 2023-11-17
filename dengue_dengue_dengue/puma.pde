/* Cosas a alterar:

Distribucion de los cuadrados --> "int distribucionCuadrados" (Mapeo de 2-100)
Direccion --> "int direccion" (Mapeo de 2-300)

Tamanos --> "int size1" (Mapeo de 400-1000)
Tamanos --> "int size2" (Mapeo de 400-1000)
color rojo de la cuadricula --> "int r" (mapeo de 0-255);
*/



PImage pumaCompleto;
PImage pumaCabeza;
PImage pumaCuerpo;
PImage pataDelante;
PImage pataAtras;
PImage pumaCola;

//PImage camaleon;


//float escenaPuma = 2;


// Cabeza
float cabezaW = 1080 / 2;
float cabezaH = 768 / 2;



// Pata D
float pataDW = 1080 / 2;
float pataDH = 768 / 2;


// Pata A
float pataAW = 1080 / 2;
float pataAH = 768 / 2;


// Cuerpo
float cuerpoW = 1080 / 2;
float cuerpoH = 768 / 2;


// Cola
float colaW = 1080 / 2;
float colaH = 768 / 2;


// Variables midi

float tiempo = 0;
float direccion = 2;

float size1 = 400;
float size2 = 400;

float distribucionCuadrados = 2;
float r = 40;



void setupPuma() {
  
  // size(1080, 768);
  // imageMode(CENTER);
  //frameRate(6);
  
  pumaCompleto = loadImage("pumaCompleto.png");
  pumaCabeza = loadImage("pumaCabeza.png");
  pumaCuerpo = loadImage("pumaCuerpo.png");
  pataDelante = loadImage("pataDelante.png");
  pataAtras = loadImage("pataAtras.png");
  pumaCola = loadImage("pumaCola.png");
  //camaleon = loadImage("Camaleon.png");
}


boolean comienzoPuma = true;
void drawPuma() {
  if (comienzoPuma) setupPuma();
  comienzoPuma = false;
  
  imageMode(CENTER);
  
  // Escena 1 PUMA COMPLETO
  //if (escenaPuma == 1) {
    
  //  int rows = height; // Number of rows
  //  int cols = width; // Number of columns
    
  //  int sizeX = 50; // Size of each square
  //  int sizeY = 50; // Size of each square
    
  //  for (int i = 0; i < rows; i++) {
  //    for (int j = 0; j < cols; j++) {
        
  //      // Calculate the position of each square
        
  //      float x = j * sizeX;
  //      float y = i * sizeY;
        
  //      // Draw alternating squares
        
  //      if ((i + j) % distribucionCuadrados == 0) {
  //        fill(r, 48, 245);
  //      } else {
  //        fill(255); // White
  //      }
        
  //      rect(x, y, sizeX, sizeY);
  //    }
  //  }
    
  //  //image(pumaCompleto, width/2, (height/2)+50, 400, 400);
  //}
  
  //if (escenaPuma == 2) {
    
    //Cabeza
    image(pumaCabeza, cabezaW, cabezaH + 50, size1, size1);
    tint(255, 100);
    
    cabezaW = cabezaW - direccion;
    cabezaH = cabezaH - direccion;
    
    
    //Pata delantera
    image(pataDelante, pataDW, pataDH + 50, size1, size2);
    tint(255);
    pataDW = pataDW + direccion;
    pataDH = pataDH - direccion;
    
    
    image(pumaCuerpo, cuerpoW, cuerpoH + 50, size1, size1);
    
    cuerpoW = cuerpoW + direccion;
    cuerpoH = cuerpoH + direccion;
    
    image(pataAtras, pataAW, pataAH + 50, size2, size1);
    
    pataAW = pataAW - direccion;
    pataAH = pataAH + direccion;
    
    image(pumaCola, colaW, colaH + 50, size2, size2);
    
    colaW = colaW - direccion;
    colaH = colaH - direccion;
    
    tiempo = tiempo + 1;
    
    //cabezaSize = cabezaSize + medidaN;
    
    if (cabezaW < 0) {
      cabezaW = 0;
      cabezaH = 20;
      direccion = - direccion;
    }
    
    if(cabezaH > height){
    cabezaH = 0;
    direccion = - direccion;
    }
    
  //}
  
  //if (escenaPuma == 3) {
    
  //  image(camaleon, random(width), random(height), 500, 200);
  //  image(camaleon, random(width), random(height), 200, 200);
    
  //  for (int i = 0; i < 20; i++) {
      
  //    noFill();
  //    strokeWeight(random(4));
  //    circle(random(width), random(height), random(0, height));
  //  }
    
  //  image(camaleon, random(height), random(height), 200, 200);
  //}
}




//void keyPressed() {
  
//  if (key == '1') {
//    escenaPuma = 1;
//  }
  
  
//  if (key == '2') {
//    escenaPuma = 1;
//    escenaPuma = 2;
//  }
  
//  if (key == '3') {
//    //escenaPuma = 2;
//    escenaPuma = 3;
//  }
//}
